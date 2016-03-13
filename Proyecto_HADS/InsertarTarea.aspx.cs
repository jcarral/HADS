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
    public partial class InsertarTarea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            validConexion();
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            string query = "SELECT * FROM TareasGenericas;";
            DataTable dt = new DataTable();
            SqlConnection conn = (SqlConnection)Session["conexion"]; 
            conn.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter();
            sqlDa.SelectCommand = new SqlCommand(query, conn);
            SqlCommandBuilder cb = new SqlCommandBuilder(sqlDa);
            sqlDa.Fill(dt);
            DataRow fila = dt.NewRow();
            fila["Codigo"]= tbCodigoTarea.Text;
            fila["Descripcion"]= tbDesc.Text;
            fila["CodAsig"]= DropDownList1.SelectedItem.Text;
            fila["HEstimadas"]= tbHoras.Text;
            fila["Explotacion"]= cbExplotacion.Checked;
            fila["TipoTarea"]= tbTipo.Text;
            dt.Rows.Add(fila);
            sqlDa.UpdateCommand = cb.GetUpdateCommand();
            sqlDa.Update(dt);

        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("TareasProfesor.aspx");
        }

        protected void validConexion()
        {
            if (Session["correo"] == null || !Session["tipo"].Equals("P"))
                Response.Redirect("Inicio.aspx");
        }
        
    }
}