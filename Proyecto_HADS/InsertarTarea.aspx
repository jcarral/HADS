<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertarTarea.aspx.cs" Inherits="Proyecto_HADS.InsertarTarea" %>

<%@ Register Src="~/header.ascx" TagPrefix="uc1" TagName="header" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Insertar tarea</title>
     <link href="estilo.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

</head>
<body>
    <form id="form1" runat="server">
        <uc1:header runat="server" ID="header" />
    <div>
    
    
        <asp:Label ID="lblCodigoTarea" runat="server" Text="Código"></asp:Label>
        <asp:TextBox ID="tbCodigoTarea" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbCodigoTarea" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblDesc" runat="server" Text="Descripcion"></asp:Label>
        <br />
        <asp:TextBox ID="tbDesc" runat="server" Height="133px" TextMode="MultiLine" Width="430px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbDesc" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblCodAs" runat="server" Text="Codigo asignatura:"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="codigo" DataValueField="codigo">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=tcp:hads19.database.windows.net,1433;Initial Catalog=Users;User ID=hads19@hads19;Password=Serpiente19" ProviderName="System.Data.SqlClient" SelectCommand="Select Asi.codigo FROM (ProfesoresGrupo as PG inner join GruposClase as GC ON PG.codigogrupo = GC.codigo) inner join Asignaturas as Asi ON GC.codigoasig = Asi.codigo WHERE PG.email = @mail;
">
            <SelectParameters>
                <asp:SessionParameter Name="mail" SessionField="correo" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="lblHoras" runat="server" Text="Horas estimadas"></asp:Label>
        <asp:TextBox ID="tbHoras" runat="server" TextMode="Number"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbHoras" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:CheckBox ID="cbExplotacion" runat="server" Text="Explotacion" />
        <br />
        <br />
        <asp:Label ID="lblTipo" runat="server" Text="Tipo"></asp:Label>
        <asp:TextBox ID="tbTipo" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbTipo" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btnConfirmar" runat="server" OnClick="btnConfirmar_Click" Text="Confirmar" Width="171px" CssClass="btn btn-primary" />
        <asp:Button ID="btnVolver" runat="server" Text="Volver" OnClick="btnVolver_Click" CssClass="btn btn-default" CausesValidation="False" />
        <br />
        </div>
    </form>
</body>
</html>
