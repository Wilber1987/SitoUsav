using CAPA_DATOS;
namespace API.DatabaseModels;

 public class Videos: EntityClass
{
    public int? Id { get; set; }
    public string? URL { get; set; }
   public string? Titulo { get; set; }
    public string? Descripcion { get; set; }
    public string? Tipo { get; set; }
    public string? ImagenURL { get; set; }
}


