using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace examenn2.CapaModelo
{
    public class Equipo
    {
        public int EquipoID { get; set; }
        public string TipoEquipo { get; set; }
        public string Modelo { get; set; }
        public int UsuarioID { get; set; }
    }
}