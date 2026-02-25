using Android.Widget;
using Microsoft.Maui.ApplicationModel;

namespace D_ToDoList;

public partial class MainPage : ContentPage
{
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
            public int totalTasks { get; set; } = 12;
            public double taskPercentage => ((double)completedTasks / (double)totalTasks) * 100;
            public string statusString => (completedTasks<totalTasks) ? $"{totalTasks - completedTasks} Remaining!" : "All Tasks Completed! You Did It.";
            

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
    public void TaskEdit(Object sender, EventArgs e)
        {
            
        }
    public void TaskDelete(Object sender, EventArgs e)
    {
        
    }
    
    
}