using Microsoft.AspNetCore.Mvc.RazorPages;
using SNI_UI2.CAPA_NEGOCIO;
using SNI_UI2.Services;
using System.Collections.Generic;


namespace SNI_UI2.Pages.Usav
{
    public class VideosModel : PageModel
    {
        private readonly string connectionString = "Server=DESKTOP-A7DCQGN;Database=UNAN_BD;User Id=sa;Password=123;"; // Reemplaza con tu cadena de conexión

        public List<Video> Videos { get; set; }

        public void OnGet()
        {
            var videoService = new VideoService(connectionString);
            Videos = videoService.GetVideos();
        }
    }
}
