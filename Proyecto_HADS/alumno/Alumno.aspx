<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alumno.aspx.cs" Inherits="Proyecto_HADS.Alumno" %>

<%@ Register Src="~/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/alumno/MenuAlumno.ascx" TagPrefix="uc1" TagName="MenuAlumno" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Alumnos</title>
    <link href="../estilo.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

</head>
<body>
    <form id="form1" runat="server">
        <uc1:header runat="server" ID="header" />
        <uc1:MenuAlumno runat="server" id="MenuAlumno" />
    <div>
    <div style="text-align: center"><h1>GESTIÓN WEB DE TAREAS-DEDICACIÓN</h1>
        <br />
        <h1>ALUMNOS</h1>
        </div>
    </div>

        <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="online-list">
                    <h3 class="online-title">Alumnos online</h3>
                    <asp:ListBox ID="ListBox2" runat="server" CssClass="list-group" Width="240px"></asp:ListBox>
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Número de estudiantes: "></asp:Label>
                <asp:Label ID="lblEstudiantes" runat="server" Text="0" CssClass="badge"></asp:Label>
                </div>
                <div class="online-list">
                    <h3 class="online-title">Profesores online</h3>
                     <asp:ListBox ID="ListBox1" runat="server" Width="240px"></asp:ListBox>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Número de profesores: "></asp:Label>
                <asp:Label ID="lblProfesores" runat="server" Text="0" CssClass="badge"></asp:Label>
                </div>
                <br />
                <asp:Timer ID="Timer1" runat="server" Interval="4000">
                </asp:Timer>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
