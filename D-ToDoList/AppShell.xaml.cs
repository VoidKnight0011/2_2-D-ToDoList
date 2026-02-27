using D_ToDoList.Resources.Pages;

namespace D_ToDoList;

public partial class AppShell : Shell
{
    public AppShell()
    {
        InitializeComponent();
        Routing.RegisterRoute(nameof(MainPage_TaskEdit), typeof(D_ToDoList.Resources.Pages.MainPage_TaskEdit));
    }
}