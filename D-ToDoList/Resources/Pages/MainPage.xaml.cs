using System.Collections.ObjectModel;
using Android.Net.Wifi.Hotspot2.Pps;
using Android.Widget;
// using Android.Widget;
using Microsoft.Maui.ApplicationModel;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Graphics;
using D_ToDoList.Resources.Database;
using D_ToDoList.Resources.Pages;
using Microsoft.Maui;
using Button = Microsoft.Maui.Controls.Button;

namespace D_ToDoList;

public partial class MainPage : ContentPage
{
    public ObservableCollection<ToDoClass> tasks { get; set; } = new();
    public string dateToday { get; set; } = DateTime.Now.ToString("dddd,  MMMM d");
    private int _completedTasks = 0;
            public int completedTasks 
            { 
                get => _completedTasks;
                set 
                {
                    _completedTasks = value;
                    OnPropertyChanged(nameof(completedTasks));
                    OnPropertyChanged(nameof(taskPercentage));
                    OnPropertyChanged(nameof(statusString));
                }
            }
            public int totalTasks => tasks.Count;
            public double taskPercentage => totalTasks == 0 ? 0 : Math.Min(100, ((double)completedTasks / totalTasks) * 100);

            public string statusString
            {
                get
                {
                    if (totalTasks == 0) return "No Tasks Yet!";
                    int rem = totalTasks - completedTasks;
                    return completedTasks < totalTasks ? $"{rem} Task{(rem > 1 ? "s" : string.Empty)} Remaining!" : "All Tasks Completed!";
                }
            }
            

            public async void ToggleTheme(Object? sender, EventArgs e)
            {
                await toggleButton.RotateTo(180, 200, Easing.SpringIn);

                if (Application.Current.RequestedTheme == AppTheme.Dark)
                {
                    toggleButton.ImageSource = "icon_sun.png";
                    Application.Current.UserAppTheme = AppTheme.Light;
                }
                else
                {
                    toggleButton.ImageSource = "icon_moon.png";
                    Application.Current.UserAppTheme = AppTheme.Dark;
                }

                foreach (var t in tasks)
                    t.RefreshColors();

                await toggleButton.RotateTo(0, 200, Easing.SpringOut);
                FilterList();
            }
        
        protected override async void OnAppearing()
        {
            base.OnAppearing();
                        
            var dbTasks = await _database.GetAll();
            toggleButton.ImageSource = Application.Current.RequestedTheme == AppTheme.Dark ? "icon_moon.png" 
                : "icon_sun.png";
            
            tasks.Clear();
            foreach (var t in dbTasks)
            {
                tasks.Add(t);
            }
                        
            completedTasks = tasks.Count(t => t.isChecked);
            OnPropertyChanged(nameof(totalTasks));
            OnPropertyChanged(nameof(taskPercentage));
            OnPropertyChanged(nameof(statusString));
                        
            FilterList();
        }
        
        private readonly ToDoDB _database;
                    public MainPage(ToDoDB database)
                    {
                        InitializeComponent();
                        Application.Current.UserAppTheme = AppTheme.Unspecified;
                        BindingContext = this;
                        _database = database;
                    }
    
                    
    public async void TaskAdd(Object sender, EventArgs e)
    {
        if (!string.IsNullOrWhiteSpace(taskTitle.Text))
        {
            var newTask = new ToDoClass
            {
                title = taskTitle.Text,
                isChecked = false,
                dateCreated = DateTime.Now
            };
            await _database.Insert(newTask);
            tasks.Add(newTask);
            
            
            OnPropertyChanged(nameof(totalTasks));
            OnPropertyChanged(nameof(taskPercentage));
            OnPropertyChanged(nameof(statusString));
            
            taskTitle.Text = string.Empty;
            taskTitle.Unfocus();
            FilterList();
        }
    }
    
    public async void TaskEdit(Object sender, EventArgs e)
    {
        var btn = sender as Button;
        var task = btn?.CommandParameter as ToDoClass;
        if (task == null) return;
        
        await Navigation.PushAsync(new MainPage_TaskEdit(task, _database));
    }
    public async void TaskDelete(Object? sender, EventArgs e)
    {
        var btn = sender as Button;
        var task = btn?.CommandParameter as ToDoClass;
        if (task == null) return;
        
        bool answer = await DisplayAlert("Delete Task", "Are you sure?", "Yes", "No");
        if (answer)
        {
            await _database.Delete(task);
            tasks.Remove(task);
            OnPropertyChanged(nameof(totalTasks));
            OnPropertyChanged(nameof(taskPercentage));
            OnPropertyChanged(nameof(statusString));
            FilterList();
        }
    }

    public async void TaskCheck(Object? sender, EventArgs e)
    {
        var btn = sender as Button;
        var task = btn?.CommandParameter as ToDoClass;
        if (task == null) return;

        task.isChecked = !task.isChecked;
        if (task.isChecked) completedTasks++;
        else completedTasks--;
    
        await _database.Update(task);
        FilterList();
    }
    
    public ObservableCollection<ToDoClass> filtered { get; set; } = new();
    public string activeFilter { get; set; } = "All";
    public void FilterList()
    {
        filtered.Clear();
        foreach (var t in tasks)
        {
            if(activeFilter == "All") filtered.Add(t);
            else if(activeFilter == "Active" && !t.isChecked) filtered.Add(t);
            else if(activeFilter == "Done" && t.isChecked) filtered.Add(t);
        }
        
    }

        public void FilterAll(Object? sender, EventArgs e)
        {
            activeFilter = "All";
            FilterList();
        }
        
        public void FilterActive(Object? sender, EventArgs e)
        {
            activeFilter = "Active";
            FilterList();
        }
        public void FilterDone(Object? sender, EventArgs e)
        {
            activeFilter = "Done";
            FilterList();
        }
    
    
}