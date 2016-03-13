using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EnvioMail;

namespace Proyecto_HADS
{
    public partial class registro : System.Web.UI.Page
    {
        private AccesoDatos.accesoDatos acceso = new AccesoDatos.accesoDatos();
        private EnvioMail.envioGmail mailSender = new EnvioMail.envioGmail();

        protected void Page_Load(object sender, EventArgs e)
        {
            string result = acceso.conectar();
        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            acceso.cerrarconexion();
        }

        protected void btnRegCancelar_Click(object sender, EventArgs e)
        {
            
        }

        private int generarCodigo() {
            Random rnd = new Random();
            return rnd.Next(10000, 9999999);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            Dictionary<string, string> datos = new Dictionary<string, string>();
            int codigo = generarCodigo();
            datos.Add("correo", tbRegCorreo.Text);
            datos.Add("nombre", tbRegNombre.Text);
            datos.Add("apellido", tbRegApellido.Text);
            datos.Add("pass", tbRegPass.Text);
            datos.Add("codigo", codigo.ToString());
            datos.Add("pregunta", tbRegPregunta.Text);
            datos.Add("respuesta", tbRegRespuesta.Text);
            datos.Add("dni", tbRegDNI.Text);

            if (acceso.crearUsuario(datos))
            {
                string url = "confirmar.aspx?cod=" + codigo + "&usr=" + Server.UrlEncode(tbRegCorreo.Text);
                mailSender.sendMail(tbRegCorreo.Text, "http://hads19.azurewebsites.net/" + url);
                hyReg.NavigateUrl = url;
                hyReg.Text = "Para validar tu correo haz click aquí o revisa tu bandeja de entrada";
            }
            else
            {
                hyReg.Text = "El registro no es correcto";
                
            }

           
        }
    }
}