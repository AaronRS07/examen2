using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace examenn2.CapaModelo
{
    public class DetallesReparacion
    {
        public int DetalleID { get; set; }


        public int ReparacionID { get; set; }
        public Reparacion Reparacion { get; set; }

        public string Descripcion { get; set; }
        public DateTime? FechaInicio { get; set; }
        public DateTime? FechaFin { get; set; }
    }
}