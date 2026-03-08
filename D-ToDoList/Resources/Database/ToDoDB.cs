using SQLite;

namespace D_ToDoList.Resources.Database;

public class ToDoDB
{
    private SQLiteAsyncConnection _db;

    public async Task<ToDoClass> GetLatest()
    {
        await Init();
        return await _db.Table<ToDoClass>().OrderByDescending(t => t.taskID).FirstOrDefaultAsync();
    }
    
    public async Task Init()
    {
        if (_db != null) return;
        _db = new SQLiteAsyncConnection(Path.Combine(FileSystem.AppDataDirectory, "tasks.db"));
        await _db.CreateTableAsync<ToDoClass>();
        await _db.CreateTableAsync<User>();
    }
    
    // Accounts
    public async Task<User> GetUser(string userName, string password)
    {
        await Init();
        return await _db.Table<User>()
            .Where(u => u.userName == userName && u.password == password)
            .FirstOrDefaultAsync();
    }

    public async Task<User> GetUserByUsername(string userName)
    {
        await Init();
        return await _db.Table<User>()
            .Where(u => u.userName == userName)
            .FirstOrDefaultAsync();
    }
    
    public async Task<User> GetUserByEmail(string userEmail)
    {
        await Init();
        return await _db.Table<User>()
            .Where(u => u.userEmail == userEmail)
            .FirstOrDefaultAsync();
    }

    public async Task RegisterUser(User user)
    {
        await Init();
        await _db.InsertAsync(user);
    }

    public async Task UpdateUserProfile(User user)
    {
        await Init();
        await _db.UpdateAsync(user);
    }
    
    // Tasks
    public async Task<List<ToDoClass>> GetAllID(int userID)
    {
        await Init();
        return await _db.Table<ToDoClass>()
            .Where(t => t.userID == userID)
            .ToListAsync();
    }

    public async Task Insert(ToDoClass task)
    {
        await Init();
        await _db.InsertAsync(task);
    }

    public async Task Update(ToDoClass task)
    {
        await Init();
        await _db.UpdateAsync(task);
    }

    public async Task Delete(ToDoClass task)
    {
        await Init();
        await _db.DeleteAsync(task);
    }

    public async Task UpdateTheme(User user)
    {
        await Init();
        await _db.UpdateAsync(user);
    }
    
}