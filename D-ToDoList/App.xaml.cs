using Microsoft.Extensions.DependencyInjection;
using Microsoft.Maui.Controls;
using D_ToDoList.Resources.Pages;
using D_ToDoList.Resources.Database;

namespace D_ToDoList;

public partial class App : Application
{
    public App()
    {
        Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("Ngo9BigBOggjHTQxAR8/V1JGaF1cXmhKYVF+WmFZfVhgc19EZ1ZVQmYuP1ZhSXxVdkdhX39Zc3BQR2JbWUB9XEA=");
        InitializeComponent();
    }

    protected override Window CreateWindow(IActivationState? activationState)
    {
        var database = IPlatformApplication.Current.Services.GetService<ToDoDB>();
        return new Window(new NavigationPage(new LoginPage(database)));
    }
}