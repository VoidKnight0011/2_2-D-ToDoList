using D_ToDoList.Resources.Database;
using System.Runtime.CompilerServices;
using System.ComponentModel;
using Microsoft.Maui.Controls;

namespace D_ToDoList.Resources.Pages;

public partial class MainPage_TaskEdit : ContentPage
{
    ToDoClass _tasks;
    ToDoDB _database;
    
    public MainPage_TaskEdit(ToDoClass tasks, ToDoDB database)
    {
        InitializeComponent();
        _tasks = tasks;
        _database = database;
        BindingContext = tasks;
    }
    
    private bool _isEdited = false;

    public bool isEdited
    {
        get => _isEdited;
        set
        {
            _isEdited = value;
            OnPropertyChanged(nameof(isEdited));
        }  
    }

    public void TitleChange(Object sender, TextChangedEventArgs e)
    {
        _tasks.taskTitle = e.NewTextValue;
        isEdited = true;
    }
    
    public void DescriptionChange(Object sender, TextChangedEventArgs e)
    {
        _tasks.taskDescription = e.NewTextValue;
        isEdited = true;
    }

    public async void TaskSave(Object sender, EventArgs e)
    {
        if (isEdited)
        {
            await _database.Update(_tasks);
            await Navigation.PopAsync();
        }
    }
    
    public async void TaskDelete(Object sender, EventArgs e)
    {
        bool answer = await DisplayAlertAsync("Delete Task", "Are you sure you want to delete?", "Yes", "No");
        if (answer)
        {
            await _database.Delete(_tasks);
            await Navigation.PopAsync();
        }
    }

    public void BackBtn(Object? sender, EventArgs e) => Navigation.PopAsync();
    
}