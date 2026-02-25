namespace D_ToDoList;

public partial class MainPage : ContentPage
{
    public string dateToday { get; set; } = DateTime.Now.ToString("dddd, MMMMd");
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
            public int totalTasks { get; set; } = 5;
            public double taskPercentage => ((double)completedTasks / (double)totalTasks) * 100;
            public string statusString => (completedTasks<totalTasks) ? $"{totalTasks - completedTasks} Remaining!" : "All Tasks Completed! You Did It.";
            

        public void ToggleTheme(Object sender, EventArgs e)
    {
        
    }
    public MainPage()
    {
        InitializeComponent();
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