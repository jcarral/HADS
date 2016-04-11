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
    public partial class ImportarTareasXML : System.Web.UI.Page
    {
        private string path;
        SqlConnection conn;
        DataSet dataset;
        SqlDataAdapter adapter;


        protected void Page_Load(object sender, EventArgs e)
        {
            rellenar_XML();

            conn = (SqlConnection)Session["conexion"];
            string query = "Select * from TareasGenericas";
            if (Page.IsPostBack)
            {
                dataset = (DataSet)Session["datasetImportarXML"];
                adapter = (SqlDataAdapter) Session["adapterImportarXML"];
            }
            else
            {
                adapter = new SqlDataAdapter(query, conn);
                dataset = new DataSet();
                adapter.Fill(dataset, "Tareas");

                Session["datasetImportarXML"] = dataset;
                Session["adapterImportarXML"] = adapter;
            }
        }

        //Función para el evento OnDataBound del dropdown
        protected void CargarXML(object sender, EventArgs e)
        {
           rellenar_XML();
        }

        private void rellenar_XML()
        {
            try
            {
                path = Server.MapPath("~/App_Data/" + ddCodAsi.SelectedValue + ".xml");
                if(File.Exists(path)){
                    
                    Xml1.DocumentSource = path;
                    Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btnImportar_Click(object sender, EventArgs e)
        {
            try { 
            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(path);

            DataTable table = dataset.Tables["Tareas"];
            XmlNodeList lista = xdoc.GetElementsByTagName("tarea");

            foreach (XmlNode node in lista)
            {
                DataRow row = table.NewRow();
                row["Codigo"] = node["codigo"].InnerText;
                row["Descripcion"] = node["descripcion"].InnerText;
                row["CodAsig"] = ddCodAsi.SelectedValue;
                row["HEstimadas"] = node["hestimadas"].InnerText;
                row["Explotacion"] = node["explotacion"].InnerText;
                row["TipoTarea"] = node["tipotarea"].InnerText;
                table.Rows.Add(row);
            }
            
           
                SqlCommandBuilder cb = new SqlCommandBuilder(adapter);
                adapter.UpdateCommand = cb.GetUpdateCommand();
                adapter.Update(table);
                
                divOk.Attributes["class"] = "alert alert-success";
                divError.Attributes["class"] = "hidden";
            }catch(Exception ex){
                divError.Attributes["class"] = "alert alert-danger";
                divOk.Attributes["class"] = "hidden";
            }

            
        }
    }
}