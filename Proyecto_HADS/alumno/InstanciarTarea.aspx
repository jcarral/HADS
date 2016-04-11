<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstanciarTarea.aspx.cs" Inherits="Proyecto_HADS.InstanciarTarea" %>

<%@ Register Src="~/header.ascx" TagPrefix="uc1" TagName="header" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Instanciar Tarea</title>
    <link href="../estilo.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

</head>
<body>
    
    <form id="form1" runat="server">
        <uc1:header runat="server" ID="header" />
        <div class="hidden" role="alert" id="divError" runat="server"><strong>Error:</strong> Los datos están duplicados</div>
        <div class="hidden" role="alert" id="divOk" runat="server">El documento se ha importado correctamente.</div>
    <div>
        
        
        <asp:Label ID="lblUsuario" runat="server" Text="Usuario"></asp:Label>
&nbsp;<asp:TextBox ID="tbUsuario" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblTarea" runat="server" Text="Tarea"></asp:Label>
        <asp:TextBox ID="tbTarea" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblHE" runat="server" Text="Horas estimadas"></asp:Label>
        <asp:TextBox ID="tbHE" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbHE" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="lblHR" runat="server" Text="Horas reales"></asp:Label>
        <asp:TextBox ID="tbHR" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="tbHR">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btnCrear" runat="server" CssClass="btn btn-primary" Text="Crear Tarea" OnClick="btnCrear_Click" AutoPostBack="true"/>
        <asp:Button ID="btnVolver" runat="server" CssClass="btn btn-default" Text="Volver" OnClick="btnVolver_Click" CausesValidation="False" />
        <br />
        <asp:GridView ID="gvInst" runat="server" CssClass="table table-bordered">
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
