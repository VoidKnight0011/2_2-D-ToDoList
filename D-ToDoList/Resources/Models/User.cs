using SQLite;
using System.ComponentModel;
using Microsoft.Maui.ApplicationModel.Communication;

namespace D_ToDoList;

[Table("users")]
public class User
{
    [PrimaryKey, AutoIncrement]
    public int userID { get; set; }
    public string userName { get; set; }
    public string displayName {get; set;}
    public string userEmail { get; set; }
    public string password { get; set; }
    public DateTime userCreated { get; set; }

    public string preferredTheme { get; set; }
}