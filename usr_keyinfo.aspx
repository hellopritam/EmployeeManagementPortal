

<%@ Page Title="" Language="VB" MasterPageFile="~/usrcontrol.master" AutoEventWireup="false" CodeFile="usr_keyinfo.aspx.vb" Inherits="usr_keyinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br/>
<asp:Panel ID="Panel1" style="border:1px solid #000;width:670px;height:120px; border-style:dotted"  runat="server">
<br>
<table>
<tr>
<td ><asp:Label ID="Label1" runat="server" Text="Full Name:" Font-Bold="True" Width="100px"></asp:Label></td>
<td ><asp:Label ID="name" runat="server" Text="" style="margin-right:200px;" Width="100px"></asp:Label></td>
<td><asp:Label ID="Label2" runat="server" Text="Email:" Font-Bold="True"></asp:Label></td>
<td><asp:Label ID="email" runat="server" Text=""></asp:Label></td>
</tr>
<tr>
<td ><asp:Label ID="Label3" runat="server" Text="Mobile No:" Font-Bold="True" Width="100px"></asp:Label></td>
<td ><asp:Label ID="mobile_no" runat="server" Text="" style="margin-right:200px;"></asp:Label></td>
<td><asp:Label ID="Label5" runat="server" Text="Full Address" Font-Bold="True" Width="100px"></asp:Label></td>
<td><asp:Label ID="address" runat="server" Text=""></asp:Label></td>
</tr>
<tr>
<td ><asp:Label ID="Label4" runat="server" Text="Date of Birth:" Font-Bold="True" Width="100px"></asp:Label></td>
<td ><asp:Label ID="dob" runat="server" Text="" style="margin-right:200px;"></asp:Label></td>
<td><asp:Label ID="Label7" runat="server" Text="District:" Font-Bold="True"></asp:Label></td>
<td><asp:Label ID="district" runat="server" Text=""></asp:Label></td>
</tr>
<tr>
<td ><asp:Label ID="Label6" runat="server" Text="Sub-Divition:" Font-Bold="True" Width="100px"></asp:Label></td>
<td ><asp:Label ID="sdivition" runat="server" Text="" style="margin-right:200px;"></asp:Label></td>
<td><asp:Label ID="Label9" runat="server" Text="Languages:" Font-Bold="True"></asp:Label></td>
<td><asp:Label ID="language" runat="server" Text=""></asp:Label></td>
</tr><tr>
<td ><asp:Label ID="Label11" runat="server" Text="Gender:" Font-Bold="True"></asp:Label></td>
<td ><asp:Label ID="gender" runat="server" Text="" style="margin-right:200px;"></asp:Label></td>
<td><asp:Label ID="Label13" runat="server" Text="Status:" Font-Bold="True" ></asp:Label></td>
<td><asp:Label ID="status" runat="server" Text="" ForeColor="blue" Font-Bold="True"></asp:Label></td>
</tr>
</table>
    </asp:Panel>
<br/>
</asp:Content>

