using Microsoft.Maui.Controls;
using D_ToDoList.Resources.Services;
using Microsoft.Maui.Networking;

namespace D_ToDoList.Resources.Pages;

public partial class LoginPage : ContentPage
{
    private readonly APIService _database;

    public LoginPage(APIService db)
    {
        InitializeComponent();
        _database = db;
        NavigationPage.SetHasNavigationBar(this, false);
        BindingContext = this;
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

    public async void SignUp(object? sender, EventArgs e)
    {
        await LoggingBorder.TranslateToAsync(400, 0, 300, Easing.SpringIn);
        SignInPage.IsVisible = false;
        SignUpPage.IsVisible = true;
        await LoggingBorder.TranslateToAsync(0, 0, 550, Easing.SpringOut);
    }

    public async void SignIn(object? sender, EventArgs e)
    {
        await LoggingBorder.TranslateToAsync(-400, 0, 300, Easing.SpringIn);
        SignUpPage.IsVisible = false;
        SignInPage.IsVisible = true;
        await LoggingBorder.TranslateToAsync(0, 0, 550, Easing.SpringOut);
    }

    public void TogglePassword(object? sender, EventArgs e)
    {
        SIUserpass.IsPassword = !SIUserpass.IsPassword;
        TogglePsswd.Source = SIUserpass.IsPassword ? "icon_closedeye.png" : "icon_openeye.png";
    }

    private string _errorText = string.Empty;
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

    private string _errorText2 = string.Empty;
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

    public async void ToHome(object? sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(SIEmail.Text) && string.IsNullOrWhiteSpace(SIUserpass.Text))
        { ErrorText = "Please fill in all fields!"; return; }
        else if (string.IsNullOrWhiteSpace(SIEmail.Text))
        { ErrorText = "Enter your email!"; return; }
        else if (string.IsNullOrWhiteSpace(SIUserpass.Text))
        { ErrorText = "Enter your password!"; return; }

        if (Connectivity.Current.NetworkAccess != NetworkAccess.Internet)
        { ErrorText = "No internet connection."; return; }

        var user = await _database.SignIn(SIEmail.Text, SIUserpass.Text);
        if (user == null)
        { ErrorText = "Incorrect email or password."; return; }

        var session = IPlatformApplication.Current.Services.GetService<UserSession>();
        session.CurrentUser = user;
        Application.Current.MainPage = new AppShell();
    }
    

    public async void Register(object? sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(SUFirstName.Text) || string.IsNullOrWhiteSpace(SULastName.Text) ||
            string.IsNullOrWhiteSpace(SUEmail.Text) || string.IsNullOrWhiteSpace(SUPass1.Text) ||
            string.IsNullOrWhiteSpace(SUPass2.Text))
        { ErrorText2 = "Please fill in all fields!"; return; }

        if (SUPass1.Text != SUPass2.Text)
        { ErrorText2 = "Passwords don't match!"; return; }

        if (Connectivity.Current.NetworkAccess != NetworkAccess.Internet)
        { ErrorText2 = "No internet connection."; return; }

        var (success, message) = await _database.SignUp(
            SUFirstName.Text, SULastName.Text,
            SUEmail.Text, SUPass1.Text, SUPass2.Text
        );

        if (!success) { ErrorText2 = message; return; }

        ErrorText2 = string.Empty;
        SignIn(sender, e);
    }
}