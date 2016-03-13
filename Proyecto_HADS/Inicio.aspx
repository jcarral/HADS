<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Proyecto_HADS.Inicio" %>

<%@ Register src="header.ascx" tagname="header" tagprefix="uc1" %>
<%@ Register Src="~/header.ascx" TagPrefix="uc2" TagName="header" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="estilo.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

</head>
<body>
    
    <form id="form1" runat="server">
       <uc2:header runat="server" ID="header" />
        <div class="caja">
        <div style="text-align: center">
        <asp:Label ID="Label1" runat="server" Text="Correo electronico: "></asp:Label>
        <asp:TextBox ID="tbLogInCorreo" runat="server" Height="20px" Width="194px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbLogInCorreo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Contraseña: "></asp:Label>
        <asp:TextBox ID="tbLogInPassword" runat="server" TextMode="Password" Width="243px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbLogInPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnLogIn" runat="server" OnClick="btnLogIn_Click" Text="Entrar" Width="244px" CssClass="btn btn-primary"  />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="registro.aspx">Crear nueva cuenta</asp:HyperLink>
        <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/CambiarPassword.aspx">Cambiar contraseña</asp:HyperLink>
    </div>
    </div>
    </form>
</body>
</html>
