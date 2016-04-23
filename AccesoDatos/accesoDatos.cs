using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Collections;

namespace AccesoDatos
{
    public class accesoDatos
    {
        private SqlConnection conexion = new SqlConnection();
        private SqlCommand comando = new SqlCommand();

        public string conectar()
        {
            try
            {
                conexion.ConnectionString = "Data Source=tcp:hads19.database.windows.net,1433;Initial Catalog=Users;User ID=hads19@hads19;Password=Serpiente19";
                conexion.Open();
                return "Conexión OK";
            }catch(Exception ex){
                return "Error de conexión: " + ex.Message;
            }
        }

        public void cerrarconexion()
        {
            conexion.Close();
        }

        public string crearUsuario(Dictionary<string, string> datos)
        {
            
                string sentenciaSQL = "Insert into Usuarios values(@correo, @nombre, @pregunta, @respuesta, @dni,'true', @grupo, @tipo, @pass);";
                string passCifrada = cifrar(datos["pass"]);
                comando = new SqlCommand(sentenciaSQL, conexion);
                comando.Parameters.Add("@correo", datos["correo"]);
                comando.Parameters.Add("@nombre", datos["nombre"]);
                comando.Parameters.Add("@pass", passCifrada);
                comando.Parameters.Add("@tipo", datos["tipo"]);
                comando.Parameters.Add("@pregunta", datos["pregunta"]);
                comando.Parameters.Add("@respuesta", datos["respuesta"]);
                comando.Parameters.Add("@dni", datos["dni"]);
                comando.Parameters.Add("@grupo", datos["grupo"]);

                try
                {
                    comando.ExecuteNonQuery();
                    return null;
                }
                catch (Exception e)
                {
                    return e.Message + ". ";
                }
         }

        private string cifrar(string pass)
        {
            byte[] datos = Encoding.ASCII.GetBytes(pass);
            datos = new SHA256Managed().ComputeHash(datos);
            string cifrado = Encoding.ASCII.GetString(datos);
            return cifrado;
        }
        public Boolean validarRegistro(string mail, int codigo)
        {
            string query = "Select count(*) from Users WHERE correo=@mail and codigo=@codigo and Validado='false'";
            
            comando = new SqlCommand(query, conexion);
            comando.Parameters.Add("@mail", mail);
            comando.Parameters.Add("@codigo", codigo);
            Console.Write(query);
            try
            {
                if ((int)comando.ExecuteScalar() > 0)
                {
                    validar(mail);
                    return true;
                }

                return false;
            }
            catch (Exception e)
            {
                return false;
            }

        }

        private string validar(string mail)
        {
            string query = "Update Users Set Validado='true' WHERE correo=@mail;";
            comando = new SqlCommand(query, conexion);
            comando.Parameters.Add("@mail", mail);
            try
            {
                comando.ExecuteNonQuery();
                return "Ok";
            }
            catch (Exception e)
            {
                return e.Message;
            }


        }

        public string updatePass(string mail, string newPass)
        {
            string query = "Update Users Set Contraseña=@pass WHERE correo=@mail;";
            comando = new SqlCommand(query, conexion);
            comando.Parameters.Add("@mail", mail);
            comando.Parameters.Add("@pass", newPass);
            try
            {
                comando.ExecuteNonQuery();
                return "Contraseña actualizada con exito";
            }
            catch (Exception e)
            {
                return e.Message;
            }

        }


        public int validUser(string mail, string pass)
        {
            string query = "Select tipo, pass from Usuarios WHERE email=@mail and confirmado='true';";
            comando = new SqlCommand(query, conexion);
            comando.Parameters.Add("@mail", mail);
            
            SqlDataReader data;
            try
            {
                data = comando.ExecuteReader();
                data.Read();
                if (cifrar(pass).Equals(data["pass"]))
                {
                    if (((string)data["tipo"]).Equals("P")) return 1; //Profesor
                    else if (((string)data["tipo"]).Equals("A")) return 2; //Alumno
                    else return 0; //Error
                }
                return 0;
                
            }
            catch (Exception e)
            {
                return 0; //Error
            }
            
        }

        public int getMedia(string codAsig)
        {
            string query = "Select AVG(HReales) as media FROM EstudiantesTareas inner join TareasGenericas ON EstudiantesTareas.CodTarea = TareasGenericas.Codigo WHERE TareasGenericas.CodAsig=@codAsig";
            comando = new SqlCommand(query, conexion);
            comando.Parameters.Add("@codAsig", codAsig);
            SqlDataReader data = comando.ExecuteReader();
            data.Read();
            if (data["media"] == DBNull.Value)
                return 0;
            else 
                return (int)data["media"];

        }


    }
}
