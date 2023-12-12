using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SNI_UI2.CAPA_NEGOCIO;
using SNI_UI2.Services;
using System.Collections.Generic;

namespace SNI_UI2.Pages.Usav
{
    public class ReproducirVideoModel : PageModel
    {
        private readonly string connectionString = "Server=DESKTOP-A7DCQGN;Database=UNAN_BD;User Id=sa;Password=123;"; // Reemplaza con tu cadena de conexión

        public Video SelectedVideo { get; set; }

        public IActionResult OnGet(int? videoId, string videoUrl)
        {
            if (videoId.HasValue && !string.IsNullOrEmpty(videoUrl))
            {
                var videoService = new VideoService(connectionString);
                SelectedVideo = videoService.GetVideoById(videoId.Value);

                if (SelectedVideo != null && SelectedVideo.URL == videoUrl)
                {
                    return Page();
                }
                else
                {
                    // Manejo si el video no se encuentra
                    return RedirectToPage("/Errorvideo");
                }
            }

            // Manejo si el ID o la URL no están presentes
            return RedirectToPage("/Errorid");
        }
    }
}

