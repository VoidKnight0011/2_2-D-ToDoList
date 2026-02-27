using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
// using Android.Widget;
using D_ToDoList.Resources.Database;
using Microsoft.Maui.Controls;
using System.Runtime.CompilerServices;
using System.ComponentModel;

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
        _tasks.title = e.NewTextValue;
        isEdited = true;
    }
    
    public void DescriptionChange(Object sender, TextChangedEventArgs e)
    {
        _tasks.description = e.NewTextValue;
        isEdited = true;
    }

    public async void TaskSave(Object sender, EventArgs e)
    {
        if (isEdited)
        {
            await _database.Update(_tasks);
            await Navigation.PopAsync();
            // return to MainPage
        }
    }
    
    public async void TaskDelete(Object sender, EventArgs e)
    {
        bool answer = await DisplayAlert("Delete Task", "Are you sure you want to delete?", "Yes", "No");
        if (answer)
        {
            await _database.Delete(_tasks);
            await Navigation.PopAsync();
        }
    }
    public new event PropertyChangedEventHandler PropertyChanged;
    protected new void OnPropertyChanged([CallerMemberName] string propertyName = null)
        => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
}