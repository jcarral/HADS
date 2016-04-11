using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto_HADS
{
    public partial class ImportarTareasDS : System.Web.UI.Page
    {
        private string path;
        private SqlConnection conn;
        private DataSet dataset;
        private DataTable table;
        private DataView view;
        private SqlDataAdapter adapter;

        protected void Page_Load(object sender, EventArgs e)
        {
            string queryDrop = "Select Asi.Codigo FROM (ProfesoresGrupo as PG inner join GruposClase as GC ON PG.codigogrupo = GC.codigo) inner join Asignaturas as Asi ON GC.codigoasig = Asi.codigo WHERE PG.email = '" + (string)Session["correo"] + "';";
            conn = (SqlConnection)Session["conexion"];

            if (!Page.IsPostBack)
            {
                SqlDataAdapter adapter = new SqlDataAdapter(queryDrop, conn);
                dataset = new DataSet();
                adapter.Fill(dataset, "Drop");

                DropDownList1.DataTextField = dataset.Tables["Drop"].Columns["Codigo"].ToString();
                DropDownList1.DataValueField = dataset.Tables["Drop"].Columns["Codigo"].ToString();
                DropDownList1.DataSource = dataset.Tables["Drop"];
                DropDownList1.DataBind();
                Session["adapterImportarDS"] = adapter;
                Session["datasetImportarDS"] = dataset;
            }else{
                dataset = (DataSet)Session["datasetImportarDS"];
                 adapter = (SqlDataAdapter)Session["adapterImportarDS"];
            }
                
            path = Server.MapPath("~/App_Data/" + DropDownList1.SelectedValue.ToString() + ".xml");
            if (File.Exists(path))
                {
                    DataSet ds = new DataSet();
                    ds.ReadXml(path);
                    table = ds.Tables[0];
                    view = new DataView(table);
                    view.RowFilter = "CodAsig='HAS'";
                    GridView1.DataSource = view;
                    GridView1.DataBind();
                    
                }
                
        }

        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            try
            {
                adapter.InsertCommand = new SqlCommand("Insert into TareasGenericas VALUES (@cod,@desc,@codas,@hes,@exp,@tipo)", conn);
                adapter.InsertCommand.Parameters.Add("@cod", SqlDbType.NVarChar, 50, "Codigo");
                adapter.InsertCommand.Parameters.Add("@desc", SqlDbType.NVarChar, 50, "Descripcion");
                adapter.InsertCommand.Parameters.Add("@codas", SqlDbType.NVarChar, 50, "CodAsig");
                adapter.InsertCommand.Parameters.Add("@hes", SqlDbType.Int, 50, "HEstimadas");
                adapter.InsertCommand.Parameters.Add("@exp", SqlDbType.Bit, 10, "Explotacion");
                adapter.InsertCommand.Parameters.Add("@tipo", SqlDbType.NVarChar, 50, "TipoTarea");

                adapter.Update(view.Table);
                divOk.Attributes["class"] = "alert alert-success";
                divError.Attributes["class"] = "hidden";
            }
            catch (Exception ex)
            {
                divError.Attributes["class"] = "alert alert-danger";
                divOk.Attributes["class"] = "hidden";
            }
        }
    }
}