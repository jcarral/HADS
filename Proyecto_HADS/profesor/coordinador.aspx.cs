using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Proyecto_HADS.profesor
{
    public partial class Coordinador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            InfoAsignatura info = new InfoAsignatura();
           MediaHoras servicio = new MediaHoras();
            lblHoras.Text = servicio.getMedia((string)ListBox1.SelectedValue).ToString();
            string infoProf = info.getInfo((string)ListBox1.SelectedValue);
            string []aInfo = infoProf.Split('&');
            lblCorreos.Text = aInfo[0];
            lblNombres.Text = aInfo[1];
        }


        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MediaHoras servicio = new MediaHoras();
            InfoAsignatura info = new InfoAsignatura();
            lblHoras.Text = servicio.getMedia((string)ListBox1.SelectedValue).ToString();
            string infoProf = info.getInfo((string)ListBox1.SelectedValue);
            string[] aInfo = infoProf.Split('&');
            lblCorreos.Text = aInfo[0];
            lblNombres.Text = aInfo[1];
        }
    }
}