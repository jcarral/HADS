<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportarTareasDS.aspx.cs" Inherits="Proyecto_HADS.ImportarTareasDS" %>

<%@ Register Src="~/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/MenuProfesor.ascx" TagPrefix="uc1" TagName="MenuProfesor" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Importar Tareas DataSet</title>
     <link href="estilo.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

</head>
<body>
    <form id="form1" runat="server">
        <uc1:header runat="server" id="header" />
        <uc1:MenuProfesor runat="server" id="MenuProfesor" />
    <div>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=tcp:hads19.database.windows.net,1433;Initial Catalog=Users;User ID=hads19@hads19;Password=Serpiente19" ProviderName="System.Data.SqlClient" SelectCommand="Select Asi.Codigo FROM (ProfesoresGrupo as PG inner join GruposClase as GC ON PG.codigogrupo = GC.codigo) inner join Asignaturas as Asi ON GC.codigoasig = Asi.codigo WHERE PG.email = @emailUser;">
            <SelectParameters>
                <asp:SessionParameter Name="emailUser" SessionField="correo" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        
    </div>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <br />
        <div class="hidden" role="alert" id="divError" runat="server"><strong>Error:</strong> Los datos están duplicados o el fichero no es correcto</div>
        <div class="hidden" role="alert" id="divOk" runat="server">La tarea se ha almacenado correctamente.</div>
        <asp:Button ID="btnInsertar" runat="server" CssClass="btn btn-primary" OnClick="btnInsertar_Click" Text="Insertar" />
    </form>
</body>
</html>
