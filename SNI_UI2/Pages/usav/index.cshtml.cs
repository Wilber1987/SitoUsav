using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SNI_UI2.CAPA_NEGOCIO;
using SNI_UI2.Services;

namespace SNI_UI2.Pages
{
    public class IndexModel : PageModel
    {
       private readonly string connectionString = "Server=DESKTOP-A7DCQGN;Database=UNAN_BD;User Id=sa;Password=123;";


        public List<Employee> Employees { get; set; }

        public IActionResult OnGet()
        {
            // Inicializar el servicio y obtener empleados
            var employeeService = new EmployeeService(connectionString);
            Employees = employeeService.GetEmployees();

            return Page();
        }
    }
}

