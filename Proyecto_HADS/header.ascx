<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="Proyecto_HADS.header" %>

<div class="header">
  <div class="logo">
    <img src="./images/upv-ehu.jpg" alt="" width="40px" height="40px">
    <h1>HADS</h1>
  </div>

  <div class="info">
    <div class="info-usuarios info-sesion"><p>
        <asp:Label ID="lblTxt" runat="server" Text=" "></asp:Label>
        <asp:Label ID="lblNombre" runat="server" Text=" "></asp:Label>
        <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
        <asp:Label ID="Label2" runat="server" Text=" "></asp:Label>
        
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Cerrar Sesion" Visible="False" UseSubmitBehavior="False" CausesValidation="False" class="btn btn-default"/>
        
        </p></div>
    <div class="info-conectados info-sesion"><p>Usuarios online: 
        <asp:Label ID="lblNumUsers" runat="server"></asp:Label>
        </p></div>
  </div>
</div>