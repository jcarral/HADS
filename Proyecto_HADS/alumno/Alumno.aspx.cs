using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Proyecto_HADS
{
    public partial class Alumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ListBox2.DataSource = Application.Contents["alumnos"];
            ListBox2.DataBind();
            ListBox1.DataSource = Application.Contents["profesores"];
            ListBox1.DataBind();

            lblEstudiantes.Text = ((LinkedList<string>)Application.Contents["alumnos"]).Count.ToString();
            lblProfesores.Text = ((LinkedList<string>)Application.Contents["profesores"]).Count.ToString();
        }

        

    }
}