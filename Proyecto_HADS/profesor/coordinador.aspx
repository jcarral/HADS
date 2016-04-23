<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="coordinador.aspx.cs" Inherits="Proyecto_HADS.profesor.coordinador" %>

<%@ Register Src="~/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/profesor/MenuProfesor.ascx" TagPrefix="uc1" TagName="MenuProfesor" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../estilo.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

</head>
<body>
    <form id="form1" runat="server">
        <uc1:header runat="server" ID="header" />
        <uc1:MenuProfesor runat="server" ID="MenuProfesor" />
    <div class="caja">
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=tcp:hads19.database.windows.net,1433;Initial Catalog=Users;User ID=hads19@hads19;Password=Serpiente19" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [codigo] FROM [Asignaturas]"></asp:SqlDataSource>
       
                <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="codigo" DataValueField="codigo" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="200px"></asp:ListBox>
                <br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Calcular Media" Width="200px" CssClass="btn btn-success" />
<br />
                <asp:Label ID="Label1" runat="server" Text="Número de horas de media: "></asp:Label>
                <asp:Label ID="lblHoras" runat="server" Text="-"></asp:Label>
           
        
    </div>
        
    </form>
</body>
</html>
