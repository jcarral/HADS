<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TareasAlumno.aspx.cs" Inherits="Proyecto_HADS.TareasAlumno" %>

<%@ Register Src="~/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/MenuAlumno.ascx" TagPrefix="uc1" TagName="MenuAlumno" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Tareas Alumno</title>
    <link href="estilo.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

</head>
<body>
    <form id="form1" runat="server">
        <uc1:header runat="server" id="header" />
        <uc1:MenuAlumno runat="server" ID="MenuAlumno" />
    <div>
    
    </div>
        <asp:DropDownList ID="ddAsignaturas" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <br />
        <asp:CheckBox ID="cbCodigo" runat="server" Checked="True" Enabled="False" Text="Codigo" />
        <br />
        <asp:CheckBox ID="cbDesc" runat="server"  Text="Descripcion" AutoPostBack="True" />
        <br />
        <asp:CheckBox ID="cbHoras" runat="server" Text="Horas" AutoPostBack="True" />
        <br />
        <asp:CheckBox ID="cbTipo" runat="server" Text="Tipo Tarea" AutoPostBack="True" />
        <br />
        <br />
        <asp:GridView ID="gvTareas" OnRowCommand="gvTareas_RowCommand" OnSorting="GridViewSortEventHandler" runat="server" AllowSorting="True" CssClass="table table-bordered table-striped">
            <Columns>
                <asp:ButtonField CommandName="Enlace" Text="Instanciar" ButtonType="Button" >
                
                <ControlStyle CssClass="btn btn-primary" />
                
                </asp:ButtonField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
