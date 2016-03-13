using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_HADS
{
    public partial class confirmar : System.Web.UI.Page
    {
        private AccesoDatos.accesoDatos acceso = new AccesoDatos.accesoDatos();

        protected void Page_Load(object sender, EventArgs e)
        {
            acceso.conectar();
            string mail = Request.Params["usr"];
            int codigo;
            try
            {
                codigo = Int32.Parse(Request.Params["cod"]);
                
                if ((mail != null && codigo != null) && acceso.validarRegistro(mail, codigo))
                {
                    lblConfOk.Text = "Registro confirmado correctamente ";
                }
                else
                {
                    Response.Redirect("inicio.aspx");
                    
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("inicio.aspx");
            }


        }
    }
}