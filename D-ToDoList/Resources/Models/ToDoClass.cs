using SQLite;
using Microsoft.Maui;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace D_ToDoList;

[Table("tasks")]
public class ToDoClass : INotifyPropertyChanged
{
    // User Info
    private int _userID;
    
    // Task Info
    private int _taskID;
    private string? _taskTitle;
    private string? _taskDescription;
    private bool _taskStatus;
    private bool _isEditing;
    private DateTime _taskDateCreated;

    public int userID
    {
        get => _userID;
        set => SetField(ref _userID, value);
    }

    [PrimaryKey, AutoIncrement]
    public int taskID 
    { 
        get => _taskID; 
        set => SetField(ref _taskID, value); 
    }

    public string? taskTitle 
    { 
        get => _taskTitle; 
        set => SetField(ref _taskTitle, value); 
    }

    public string? taskDescription 
    { 
        get => _taskDescription; 
        set => SetField(ref _taskDescription, value);
    }
    
    public DateTime taskDateCreated 
    { 
        get => _taskDateCreated; 
        set => SetField(ref _taskDateCreated, value); 
    }

    public bool taskStatus
    {
        get => _taskStatus;
        set
        {
            if (SetField(ref _taskStatus, value))
            {
                OnPropertyChanged(nameof(checkColor));
                OnPropertyChanged(nameof(labelDecor));
            }
        }
    }

    // [Ignore]
    public bool isEditing
    {
        get => _isEditing;
        set
        {
            if (SetField(ref _isEditing, value))
            {
                OnPropertyChanged(nameof(isntEditing));
            }
        }
    }

    [Ignore]
    public bool isntEditing => !isEditing;

    [Ignore]
    public TextDecorations labelDecor => taskStatus ? TextDecorations.Strikethrough : TextDecorations.None;

    [Ignore]
    public Color statusColor => taskStatus ? Color.FromArgb("#16A34A") : Color.FromArgb("#DC2626");
    
    [Ignore]
    public string status => taskStatus ? "Completed" : "Active";

    [Ignore]
    public Color checkColor => taskStatus ? Color.FromArgb("#4169E1") :
        (Application.Current.RequestedTheme == AppTheme.Dark 
            ? Color.FromArgb("#222834") 
            : Color.FromArgb("#F5F7FB"));

    public event PropertyChangedEventHandler PropertyChanged;
    protected void OnPropertyChanged([CallerMemberName] string propertyName = null) 
        => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));

    protected bool SetField<T>(ref T field, T value, [CallerMemberName] string propertyName = null)
    {
        if (EqualityComparer<T>.Default.Equals(field, value)) return false;
        field = value;
        OnPropertyChanged(propertyName);
        return true;
    }
    
    public void RefreshColors()
    {
        OnPropertyChanged(nameof(checkColor));
    }
}