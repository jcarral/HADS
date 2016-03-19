using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto_HADS
{
    public partial class ExportarTareas : System.Web.UI.Page
    {
        DataTable dtGV;
        SqlConnection conexion;
        DataSet dataset;
        SqlDataAdapter adapter;
        DataTable table;
        DataView view;

        protected void Page_Load(object sender, EventArgs e)
        {
            conexion = (SqlConnection)Session["conexion"];
            String query = "Select * from TareasGenericas";
            string queryDrop = "Select Asi.Codigo FROM (ProfesoresGrupo as PG inner join GruposClase as GC ON PG.codigogrupo = GC.codigo) inner join Asignaturas as Asi ON GC.codigoasig = Asi.codigo WHERE PG.email = '"+(string) Session["correo"] +"';";
            if (Page.IsPostBack)
            {
                dataset = (DataSet)Session["datasetExportar"];
                view = (DataView)Session["viewExportar"];
                table = (DataTable)Session["tableExportar"];
            }
            else
            {
                adapter = new SqlDataAdapter(query, conexion);
                dataset = new DataSet("tareas");
                adapter.Fill(dataset, "tarea");
                adapter.SelectCommand.CommandText = queryDrop;
                adapter.Fill(dataset, "Drop");

                DropDownList1.DataTextField = dataset.Tables["Drop"].Columns["Codigo"].ToString();
                DropDownList1.DataValueField = dataset.Tables["Drop"].Columns["Codigo"].ToString();
                DropDownList1.DataSource = dataset.Tables["Drop"];
                DropDownList1.DataBind();

                table = dataset.Tables["tarea"];
                view = new DataView(table);
                
                Session["datasetExportar"] = dataset;
                Session["viewExportar"] = view;
                Session["tableExportar"] = table;
            }

            string dat = DropDownList1.SelectedValue.ToString();
            view.RowFilter = "CodAsig='" + dat + "'";
            gridView.DataSource = view;
            gridView.DataBind();

        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/App_Data/" + DropDownList1.SelectedValue + ".xml");
            DataTable table2 = view.ToTable();
            DataSet dataSet2 = new DataSet("tareas");
            dataSet2.Tables.Add(table2);
            dataSet2.WriteXml(path);
          
        }
    }
}