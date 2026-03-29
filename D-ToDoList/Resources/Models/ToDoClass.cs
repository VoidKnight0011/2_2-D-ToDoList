using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Text.Json.Serialization;
using Microsoft.Maui;
using Microsoft.Maui.Controls;

namespace D_ToDoList;

public class ToDoClass : INotifyPropertyChanged
{
    private int _item_id;
    private string? _item_name;
    private string? _item_description;
    private string? _status;
    private int _user_id;
    private string? _timemodified;
    private bool _isEditing;
    
    [JsonPropertyName("item_id")]
    public int item_id 
    { 
        get => _item_id; 
        set => SetField(ref _item_id, value); 
    }

    [JsonPropertyName("item_name")]
    public string? item_name 
    { 
        get => _item_name; 
        set => SetField(ref _item_name, value); 
    }

    [JsonPropertyName("item_description")]
    public string? item_description 
    { 
        get => _item_description; 
        set => SetField(ref _item_description, value); 
    }

    [JsonPropertyName("user_id")]
    public int user_id 
    { 
        get => _user_id; 
        set => SetField(ref _user_id, value); 
    }

    [JsonPropertyName("timemodified")]
    public string? timemodified 
    { 
        get => _timemodified; 
        set => SetField(ref _timemodified, value); 
    }

    [JsonPropertyName("status")]
    public string? status
    {
        get => _status;
        set
        {
            if (SetField(ref _status, value))
            {
                OnPropertyChanged(nameof(checkColor));
                OnPropertyChanged(nameof(labelDecor));
                OnPropertyChanged(nameof(isCompleted));
            }
        }
    }
    
    [JsonIgnore]
    public bool isEditing
    {
        get => _isEditing;
        set 
        { 
            if (SetField(ref _isEditing, value)) 
                OnPropertyChanged(nameof(isntEditing)); 
        }
    }

    [JsonIgnore]
    public bool isCompleted => status == "inactive";
    
    [JsonIgnore]
    public bool isntEditing => !isEditing;
    
    [JsonIgnore]
    public TextDecorations labelDecor => isCompleted ? TextDecorations.Strikethrough : TextDecorations.None;
    
    [JsonIgnore]
    public Color statusColor => isCompleted ? Color.FromArgb("#16A34A") : Color.FromArgb("#DC2626");
    
    [JsonIgnore]
    public string statusLabel => isCompleted ? "Completed" : "Active";
    
    [JsonIgnore]
    public Color checkColor => isCompleted 
        ? Color.FromArgb("#4169E1") 
        : (Application.Current?.RequestedTheme == AppTheme.Dark 
            ? Color.FromArgb("#222834") 
            : Color.FromArgb("#F5F7FB"));

    public event PropertyChangedEventHandler? PropertyChanged;
    
    protected void OnPropertyChanged([CallerMemberName] string? propertyName = null)
        => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));

    protected bool SetField<T>(ref T field, T value, [CallerMemberName] string? propertyName = null)
    {
        if (EqualityComparer<T>.Default.Equals(field, value)) 
            return false;
        
        field = value;
        OnPropertyChanged(propertyName);
        return true;
    }

    public void RefreshColors() => OnPropertyChanged(nameof(checkColor));
}