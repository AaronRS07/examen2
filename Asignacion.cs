using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace examenn2.CapaModelo
{
    public class Asignacion
    {
        public int AsignacionID { get; set; }

        public int ReparacionID { get; set; }
        public Reparacion Reparacion { get; set; }


        public int TecnicoID { get; set; }
        public Tecnicos Tecnico { get; set; }

        public DateTime FechaAsignacion { get; set; }
    }
}