using SQLite;
using System.Net.Mime;
using Microsoft.Maui;

namespace D_ToDoList;
using System;
using System.ComponentModel;
using System.Runtime.CompilerServices;

[Table("tasks")]
public class ToDoClass : INotifyPropertyChanged
{
    private int _id;
    private string _title;
    private string _detail;
    private bool _isChecked;
    private bool _isEditing;

    [PrimaryKey, AutoIncrement]
    public int id 
    { 
        get => _id; 
        set => SetField(ref _id, value); 
    }

    public string title 
    { 
        get => _title; 
        set => SetField(ref _title, value); 
    }

    public string detail 
    { 
        get => _detail; 
        set => SetField(ref _detail, value); 
    }

    public bool isChecked
    {
        get => _isChecked;
        set
        {
            if (SetField(ref _isChecked, value))
            {
                OnPropertyChanged(nameof(checkColor));
                OnPropertyChanged(nameof(labelDecor));
            }
        }
    }

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
    public TextDecorations labelDecor => isChecked ? TextDecorations.Strikethrough : TextDecorations.None;

    [Ignore]
    public Color checkColor => isChecked ? Color.FromArgb("#4169E1") :
        (Application.Current.RequestedTheme == AppTheme.Dark 
            ? Color.FromArgb("#181C23") 
            : Color.FromArgb("#F4F6FA"));

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
}