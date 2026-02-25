using System.Collections.ObjectModel;
// using Android.Widget;
using Microsoft.Maui.ApplicationModel;

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
            public double taskPercentage => totalTasks == 0 ? 0 : ((double)completedTasks / totalTasks) * 100;

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

    public void TaskCheck(Object sender, EventArgs e)
    {
        completedTasks++;
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
            
        }
    public void TaskDelete(Object sender, EventArgs e)
    {
        
    }
    
    
}