<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CambiarPassword.aspx.cs" Inherits="Proyecto_HADS.CambiarPassword" %>

<%@ Register Src="~/header.ascx" TagPrefix="uc1" TagName="header" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="estilo.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <uc1:header runat="server" id="header" />
       <div class="caja">
    <div>
    
        Correo:
        <asp:TextBox ID="tbCambiarCorreo" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbCambiarCorreo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbCambiarCorreo" ErrorMessage="Dirección de correo no valida" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
        Contraseña:<asp:TextBox ID="tbCambiarOldPass" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbCambiarOldPass" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        Nueva contraseña:
        <asp:TextBox ID="tbCambiarNuevaPass" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbCambiarNuevaPass" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbCambiarNuevaPass" ErrorMessage="Contraseña demasiado débil, debe contener 8 caracteres, 1 digito y una mayuscula" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"></asp:RegularExpressionValidator>
        <br />
        Repetir nueva contraseña: <asp:TextBox ID="tbCambiarConfPass" runat="server" TextMode="Password"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbCambiarNuevaPass" ControlToValidate="tbCambiarConfPass" ErrorMessage="La contraseña no coincide" ForeColor="Red"></asp:CompareValidator>
        <br />
        <asp:Label ID="LabelOK" runat="server" ForeColor="#33CC33" Text=" "></asp:Label>
        <br />
        <asp:Label ID="LabelError" runat="server" ForeColor="Red" Text="  "></asp:Label>
        <br />
        <asp:Button ID="btnCambiarConfirmar" runat="server" Text="Confirmar" OnClick="btnCambiarConfirmar_Click" />
        <asp:Button ID="btnVolverInicio" runat="server" CausesValidation="False" OnClick="btnVolverInicio_Click" Text="Volver a inicio" />
    </div>
    </div>
    </form>
</body>
</html>
