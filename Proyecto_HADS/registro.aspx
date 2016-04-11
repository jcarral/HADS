<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registro.aspx.cs" Inherits="Proyecto_HADS.registro" %>

<%@ Register Src="~/header.ascx" TagPrefix="uc1" TagName="header" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<link href="estilo.css" rel="stylesheet" />
<body>
    
    <form id="form1" runat="server" >
        <uc1:header runat="server" ID="header" />
        <div class="caja">
        <div>
        <asp:Label ID="Label1" runat="server" Text="Correo electronico: "></asp:Label>
        <asp:TextBox ID="tbRegCorreo" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbRegCorreo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbRegCorreo" ErrorMessage="Dirección de correo no valida" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>
        <br />
        <div>
        <asp:Label ID="Label2" runat="server" Text="Nombre: "></asp:Label>
        <asp:TextBox ID="tbRegNombre" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbRegNombre" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <br />
        <div>
        <asp:Label ID="Label8" runat="server" Text="Apellido: "></asp:Label>
        <asp:TextBox ID="tbRegApellido" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbRegApellido" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
            <br />
        <div>
        <asp:Label ID="Label3" runat="server" Text="DNI: "></asp:Label>
        <asp:TextBox ID="tbRegDNI" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbRegDNI" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
            <br />
        <div>
        <asp:Label ID="Label4" runat="server" Text="Contraseña: "></asp:Label>
        <asp:TextBox ID="tbRegPass" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbRegPass" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbRegPass" ErrorMessage="Contraseña demasiado débil, debe contener 8 caracteres, 1 digito y una mayuscula" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"></asp:RegularExpressionValidator>
        </div>
            <br />
        <div>
        <asp:Label ID="Label5" runat="server" Text="Confirmar contraseña: "></asp:Label>
        <asp:TextBox ID="tbRegConfPass" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbRegConfPass" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbRegPass" ControlToValidate="tbRegConfPass" ErrorMessage="La contraseña no coincide" ForeColor="Red"></asp:CompareValidator>
        </div>
            <br />
        <div>
        <asp:Label ID="Label6" runat="server" Text="Pregunta secreta: "></asp:Label>
        <asp:TextBox ID="tbRegPregunta" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tbRegPregunta" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
            <br />
        <div>
        <asp:Label ID="Label7" runat="server" Text="Respuesta: "></asp:Label>
        <asp:TextBox ID="tbRegRespuesta" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tbRegRespuesta" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
            <br />
            <asp:Label ID="Label9" runat="server" Text="Tipo: "></asp:Label>
            <asp:RadioButton ID="rdAlumno" runat="server" Checked="True" GroupName="radiosTipo" Text="Alumno" />
            <asp:RadioButton ID="rdProfesor" runat="server" Text="Profesor" GroupName="radiosTipo" />
            <br />
            <asp:Label ID="Label10" runat="server" Text="Grupo: "></asp:Label>
            <asp:TextBox ID="tbGrupo" runat="server" TextMode="Number" Width="52px"></asp:TextBox>
            <br />
        <asp:HyperLink ID="hyReg" runat="server" ForeColor="#00CC00">_</asp:HyperLink>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Registrarse!" OnClick="Button1_Click" />
        <asp:Button ID="btnRegCancelar" runat="server" OnClick="btnRegCancelar_Click" Text="Cancelar" />
    </div>
            </form>
</body>
</html>
