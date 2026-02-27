using Microsoft.Extensions.Logging;
using Syncfusion.Maui.Core.Hosting;
using D_ToDoList.Resources.Database;


namespace D_ToDoList;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder
            .UseMauiApp<App>()
            .ConfigureSyncfusionCore()
            .ConfigureFonts(fonts =>
            {
                fonts.AddFont("Poppins-Thin.ttf", "PoppinsThin");
                fonts.AddFont("Poppins-Regular.ttf", "PoppinsRegular");
                fonts.AddFont("Poppins-Bold.ttf", "PoppinsBold");
                fonts.AddFont("Poppins-Black.ttf", "PoppinsBlack");
                fonts.AddFont("Poppins-SemiBold.ttf", "PoppinsSemiBold");
            });
        builder.Services.AddSingleton<ToDoDB>();
        

#if DEBUG
        builder.Logging.AddDebug();
#endif

        return builder.Build();
    }
}