<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TareasProfesor.aspx.cs" Inherits="Proyecto_HADS.TareasProfesor" %>

<%@ Register Src="~/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/MenuProfesor.ascx" TagPrefix="uc1" TagName="MenuProfesor" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Tareas Profesor</title>
    <link href="estilo.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <uc1:header runat="server" ID="header" />
        <uc1:MenuProfesor runat="server" ID="MenuProfesor" />
    <div>
    
    </div>
        
       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=tcp:hads19.database.windows.net,1433;Initial Catalog=Users;User ID=hads19@hads19;Password=Serpiente19" ProviderName="System.Data.SqlClient" SelectCommand="Select Asi.Nombre FROM (ProfesoresGrupo as PG inner join GruposClase as GC ON PG.codigogrupo = GC.codigo) inner join Asignaturas as Asi ON GC.codigoasig = Asi.codigo WHERE PG.email = @emailUser;">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="emailUser" SessionField="correo" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=tcp:hads19.database.windows.net,1433;Initial Catalog=Users;User ID=hads19@hads19;Password=Serpiente19" ProviderName="System.Data.SqlClient" SelectCommand="Select Tar.* FROM ((ProfesoresGrupo as PG inner join GruposClase as GC ON PG.codigogrupo = GC.codigo) inner join Asignaturas as Asi ON GC.codigoasig = Asi.codigo) inner join TareasGenericas as Tar on Asi.codigo = Tar.CodAsig WHERE PG.email = @mailProf AND Asi.nombre=@nombre;" UpdateCommand="UPDATE [TareasGenericas] SET [Descripcion] = @Descripcion, [CodAsig] = @CodAsig, [HEstimadas] = @HEstimadas, [Explotacion] = @Explotacion, [TipoTarea] = @TipoTarea WHERE [Codigo] = @Codigo">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="mailProf" SessionField="correo" />
                <asp:ControlParameter ControlID="DropDownList1" Name="nombre" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Descripcion" />
                <asp:Parameter Name="codAsig" />
                <asp:Parameter Name="HEstimadas" />
                <asp:Parameter Name="explotacion" />
                <asp:Parameter Name="TipoTarea" />
                <asp:Parameter Name="codigo" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="Nombre" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" CssClass="selectpicker">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="btnInsertar" runat="server" CssClass="btn btn-info" PostBackUrl="~/InsertarTarea.aspx" Text="Insertar nueva tarea" Width="175px" />
        <br />
        <asp:GridView ID="GridView1" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Codigo" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" AllowSorting="True">
            
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:BoundField DataField="CodAsig" HeaderText="CodAsig" SortExpression="CodAsig" />
                <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                <asp:BoundField DataField="TipoTarea" HeaderText="TipoTarea" SortExpression="TipoTarea" />
            </Columns>
            
        </asp:GridView>
        
       
    </form>
</body>
</html>
