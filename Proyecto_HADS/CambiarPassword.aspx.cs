using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_HADS
{
    public partial class CambiarPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVolverInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }

        protected void btnCambiarConfirmar_Click(object sender, EventArgs e)
        {
            AccesoDatos.accesoDatos acceso = new AccesoDatos.accesoDatos();
            acceso.conectar();

            string mail = tbCambiarCorreo.Text;
            string oldPass = tbCambiarOldPass.Text;
            string newPass = tbCambiarNuevaPass.Text;
            
            if(acceso.validUser(mail, oldPass) > 0){

                LabelOK.Text = acceso.updatePass(mail, newPass);
            }else{
                LabelError.Text = "Tus datos de usuario no son correctos";
            }

            acceso.cerrarconexion();
        }
    }
}