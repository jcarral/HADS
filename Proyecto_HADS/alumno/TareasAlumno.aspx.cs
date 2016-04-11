using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto_HADS
{
    public partial class TareasAlumno : System.Web.UI.Page
    {
        DataSet dstDDL;
        DataView dvGV;
        DataTable dtGV;
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            conn = (SqlConnection)Session["conexion"];
            string query = "Select Asi.Nombre, Asi.codigo FROM (Asignaturas as Asi inner join GruposClase as GC on Asi.codigo = GC.codigoasig) inner join EstudiantesGrupo as EG on EG.Grupo = GC.codigo WHERE EG.Email='" + Session["correo"] + "';";
            string queryTareas = "Select * FROM TareasGenericas";
            

            if (Page.IsPostBack)
            {
                dstDDL = (DataSet) Session["dataset"];
                dvGV = (DataView) Session["view"];
            }
            else
            {
                SqlDataAdapter dapDDL = new SqlDataAdapter(query, conn);
                dstDDL = new DataSet();
                dapDDL.Fill(dstDDL, "Select");
                dapDDL.SelectCommand.CommandText = queryTareas;
                dapDDL.Fill(dstDDL, "TareasGenericas");
        
                ddAsignaturas.DataTextField = dstDDL.Tables["Select"].Columns["Nombre"].ToString();
                ddAsignaturas.DataValueField = dstDDL.Tables["Select"].Columns["codigo"].ToString();
                ddAsignaturas.DataSource = dstDDL.Tables["Select"];
                ddAsignaturas.DataBind();

                dtGV = dstDDL.Tables["TareasGenericas"];
                dvGV = new DataView(dtGV);

                Session["dataset"] = dstDDL;
                Session["view"] = dvGV;
            }

            string dat = ddAsignaturas.SelectedValue.ToString();
            dvGV.RowFilter = "CodAsig='" + dat + "'";
            gvTareas.DataSource = dvGV; 
            gvTareas.DataBind();

        }


        protected void gvTareas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Enlace")
            {
               int index = Convert.ToInt32(e.CommandArgument);
               GridViewRow row = gvTareas.Rows[index];
               Response.Redirect("InstanciarTarea.aspx?codigo=" + row.Cells[1].Text);
            }

        }

        protected void GridViewSortEventHandler(object sender, GridViewSortEventArgs e)
        {
            dvGV.Sort = e.SortExpression;
        }

        
    }
}