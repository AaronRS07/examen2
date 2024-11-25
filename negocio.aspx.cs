using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using examenn2.CapaLogistica;
using examenn2.CapaModelo;

namespace examenn2.Vistass
{
    public partial class negocio : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios();
            }
        }

       
        protected void CargarUsuarios()
        {
            
            tabla.DataSource = Usos.ConsultarUsuarios();
            tabla.DataBind();
        }

      
        protected void Button1_Click(object sender, EventArgs e)
        {
            string nombre = nombreInput.Text;
            string correo = correoInput.Text;
            string telefono = telefonoInput.Text;

            int resultado = Usos.Agregar(0, nombre, correo, telefono, null);
            if (resultado > 0)
            {
                Response.Write("<script>alert('Usuario creado exitosamente');</script>");
                CargarUsuarios(); 
            }
            else
            {
                Response.Write("<script>alert('Error al crear el usuario');</script>");
            }
        }

        
        protected void boton2_TextChanged(object sender, EventArgs e)
        {
            try
            {
                int usuarioID = int.Parse(boton2.Text);

                int resultado = Usos.BorrarUsuario(usuarioID); 
                if (resultado > 0)
                {
                    Response.Write("<script>alert('Usuario eliminado exitosamente');</script>");
                    CargarUsuarios(); 
                }
                else
                {
                    Response.Write("<script>alert('Error al eliminar el usuario');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

       
        protected void boton4_TextChanged(object sender, EventArgs e)
        {
            try
            {
                int usuarioID = int.Parse(boton4.Text);
                string nombre = nombreInput.Text;
                string correo = correoInput.Text;
                string telefono = telefonoInput.Text;

                int resultado = Usos.ModificarUsuario(usuarioID, nombre, correo, telefono); 
                if (resultado > 0)
                {
                    Response.Write("<script>alert('Usuario modificado exitosamente');</script>");
                    CargarUsuarios();
                }
                else
                {
                    Response.Write("<script>alert('Error al modificar el usuario');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}