<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportarTareasXML.aspx.cs" Inherits="Proyecto_HADS.ImportarTareasXML" %>

<%@ Register Src="~/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/MenuProfesor.ascx" TagPrefix="uc1" TagName="MenuProfesor" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Importar Tareas XML</title>
    <link href="estilo.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

</head>
<body>
    <form id="form1" runat="server">
        <uc1:header runat="server" ID="header" />
        <uc1:MenuProfesor runat="server" ID="MenuProfesor" />
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=tcp:hads19.database.windows.net,1433;Initial Catalog=Users;User ID=hads19@hads19;Password=Serpiente19" ProviderName="System.Data.SqlClient" SelectCommand="Select Asi.Codigo FROM (ProfesoresGrupo as PG inner join GruposClase as GC ON PG.codigogrupo = GC.codigo) inner join Asignaturas as Asi ON GC.codigoasig = Asi.codigo WHERE PG.email = @emailUser;">
            <SelectParameters>
                <asp:SessionParameter Name="emailUser" SessionField="correo" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="ddCodAsi" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Codigo" DataValueField="Codigo" OnDataBound="CargarXML">
        </asp:DropDownList>
        <asp:Xml ID="Xml1" runat="server"></asp:Xml>
    
        <br />
        <div class="hidden" role="alert" id="divError" runat="server"><strong>Error:</strong> Los datos están duplicados o el fichero no es correcto</div>
        <div class="hidden" role="alert" id="divOk" runat="server">La tarea se ha almacenado correctamente.</div>
        <asp:Button ID="btnImportar" runat="server" CssClass="btn btn-primary" OnClick="btnImportar_Click" Text="Importar Datos" />
    
    </div>
    </form>
</body>
</html>
