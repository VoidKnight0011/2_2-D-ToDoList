using System.ComponentModel;
using Microsoft.Maui.ApplicationModel.Communication;
namespace D_ToDoList;
public class User
{
    public int id { get; set; }
    public string fname { get; set; }
    public string lname { get; set; }
    public string email { get; set; }
    public string timemodified { get; set; }
}