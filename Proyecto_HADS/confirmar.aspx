<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirmar.aspx.cs" Inherits="Proyecto_HADS.confirmar" %>

<%@ Register src="header.ascx" tagname="header" tagprefix="uc1" %>
<%@ Register Src="~/header.ascx" TagPrefix="uc2" TagName="header" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="estilo.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <uc2:header runat="server" ID="header" />
        <div class="caja">
    <div>
        
     
    
        &nbsp;<asp:Label ID="lblConfOk" runat="server" ForeColor="#33CC33" Text=" "></asp:Label>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="inicio.aspx">Volver a Inicio</asp:HyperLink>
    </div>
    </div>
    </form>
</body>
</html>
