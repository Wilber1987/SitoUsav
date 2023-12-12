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

        public IActionResult OnGet(int? id) // Cambia el nombre del parámetro a 'id'
        {
            if (id.HasValue)
            {
                // Utiliza el parámetro 'id' para obtener el video
                var videoService = new VideoService(connectionString);
                SelectedVideo = videoService.GetVideoById(id.Value);

                if (SelectedVideo != null)
                {
                    return Page();
                }
                else
                {
                    // Manejo si el video no se encuentra
                    return RedirectToPage("/Errorvideo");
                }
            }

            // Manejo si el 'id' no está presente
            return RedirectToPage("/Errorid");
        }
    }
}
