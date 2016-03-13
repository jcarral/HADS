<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alumno.aspx.cs" Inherits="Proyecto_HADS.Alumno" %>

<%@ Register Src="~/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/MenuAlumno.ascx" TagPrefix="uc1" TagName="MenuAlumno" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Alumnos</title>
    <link href="estilo.css" rel="stylesheet" />
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
    </form>
</body>
</html>
