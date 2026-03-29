using System.Net.Http;
using System.Text;
using System.Text.Json;

namespace D_ToDoList.Resources.Services;

public class APIService
{
    private readonly HttpClient _http;

    private const string BaseUrl = "https://todo-list.dcism.org";

    private readonly JsonSerializerOptions _jsonOptions = new()
    {
        PropertyNameCaseInsensitive = true,
        PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
        WriteIndented = true
    };

    public APIService()
    {
        _http = new HttpClient
        {
            BaseAddress = new Uri(BaseUrl)
        };
    }
    
    public async Task<User?> SignIn(string email, string password)
    {
        try
        {
            var url = $"/signin_action.php?email={Uri.EscapeDataString(email)}&password={Uri.EscapeDataString(password)}";

            var res = await _http.GetAsync(url);

            if (!res.IsSuccessStatusCode)
                return null;

            var json = await res.Content.ReadAsStringAsync();

            var obj = JsonSerializer.Deserialize<ApiResponse<User>>(json, _jsonOptions);

            return obj?.status == 200 ? obj.data : null;
        }
        catch
        {
            return null;
        }
    }
    
    public async Task<(bool success, string message)> SignUp(
        string firstName,
        string lastName,
        string email,
        string password,
        string confirmPassword)
    {
        try
        {
            var payload = new
            {
                first_name = firstName,
                last_name = lastName,
                email,
                password,
                confirm_password = confirmPassword
            };

            var content = new StringContent(
                JsonSerializer.Serialize(payload),
                Encoding.UTF8,
                "application/json"
            );

            var res = await _http.PostAsync("/signup_action.php", content);

            var json = await res.Content.ReadAsStringAsync();

            var obj = JsonSerializer.Deserialize<ApiResponse<object>>(json, _jsonOptions);

            return (obj?.status == 200, obj?.message ?? "Unknown error");
        }
        catch (Exception ex)
        {
            return (false, ex.Message);
        }
    }
    
    public async Task<List<ToDoClass>> GetItems(int userId, string status = "active")
    {
        try
        {
            var res = await _http.GetAsync($"/getItems_action.php?status={status}&user_id={userId}");

            if (!res.IsSuccessStatusCode)
                return new List<ToDoClass>();

            var json = await res.Content.ReadAsStringAsync();

            var obj = JsonSerializer.Deserialize<ItemsResponse>(json, _jsonOptions);

            return obj?.status == 200 && obj.data != null
                ? obj.data.Values.ToList()
                : new List<ToDoClass>();
        }
        catch
        {
            return new List<ToDoClass>();
        }
    }
    
    public async Task<(ToDoClass? task, string message)> AddItem(string itemName, string itemDescription, int userId)
    {
        try
        {
            var payload = new
            {
                item_name = itemName,
                item_description = itemDescription,
                user_id = userId
            };

            var content = new StringContent(
                JsonSerializer.Serialize(payload),
                Encoding.UTF8,
                "application/json"
            );

            var res = await _http.PostAsync("/addItem_action.php", content);

            var json = await res.Content.ReadAsStringAsync();
            
            System.Diagnostics.Debug.WriteLine($"Raw API Response: {json}");
            
            int jsonStart = json.IndexOf("{");
            if (jsonStart > 0)
            {
                json = json.Substring(jsonStart);
                System.Diagnostics.Debug.WriteLine($"Cleaned JSON: {json}");
            }
            ApiResponse<ToDoClass>? obj = null;
            
            try
            {
                obj = JsonSerializer.Deserialize<ApiResponse<ToDoClass>>(json, _jsonOptions);
            }
            catch (JsonException jsonEx)
            {
                System.Diagnostics.Debug.WriteLine($"JSON Deserialization Error: {jsonEx.Message}");
                System.Diagnostics.Debug.WriteLine($"Problematic JSON: {json}");
                
                try
                {
                    var rawResponse = JsonSerializer.Deserialize<JsonElement>(json);
                    
                    var status = rawResponse.GetProperty("status").GetInt32();
                    var message = rawResponse.TryGetProperty("message", out var msgProp) 
                        ? msgProp.GetString() 
                        : "Unknown error";
                    
                    if (status != 200)
                    {
                        return (null, message ?? "Server error");
                    }
                    
                    if (rawResponse.TryGetProperty("data", out var dataProp))
                    {
                        var task = JsonSerializer.Deserialize<ToDoClass>(dataProp.GetRawText(), _jsonOptions);
                        return (task, message ?? "Success");
                    }
                }
                catch (Exception fallbackEx)
                {
                    System.Diagnostics.Debug.WriteLine($"Fallback deserialization failed: {fallbackEx.Message}");
                    return (null, $"Deserialization error: {fallbackEx.Message}");
                }
                
                return (null, $"JSON parse error: {jsonEx.Message}");
            }

            if (obj == null)
                return (null, "Invalid server response");

            if (obj.status != 200)
                return (null, obj.message ?? "Server rejected request");

            return (obj.data, obj.message ?? "Success");
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"AddItem Exception: {ex.Message}");
            return (null, ex.Message);
        }
    }
    
    public async Task<bool> EditItem(int itemId, string itemName, string itemDescription)
    {
        try
        {
            var payload = new
            {
                item_id = itemId,
                item_name = itemName,
                item_description = itemDescription
            };

            var req = new HttpRequestMessage(HttpMethod.Put, "/editItem_action.php")
            {
                Content = new StringContent(
                    JsonSerializer.Serialize(payload),
                    Encoding.UTF8,
                    "application/json"
                )
            };

            var res = await _http.SendAsync(req);

            var json = await res.Content.ReadAsStringAsync();

            var obj = JsonSerializer.Deserialize<ApiResponse<object>>(json, _jsonOptions);

            return obj?.status == 200;
        }
        catch
        {
            return false;
        }
    }
    
    public async Task<bool> SetItemStatus(int itemId, string status)
    {
        try
        {
            var payload = new
            {
                item_id = itemId,
                status
            };

            var req = new HttpRequestMessage(HttpMethod.Put, "/statusItem_action.php")
            {
                Content = new StringContent(
                    JsonSerializer.Serialize(payload),
                    Encoding.UTF8,
                    "application/json"
                )
            };

            var res = await _http.SendAsync(req);

            var json = await res.Content.ReadAsStringAsync();

            var obj = JsonSerializer.Deserialize<ApiResponse<object>>(json, _jsonOptions);

            return obj?.status == 200;
        }
        catch
        {
            return false;
        }
    }
    
    public async Task<bool> DeleteItem(int itemId)
    {
        try
        {
            var res = await _http.DeleteAsync($"/deleteItem_action.php?item_id={itemId}");

            var json = await res.Content.ReadAsStringAsync();

            var obj = JsonSerializer.Deserialize<ApiResponse<object>>(json, _jsonOptions);

            return obj?.status == 200;
        }
        catch
        {
            return false;
        }
    }
    
    private class ApiResponse<T>
    {
        public int status { get; set; }
        public string? message { get; set; }
        public T? data { get; set; }
    }

    private class ItemsResponse
    {
        public int status { get; set; }
        public Dictionary<string, ToDoClass>? data { get; set; }
    }
}