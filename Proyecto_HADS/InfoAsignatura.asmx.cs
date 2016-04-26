using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Proyecto_HADS
{
    /// <summary>
    /// Descripción breve de InfoAsignatura
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class InfoAsignatura : System.Web.Services.WebService
    {

        [WebMethod]
        public string getInfo(string codAsig)
        {
            AccesoDatos.accesoDatos acceso = new AccesoDatos.accesoDatos();
            acceso.conectar();
            string res = acceso.getAsignaturaInfo(codAsig);
            acceso.cerrarconexion();

            return res;
        }
    }
}
