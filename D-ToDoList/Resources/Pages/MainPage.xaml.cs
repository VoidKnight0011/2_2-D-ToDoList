using Microsoft.Maui.Controls;
using System.Collections.ObjectModel;
using D_ToDoList.Resources.Database;
using D_ToDoList.Resources.Pages;
using Button = Microsoft.Maui.Controls.Button;

namespace D_ToDoList;

public partial class MainPage : ContentPage
{
    public ObservableCollection<ToDoClass> tasks { get; set; } = new();
    public string? dateToday { get; set; } = DateTime.Now.ToString("dddd,  MMMM d");
    private string? _displayName;
    public string? DisplayName
    {
        get => _displayName;
        set
        {
            _displayName = value;
            OnPropertyChanged(nameof(DisplayName));
        }
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
    
        
        protected override async void OnAppearing()
        {
            base.OnAppearing();
            tasks.Clear();
            filtered.Clear();
            DisplayName = _session.CurrentUser.displayName ?? _session.CurrentUser.userName;
            Application.Current.UserAppTheme = _session.CurrentUser.preferredTheme switch
            {
                "Light" => AppTheme.Light,
                "Dark" => AppTheme.Dark,
                _ => AppTheme.Unspecified
            };
                        
            var dbTasks = await _database.GetAllID(_session.CurrentUser.userID);
            
            foreach (var t in dbTasks)
            {
                tasks.Add(t);
            }
                        
            completedTasks = tasks.Count(t => t.taskStatus);
            OnPropertyChanged(nameof(totalTasks));
            OnPropertyChanged(nameof(taskPercentage));
                        
            FilterList();
            LoadingOverlay.IsVisible = false;
        }
        
        private readonly ToDoDB _database;
        private readonly UserSession _session;
                    public MainPage(ToDoDB database, UserSession session)
                    {
                        InitializeComponent();
                        LoadingOverlay.IsVisible = true;
                        NavigationPage.SetHasNavigationBar(this, false);
                        Application.Current.UserAppTheme = AppTheme.Unspecified;
                        BindingContext = this;
                        _database = database;
                        _session = session;
                    }
    
    
                    
    public async void TaskAdd(Object? sender, EventArgs e)
    {
        if (!string.IsNullOrWhiteSpace(taskTitle.Text))
        {
            var newTask = new ToDoClass
            {
                userID = _session.CurrentUser.userID,
                taskTitle = taskTitle.Text,
                taskStatus = false,
                taskDateCreated = DateTime.Now
            };
            await _database.Insert(newTask);
            tasks.Add(newTask);
            
            
            OnPropertyChanged(nameof(totalTasks));
            OnPropertyChanged(nameof(taskPercentage));
            
            taskTitle.Text = string.Empty;
            taskTitle.Unfocus();
            FilterList();
        }
    }
    
    public async void TaskEdit(Object? sender, EventArgs e)
    {
        var btn = sender as Button;
        var task = btn?.CommandParameter as ToDoClass;
        if (task == null) return;
        
        await Navigation.PushAsync(new MainPage_TaskEdit(task, _database));
    }
    public async void TaskDelete(Object? sender, EventArgs e)
    {
        var btn = sender as Button;
        var task = btn?.CommandParameter as ToDoClass;
        if (task == null) return;
        
        bool answer = await DisplayAlertAsync("Delete Task", "Are you sure?", "Yes", "No");
        if (answer)
        {
            if (task.taskStatus) completedTasks--;
            await _database.Delete(task);
            tasks.Remove(task);
            OnPropertyChanged(nameof(totalTasks));
            OnPropertyChanged(nameof(taskPercentage));
            FilterList();
        }
    }

    public async void TaskCheck(Object? sender, EventArgs e)
    {
        var btn = sender as Button;
        var task = btn?.CommandParameter as ToDoClass;
        if (task == null) return;

        task.taskStatus = !task.taskStatus;
        if (task.taskStatus) completedTasks++;
        else completedTasks--;
    
        await _database.Update(task);
        FilterList();
    }
    
    public ObservableCollection<ToDoClass> filtered { get; set; } = new();
    public string activeFilter { get; set; } = "All";
    public void FilterList()
    {
        filtered.Clear();
        foreach (var t in tasks)
        {
            if(activeFilter == "All") filtered.Add(t);
            else if(activeFilter == "Active" && !t.taskStatus) filtered.Add(t);
            else if(activeFilter == "Done" && t.taskStatus) filtered.Add(t);
        }
        
    }

        public void FilterAll(Object? sender, EventArgs e)
        {
            activeFilter = "All";
            FilterList();
        }
        
        public void FilterActive(Object? sender, EventArgs e)
        {
            activeFilter = "Active";
            FilterList();
        }
        public void FilterDone(Object? sender, EventArgs e)
        {
            activeFilter = "Done";
            FilterList();
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
        
        
        private void ToProfile(Object? sender, TappedEventArgs e)
        {
            if (Navigation.NavigationStack.Last() is MainPage_Profile) return;
            
            Navigation.PushAsync(new MainPage_Profile(_database, _session, completedTasks, totalTasks));
        }
        
        public void ExportDB(Object? sender, EventArgs e)
        {
            var source = Path.Combine(FileSystem.AppDataDirectory, "tasks.db");
            var dest = Path.Combine("/sdcard/Download/", "tasks.db");
            File.Copy(source, dest, true);
        }
        
        
}