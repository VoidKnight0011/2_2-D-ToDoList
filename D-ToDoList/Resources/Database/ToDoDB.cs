using SQLite;

namespace D_ToDoList.Resources.Database;

public class ToDoDB
{
    private SQLiteAsyncConnection _db;

    public async Task<ToDoClass> GetLatest()
    {
        await Init();
        return await _db.Table<ToDoClass>().OrderByDescending(t => t.id).FirstOrDefaultAsync();
    }
    
    public async Task Init()
    {
        if (_db != null) return;
        _db = new SQLiteAsyncConnection(Path.Combine(FileSystem.AppDataDirectory, "tasks.db"));
        await _db.CreateTableAsync<ToDoClass>();
    }

    public async Task<List<ToDoClass>> GetAll()
    {
        await Init();
        return await _db.Table<ToDoClass>().ToListAsync();
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
}