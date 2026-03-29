using Microsoft.Maui.Controls;
using D_ToDoList.Resources.Services;
using Microsoft.Maui.Storage;

namespace D_ToDoList.Resources.Pages;

public partial class MainPage_Profile : ContentPage
{
    private readonly APIService _database;
    private readonly UserSession _session;

    public string dateToday { get; set; } = DateTime.Now.ToString("dddd,  MMMM d");
    public int completedTasks { get; set; }
    public int totalTasks { get; set; }
    public double taskPercentage => totalTasks == 0 ? 0 : Math.Min(100, ((double)completedTasks / totalTasks) * 100);
    
    public string DisplayName => $"{_session.CurrentUser?.fname} {_session.CurrentUser?.lname}";
    public string Email       => _session.CurrentUser?.email ?? string.Empty;
    public string JoinDate    => _session.CurrentUser?.timemodified ?? string.Empty;
    public string FirstName => _session.CurrentUser?.fname ?? string.Empty;
    public string LastName  => _session.CurrentUser?.lname ?? string.Empty;

    public MainPage_Profile(APIService database, UserSession session, int _completedTasks, int _totalTasks)
    {
        InitializeComponent();
        _database = database;
        _session = session;
        completedTasks = _completedTasks;
        totalTasks = _totalTasks;
        BindingContext = this;
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();
        
        var saved = Preferences.Get("AppTheme", "System");
        ThemePicker.SelectedIndex = saved switch
        {
            "Light" => 0,
            "Dark"  => 1,
            _       => 2
        };
        OnPropertyChanged(nameof(DisplayName));
    }

    public void ToggleTheme(object sender, EventArgs e)
    {
        var picker = sender as Picker;
        var (themeName, appTheme) = picker.SelectedIndex switch
        {
            0 => ("Light", AppTheme.Light),
            1 => ("Dark",  AppTheme.Dark),
            _ => ("System", AppTheme.Unspecified)
        };

        Application.Current.UserAppTheme = appTheme;
        Preferences.Set("AppTheme", themeName);
    }

    private void ToTasks(object sender, TappedEventArgs e) => Navigation.PopAsync();

    public async void LogOut(object? sender, EventArgs e)
    {
        bool answer = await DisplayAlert("Log Out", "Are you sure?", "Yes", "No");
        if (!answer) return;

        var database = IPlatformApplication.Current.Services.GetService<APIService>();
        var session  = IPlatformApplication.Current.Services.GetService<UserSession>();
        session.CurrentUser = null;
        Application.Current.MainPage = new NavigationPage(new LoginPage(database));
    }
}