namespace D_ToDoList;

public partial class MainPage : ContentPage
{
    public string dateToday { get; set; } = DateTime.Now.ToString("dddd, MMMMd");

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
        
    }
    public void TaskEdit(Object sender, EventArgs e)
        {
            
        }
    public void TaskDelete(Object sender, EventArgs e)
    {
        
    }
    
    
}