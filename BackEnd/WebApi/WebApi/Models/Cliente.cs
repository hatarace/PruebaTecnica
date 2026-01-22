namespace WebApi.Models
{
    public class Cliente
    {
        public required int Id { get; set; }
        public required string PrimerNombre { get; set; }
        public required string SegundoNombre { get; set; }
        public required string TercerNombre { get; set; }
        public required string PrimerApellido { get; set; }
        public required string SegundoApellido { get; set; }
        public required string ApellidoCasada { get; set; }
        public required DateTime FechaNacimiento { get; set; }
        public required char EstadoCivil {  get; set; }
        public required string Domicilio {  get; set; }


    }
}
