using CAPA_DATOS;
namespace SNI_UI2.CAPA_NEGOCIO
{
    public class Employee
    {
        public int EmployeeId { get; set; }
        public string Name { get; set; }
        public string Position { get; set; }
        public int Experience { get; set; }

        //public byte[] Imagen  {get; set;}
    
    }

    public class Video : EntityClass
{
    public int Id { get; set; }
    public string? URL { get; set; }
   public string? Titulo { get; set; }
    public string? Descripcion { get; set; }
    public string? Tipo { get; set; }
    public string? ImagenURL { get; set; }
}

}
