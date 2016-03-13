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
    public partial class InstanciarTarea : System.Web.UI.Page
    {
        DataSet dstGV; 
        DataTable dtGV;
        SqlDataAdapter adapter;

        protected void Page_Load(object sender, EventArgs e)
        {
            validConexion();
            SqlConnection conn = (SqlConnection)Session["conexion"];
            string query = "Select * FROM EstudiantesTareas WHERE Email='" + Session["correo"] + "';";
            tbUsuario.Text = (string) Session["correo"];
            tbTarea.Text = Request.QueryString["codigo"];

            if (Page.IsPostBack)
            {
                dstGV = (DataSet)Session["datasetInstanciar"];
                adapter = (SqlDataAdapter)Session["adapter"];
            }
            else
            {
                adapter = new SqlDataAdapter(query, conn);
                dstGV = new DataSet();
                adapter.Fill(dstGV, "TareasAlumno");

                Session["adapter"] = adapter;
                Session["datasetInstanciar"] = dstGV;
            }

            dtGV = dstGV.Tables["TareasAlumno"];
            gvInst.DataSource = dtGV;
            gvInst.DataBind();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("TareasAlumno.aspx");
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            DataRow row = dtGV.NewRow();
            row["Email"] = (string)Session["correo"];
            row["CodTarea"] = Request.QueryString["codigo"];
            row["HEstimadas"] = tbHE.Text;
            row["HReales"] = tbHR.Text;
            dtGV.Rows.Add(row);
            SqlCommandBuilder cb = new SqlCommandBuilder(adapter);
            
            try
            {
                adapter.UpdateCommand = cb.GetUpdateCommand();
                adapter.Update(dtGV);
                divOk.Attributes["class"] = "alert alert-success";
                divError.Attributes["class"] = "hidden";
                gvInst.DataSource = dtGV;
                gvInst.DataBind();
            }
            catch (Exception ex)
            {
                divError.Attributes["class"] = "alert alert-danger";
                divOk.Attributes["class"] = "hidden";
            }
        }

        protected void validConexion()
        {
            if (Session["correo"] == null || !Session["tipo"].Equals("A"))
                Response.Redirect("Inicio.aspx");
        }

    }
}