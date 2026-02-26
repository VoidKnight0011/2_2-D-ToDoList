using System.Collections.ObjectModel;
// using Android.Widget;
using Microsoft.Maui.ApplicationModel;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Graphics;

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
            

        public void ToggleTheme(Object? sender, EventArgs e)
        {
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
        }
        
        protected override void OnAppearing()
        {
            base.OnAppearing();
            toggleButton.ImageSource = Application.Current.RequestedTheme == AppTheme.Dark 
                ? "icon_moon.png" 
                : "icon_sun.png";
        }
        
                    public MainPage()
                    {
                        InitializeComponent();
                        Application.Current.UserAppTheme = AppTheme.Unspecified;
                        BindingContext = this;
                    }

    public void TaskCheck(Object? sender, EventArgs e)
    {
        var btn = sender as Button;
        var task = btn.CommandParameter as ToDoClass;

        task.isChecked = !(task.isChecked);
        btn.BackgroundColor = task.isChecked ? Color.FromArgb("#4169E1") : Colors.Transparent;
        if (task.isChecked) completedTasks++;
        else completedTasks--;
        
        Console.WriteLine($"taskPercentage: {taskPercentage}, completed: {completedTasks}, total: {totalTasks}");
    }

    public void TaskAdd(Object sender, EventArgs e)
    {
        if (!string.IsNullOrWhiteSpace(taskTitle.Text))
        {
            tasks.Add(new ToDoClass
            {
                title = taskTitle.Text,
                id = tasks.Count + 1
            });
            
            OnPropertyChanged(nameof(totalTasks));
            OnPropertyChanged(nameof(taskPercentage));
            OnPropertyChanged(nameof(statusString));
            
            taskTitle.Text = string.Empty;
            taskTitle.Unfocus();
        }
    }
    
    public void TaskEdit(Object sender, EventArgs e)
    {
        var btn = sender as Button;
        var task = btn.CommandParameter as ToDoClass;
        task.isEditing = !(task.isEditing);
    }
    public async void TaskDelete(Object? sender, EventArgs e)
    {
        var btn = sender as Button;
        var task = btn.CommandParameter as ToDoClass;
        
        bool answer = await DisplayAlert("Delete Task", "Are you sure?", "Yes", "No");
        if (answer) tasks.Remove(task);
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