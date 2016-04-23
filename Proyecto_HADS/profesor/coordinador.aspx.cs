using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Proyecto_HADS.profesor
{
    public partial class coordinador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
       
            mediaHoras servicio = new mediaHoras();
            lblHoras.Text = servicio.getHoras((string)ListBox1.SelectedValue).ToString();
            
        }


        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            mediaHoras servicio = new mediaHoras();
            
            lblHoras.Text = servicio.getHoras((string)ListBox1.SelectedValue).ToString();

        }
    }
}