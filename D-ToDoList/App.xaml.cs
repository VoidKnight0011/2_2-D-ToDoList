using Microsoft.Extensions.DependencyInjection;

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
        return new Window(new AppShell());
    }
}