using D_ToDoList.Resources.Services;
using Microsoft.Maui.Controls;

namespace D_ToDoList.Resources.Pages;

public partial class MainPage_TaskEdit : ContentPage
{
    private readonly ToDoClass _tasks;
    private readonly APIService _database;
    private bool _isEdited = false;

    public MainPage_TaskEdit(ToDoClass tasks, APIService database)
    {
        InitializeComponent();
        _tasks = tasks;
        _database = database;
        BindingContext = tasks;
    }

    public void TitleChange(object sender, TextChangedEventArgs e)
    {
        _tasks.item_name = e.NewTextValue;
        _isEdited = true;
    }

    public void DescriptionChange(object sender, TextChangedEventArgs e)
    {
        _tasks.item_description = e.NewTextValue;
        _isEdited = true;
    }

    public async void TaskSave(object sender, EventArgs e)
    {
        if (_isEdited)
        {
            await _database.EditItem(_tasks.item_id, _tasks.item_name, _tasks.item_description);
            await Navigation.PopAsync();
        }
    }

    public async void TaskDelete(object sender, EventArgs e)
    {
        bool answer = await DisplayAlert("Delete Task", "Are you sure you want to delete?", "Yes", "No");
        if (answer)
        {
            await _database.DeleteItem(_tasks.item_id);
            await Navigation.PopAsync();
        }
    }

    public void BackBtn(object? sender, EventArgs e) => Navigation.PopAsync();
}