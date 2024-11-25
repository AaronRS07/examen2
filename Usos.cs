using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace examenn2.CapaLogistica
{
    public class Usos
    {
        public static int Agregar(int codigo, string nombre, string correoelectronico, string telefono, string celular)
        {
            int retorno = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("InsertarUsuario", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    cmd.Parameters.Add(new SqlParameter("@Nombre", nombre));
                    cmd.Parameters.Add(new SqlParameter("@CorreoElectronico", correoelectronico));
                    cmd.Parameters.Add(new SqlParameter("@Telefono", telefono));


                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = 0;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;
        }
        public static DataTable ConsultarUsuarios()
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = DBconn.obtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("ConsultarUsuarios", conn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            return dt;
        }
        public static int BorrarUsuario(int usuarioID)
        {
            int resultado = 0;
            try
            {
                // Código para eliminar el usuario de la base de datos
                // Usar una conexión SQL para eliminar al usuario según el usuarioID
            }
            catch (Exception ex)
            {
                // Manejo de excepciones
                Console.WriteLine(ex.Message);
            }
            return resultado;
        }

        public static int ModificarUsuario(int usuarioID, string nombre, string correo, string telefono)
        {
            int resultado = 0;
            try
            {
                // Código para modificar el usuario en la base de datos
                // Usar una conexión SQL para actualizar los datos del usuario
            }
            catch (Exception ex)
            {
                // Manejo de excepciones
                Console.WriteLine(ex.Message);
            }
            return resultado;
        }





    }
}