using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Data.SqlTypes;
using System.Data.SqlClient;
using Microsoft.Data.SqlClient;
using WebApi.Models;


namespace WebApi.Controllers
{
    public class Cliente : Controller
    {
        private readonly IConfiguration _config;

        public Cliente(IConfiguration configuration)
        {

            _config = configuration;
        }

        // GET: Cliente
        public ActionResult Index()
        {
            var clientes = new List<Cliente>();
            string conexion = _config.GetConnectionString("Conexion");
            int Id;

            try {
                using (SqlConnection connection = new SqlConnection(conexion))
                using (SqlCommand command = new SqlCommand(
                    "Select * from Cliente", connection))
                {

                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Id = reader.GetOrdinal("Id");
                            var PrimerNombre = reader.GetOrdinal("PrimerNombre");
                            var SegundoNombre = reader.GetOrdinal("SegundoNombre");
                            var TercerNombre = reader.GetOrdinal("TercerNombre");
                            var PrimerApellido = reader.GetOrdinal("PrimerApellido");
                            var PrimerSegundo = reader.GetOrdinal("SegundoApellido");
                            var ApellidoCasada = reader.GetOrdinal("ApellidoCasada");                           
                        };
                    }
                }
            }
            catch(Exception ex) {
                return StatusCode(500, ex.Message);
            }   



            return View();
        }

        // GET: Cliente/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Cliente/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Cliente/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: Cliente/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Cliente/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: Cliente/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Cliente/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
