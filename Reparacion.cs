using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace examenn2.CapaModelo
{
    public class Reparacion
    {
        public int ReparacionID { get; set; }


        public int EquipoID { get; set; }
        public Equipo Equipo { get; set; }

        public DateTime FechaSolicitud { get; set; }
        public string Estado { get; set; }

    }
}