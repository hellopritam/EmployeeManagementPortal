<%@ Page Title="" Language="VB" MasterPageFile="~/adminlogin.master" AutoEventWireup="false" CodeFile="admin_login.aspx.vb" Inherits="admin_login" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contentplaceholder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <style>
    #ex1 {

  background: lightgoldenrodyellow;

}
    </style>
<h1><asp:Label ID="Label4" runat="server" Text=""></asp:Label></h1>
 <table id="ex1">
        <tr>
         <td colspan="2">
      
         <asp:Image ID="Image1" runat="server" Width="255px" Height="100px" 
                 ImageUrl="~/boot/adminlogin.jpg" ></asp:Image>
     
         </td>
         </tr>
        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="AdminName" Font-Bold="True"></asp:Label></td>
            <td><asp:TextBox ID="abc" runat="server" Width="160px" Height="30px" placeholder="Admin Id"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
        
        <tr>
           <td><asp:Label ID="Label2" runat="server" Text="Password" Font-Bold="True"></asp:Label></td>
            <td><asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="160px" Height="30px" placeholder="Password"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
         <tr>
              <td><asp:Label ID="Label3" runat="server" Text="Enter Captcha" Font-Bold="True"></asp:Label></td>  
            <td>
                <cap:CaptchaControl ID="captcha1" runat="server" CaptchaLength="5" CaptchaHeight="40" CaptchaWidth="160" CaptchaLineNoise="None" CaptchaMinTimeout="3" CaptchaMaxTimeout="240" ForeColor="Blue" BackColor="Yellow" CaptchaChars="ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789" Height="46px" Width="160px" />
                <br/><asp:TextBox ID="TextBox3" runat="server" height="30px" Width="160px" placeholder="Verify Captcha"></asp:TextBox>
            </td>
          </tr>
        <tr>
            <td colspan="2">
                <br><center><asp:Button ID="Button1" runat="server" Text="Login" Width="60px" height="30px"
                        ForeColor="White" BackColor=#0BBFFF></asp:Button></center>
            </td>
        </tr>
    </table>
 
</asp:Content>

