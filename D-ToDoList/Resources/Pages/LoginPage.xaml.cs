using System;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using Microsoft.Maui;
using Microsoft.Maui.Controls;
using Microsoft.Maui.ApplicationModel;
using Microsoft.Maui.Graphics;
using Button = Microsoft.Maui.Controls.Button;
using D_ToDoList.Resources.Database;

namespace D_ToDoList.Resources.Pages;

public partial class LoginPage : ContentPage
{
    private readonly ToDoDB _database;
    public LoginPage(ToDoDB db)
    {
        InitializeComponent();
        _database = db;
        NavigationPage.SetHasNavigationBar(this, false);
        BindingContext = this;
    }

    public async void SignUp(Object? sender, EventArgs e)
    {
        await LoggingBorder.TranslateToAsync(400, 0, 300, Easing.SpringIn);
        SignInPage.IsVisible = false;
        SignUpPage.IsVisible = true;
        await LoggingBorder.TranslateToAsync(0, 0, 550, Easing.SpringOut);
    }

    public async void SignIn(Object? sender, EventArgs e)
    {
        await LoggingBorder.TranslateToAsync(-400, 0, 300, Easing.SpringIn);
        SignUpPage.IsVisible = false;
        SignInPage.IsVisible = true;
        await LoggingBorder.TranslateToAsync(0, 0, 550, Easing.SpringOut);
    }
    

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        LoggingBorder.Opacity = 0;
        LoggingBorder.TranslationY = 100;

        await Task.WhenAll(
            LoggingBorder.FadeTo(1, 700),
            LoggingBorder.TranslateTo(0, 0, 1000, Easing.SinOut)
        );
        
        
    }

    public void TogglePassword(Object? sender, EventArgs e)
    {
        SIUserpass.IsPassword = !SIUserpass.IsPassword;

        TogglePsswd.Source = SIUserpass.IsPassword ? "icon_closedeye.png" : "icon_openeye.png";
    }

    private string _errorText;

    public string ErrorText
    {
        get => _errorText;
        set
        {
            _errorText = value;
            OnPropertyChanged(nameof(ErrorText));
            ErrorLabel.IsVisible = !string.IsNullOrEmpty(value);
        }
    }
    public async void ToHome(Object? sender, EventArgs e)
    {
        var btn = sender as Button;

        if (string.IsNullOrWhiteSpace(SIUsername.Text) && string.IsNullOrWhiteSpace(SIUserpass.Text))
        {
            ErrorText = "Please Input in the Fields!";
            return;
        }
        else if (string.IsNullOrWhiteSpace(SIUsername.Text))
        {
            ErrorText = "Enter Username!";
            return;
        }
        else if (string.IsNullOrWhiteSpace(SIUserpass.Text))
        {
            ErrorText = "Enter Password!";
            return;
        }

        var existingUser = await _database.GetUser(SIUsername.Text, SIUserpass.Text);
        if (existingUser == null)
        {
            ErrorText = "Username or Password is incorrect!";
            return;
        }

        var session = IPlatformApplication.Current.Services.GetService<UserSession>();
        session.CurrentUser = existingUser;
        Application.Current.MainPage = new AppShell();
    }

    private string _errorText2;
    public string ErrorText2
    {
        get => _errorText2;
        set
        {
            _errorText2 = value;
            OnPropertyChanged(nameof(ErrorText2));
            ErrorLabel2.IsVisible = !string.IsNullOrEmpty(value);
        }
    }
    public async void Register(Object? sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(SUUsername.Text) || string.IsNullOrWhiteSpace(SUPass1.Text) ||
            string.IsNullOrWhiteSpace(SUPass2.Text))
        {
            ErrorText2 = "Please fill in all fields!";
            return;
        }
        else if (SUPass1.Text != SUPass2.Text)
        {
            ErrorText2 = "Password Mismatch!";
            return;
        }

        var existingUserName = await _database.GetUserByUsername(SUUsername.Text);
        if(existingUserName != null) {
            ErrorText2 = "Username already exists!";
            return;
        }
        
        var existingEmail = await _database.GetUserByEmail(SUEmail.Text);
        if(existingEmail != null) {
            ErrorText2 = "Email has already been used!";
            return;
        }

        var newUser = new User()
        {
            userName = SUUsername.Text,
            password = SUPass2.Text,
            userCreated = DateTime.Now
        };
        await _database.RegisterUser(newUser);
        ErrorText2 = string.Empty;
        SignIn(sender, e);
    }
    
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
    
}