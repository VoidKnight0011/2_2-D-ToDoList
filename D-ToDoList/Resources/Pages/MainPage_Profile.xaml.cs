using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using D_ToDoList.Resources.Pages;
using D_ToDoList.Resources.Database;
using Microsoft.Maui;
using Microsoft.Maui.ApplicationModel;
using Microsoft.Maui.Controls;

namespace D_ToDoList.Resources.Pages;

public partial class MainPage_Profile : ContentPage
{
    private readonly ToDoDB _database;
    private readonly UserSession _session;
    public string dateToday { get; set; } = DateTime.Now.ToString("dddd,  MMMM d");
    
    
    public int completedTasks { get; set; }
    public int totalTasks { get; set; }
    public MainPage_Profile(ToDoDB database, UserSession session, int _completedTasks, int _totalTasks)
    {
        InitializeComponent();
        LoadingOverlay.IsVisible = true;
        _database = database;
        _session = session;
        totalTasks = _totalTasks;
        completedTasks = _completedTasks;
        BindingContext = this;
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();
        ThemePicker.SelectedIndex = _session.CurrentUser.preferredTheme switch
        {
            "Light" => 0,
            "Dark" => 1,
            _ => 2
        };
        LoadingOverlay.IsVisible = false;
    }

    public string Username => _session.CurrentUser?.userName ?? "Unknown";
    public string DisplayName => _session.CurrentUser?.displayName ?? string.Empty;
    public string Email => _session.CurrentUser?.userEmail ?? string.Empty;
    public string Password => _session.CurrentUser?.password ?? "";
    public DateTime AccountCreatedDate => _session.CurrentUser?.userCreated ?? DateTime.Now;
    
    public double taskPercentage => totalTasks == 0 ? 0 : Math.Min(100, ((double)completedTasks / totalTasks) * 100);
    
    public void TogglePassword(Object sender, EventArgs e)
    {
        UserPass.IsPassword = !UserPass.IsPassword;

        TogglePsswd.Source = UserPass.IsPassword ? "icon_closedeye.png" : "icon_openeye.png";
    }
    
    private void ToTasks(object sender, TappedEventArgs e) => Navigation.PopAsync();
    
    public async void LogOut(Object? sender, EventArgs e)
    {
        bool answer = await DisplayAlertAsync("Log Out", "Are you sure?", "Yes", "No");
        if(answer){
            var database = IPlatformApplication.Current.Services.GetService<ToDoDB>();
            var session = IPlatformApplication.Current.Services.GetService<UserSession>();
            session.CurrentUser = null;
            Application.Current.MainPage = new NavigationPage(new LoginPage(database));
        }
    }

    public async void ToggleTheme(Object sender, EventArgs e)
    {
        var picker = sender as Picker;

        if (picker.SelectedIndex == 0)
        {
            _session.CurrentUser.preferredTheme = "Light";
            Application.Current.UserAppTheme = AppTheme.Light;
        } else if (picker.SelectedIndex == 1) {
            _session.CurrentUser.preferredTheme = "Dark";
            Application.Current.UserAppTheme = AppTheme.Dark;
        } else if (picker.SelectedIndex == 2) {
            _session.CurrentUser.preferredTheme = "Unspecified";
            Application.Current.UserAppTheme = AppTheme.Unspecified;
        }

        await _database.UpdateTheme(_session.CurrentUser);
    }
    
    public async void OnFieldChanged(Object sender, TextChangedEventArgs e)
    {
        if (e.OldTextValue != null)
        {
            await SaveBtn.FadeTo(1, 500, Easing.SinIn);
            SaveBtn.IsVisible = true;
        }
    }

    private string _errorText;
    public string ErrorText
    {
        get => _errorText;
        set { 
            _errorText = value; 
            OnPropertyChanged(nameof(ErrorText)); 
        }
    }
    public async void SaveProfile(Object sender, EventArgs e)
    {
        _session.CurrentUser.userName = UserName.Text;
        _session.CurrentUser.password = UserPass.Text;
        _session.CurrentUser.displayName = UserDisplay.Text;
        
        var existingEmail = await _database.GetUserByEmail(UserEmail.Text);
        if (existingEmail != null)
        {
            ErrorLabel.IsVisible = true;
            ErrorText = "Email already exists!";
            return;
        }
        _session.CurrentUser.userEmail = UserEmail.Text;
        await _database.UpdateUserProfile(_session.CurrentUser);
        
        OnPropertyChanged(nameof(DisplayName));
        
        ErrorLabel.IsVisible = false;
        await SaveBtn.FadeToAsync(0, 500, Easing.SinOut);
        SaveBtn.IsVisible = false;
    }
}