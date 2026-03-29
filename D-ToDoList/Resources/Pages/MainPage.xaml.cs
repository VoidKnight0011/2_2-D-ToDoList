using Microsoft.Maui.Controls;
using System.Collections.ObjectModel;
using D_ToDoList.Resources.Services;
using D_ToDoList.Resources.Pages;

namespace D_ToDoList;

public partial class MainPage : ContentPage
{
    private readonly APIService _database;
    private readonly UserSession _session;

    public ObservableCollection<ToDoClass> tasks { get; set; } = new();
    public ObservableCollection<ToDoClass> filtered { get; set; } = new();
    public string? dateToday { get; set; } = DateTime.Now.ToString("dddd,  MMMM d");
    public string activeFilter { get; set; } = "All";

    private string? _displayName;
    public string? DisplayName
    {
        get => _displayName;
        set { _displayName = value; OnPropertyChanged(nameof(DisplayName)); }
    }

    private int _completedTasks = 0;
    public int completedTasks
    {
        get => _completedTasks;
        set
        {
            _completedTasks = value;
            OnPropertyChanged(nameof(completedTasks));
            OnPropertyChanged(nameof(taskPercentage));
        }
    }
    public int totalTasks => tasks.Count;
    public double taskPercentage => totalTasks == 0 ? 0 : Math.Min(100, ((double)completedTasks / totalTasks) * 100);

    public MainPage(APIService database, UserSession session)
    {
        InitializeComponent();
        LoadingOverlay.IsVisible = true;
        NavigationPage.SetHasNavigationBar(this, false);
        BindingContext = this;
        _database = database;
        _session = session;
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();
        tasks.Clear();
        filtered.Clear();
        taskTitle.Text = string.Empty;

        DisplayName = $"{_session.CurrentUser.fname} {_session.CurrentUser.lname}";
        OnPropertyChanged(nameof(DisplayName));
        
        var activeTasks   = await _database.GetItems(_session.CurrentUser.id, "active");
        var inactiveTasks = await _database.GetItems(_session.CurrentUser.id, "inactive");

        foreach (var t in activeTasks)   tasks.Add(t);
        foreach (var t in inactiveTasks) tasks.Add(t);

        completedTasks = tasks.Count(t => t.isCompleted);
        OnPropertyChanged(nameof(totalTasks));
        OnPropertyChanged(nameof(taskPercentage));

        FilterList();
        LoadingOverlay.IsVisible = false;
    }

    public async void TaskAdd(object? sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(taskTitle.Text)) return;

        var user = _session.CurrentUser;
        if (user == null) return;

        var (newTask, message) = await _database.AddItem(
            taskTitle.Text,
            taskTitle.Text,
            user.id
        );

        if (newTask == null)
        {
            await DisplayAlert("Add Task Failed", message, "OK");
            return;
        }

        tasks.Add(newTask);
        OnPropertyChanged(nameof(totalTasks));
        OnPropertyChanged(nameof(taskPercentage));
        FilterList();

        taskTitle.Text = "";
        taskTitle.Unfocus();
    }

    public async void TaskEdit(object? sender, EventArgs e)
    {
        var btn = sender as Button;
        var task = btn?.CommandParameter as ToDoClass;
        if (task == null) return;

        await Navigation.PushAsync(new MainPage_TaskEdit(task, _database));
    }

    public async void TaskDelete(object? sender, EventArgs e)
    {
        var btn = sender as Button;
        var task = btn?.CommandParameter as ToDoClass;
        if (task == null) return;

        bool answer = await DisplayAlert("Delete Task", "Are you sure?", "Yes", "No");
        if (!answer) return;

        var success = await _database.DeleteItem(task.item_id);
        if (success)
        {
            if (task.isCompleted) completedTasks--;
            tasks.Remove(task);
            OnPropertyChanged(nameof(totalTasks));
            OnPropertyChanged(nameof(taskPercentage));
            FilterList();
        }
    }

    public async void TaskCheck(object? sender, EventArgs e)
    {
        var btn = sender as Button;
        var task = btn?.CommandParameter as ToDoClass;
        if (task == null) return;

        var newStatus = task.isCompleted ? "active" : "inactive";
        var success = await _database.SetItemStatus(task.item_id, newStatus);
        if (!success) return;

        task.status = newStatus;
        completedTasks += newStatus == "inactive" ? 1 : -1;
        FilterList();
    }

    public void FilterList()
    {
        filtered.Clear();
        foreach (var t in tasks)
        {
            if (activeFilter == "All")                        filtered.Add(t);
            else if (activeFilter == "Active" && !t.isCompleted) filtered.Add(t);
            else if (activeFilter == "Done"   &&  t.isCompleted) filtered.Add(t);
        }
    }

    public void FilterAll(object? sender, EventArgs e)    { activeFilter = "All";    FilterList(); }
    public void FilterActive(object? sender, EventArgs e) { activeFilter = "Active"; FilterList(); }
    public void FilterDone(object? sender, EventArgs e)   { activeFilter = "Done";   FilterList(); }

    private void ToProfile(object? sender, TappedEventArgs e)
    {
        if (Navigation.NavigationStack.Last() is MainPage_Profile) return;
        Navigation.PushAsync(new MainPage_Profile(_database, _session, completedTasks, totalTasks));
    }

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