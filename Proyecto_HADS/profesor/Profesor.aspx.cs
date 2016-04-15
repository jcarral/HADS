using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Timers;

namespace Proyecto_HADS
{
    
    public partial class Profesor : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = Application.Contents["profesores"];
            GridView1.DataBind();

            
        }

    }
}