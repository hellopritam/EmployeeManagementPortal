<%@ Page Title="" Language="VB" MasterPageFile="~/Usrlogin.master" AutoEventWireup="false" CodeFile="EmpLogin.aspx.vb" Inherits="EmpLogin" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <style>
    #ex1 {
  border-radius: 5px 5px 5px 5px;
  background: #73AD21;
  padding: 20px;
  width: 200px;
  height: 150px;
}
        .auto-style1
        {
            width: 150px;
        }
        .auto-style2
        {
            width: 360px;
        }
        .auto-style3
        {
            width: 200px;
        }
    </style>
<h1><asp:Label ID="Label4" runat="server" Text=""></asp:Label></h1>
 <table id="ex1" class="auto-style2">
         <tr>
         <td colspan="2">
         <asp:Image ID="Image1" runat="server" Width="260px" Height="87px" 
                 ImageUrl="~/boot/UserLogin.gif" ></asp:Image>
         </td>
         </tr>
        <tr>
            <td class="auto-style1"><asp:Label ID="Label1" runat="server" Text="UserName" Font-Bold="True"></asp:Label></td>
            <td class="auto-style3">
                <br />
                <asp:TextBox ID="abc" runat="server" Width="160px" Height="30px" placeholder="User Name"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
        
        <tr>
           <td class="auto-style1"><asp:Label ID="Label2" runat="server" Text="Password" Font-Bold="True"></asp:Label></td>
            <td class="auto-style3">
                <br />
                <asp:TextBox ID="TextBox2" runat="server" Width="160px" Height="30px" TextMode="password" placeholder="Password"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
        
        <tr>
             <td class="auto-style1"><asp:Label ID="Label3" runat="server" Text="Enter Captcha" Font-Bold="True"></asp:Label></td>  
            <td class="auto-style3">
                <cap:CaptchaControl ID="captcha1" runat="server" CaptchaLength="5" 
                    CaptchaHeight="40" CaptchaWidth="162" CaptchaLineNoise="None" 
                    CaptchaMinTimeout="3" CaptchaMaxTimeout="240" ForeColor="Blue" 
                    BackColor="Yellow" CaptchaChars="ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789" 
                    Height="25px" Width="162px" />
                <br/><br/><asp:TextBox ID="TextBox3" runat="server" Width="160px" Height="30px" placeholder="Verify Capcha"></asp:TextBox>
                <br />
            </td>
          </tr>
        <tr>
            <td colspan="2">
                <br><center><asp:Button ID="Button1" runat="server" Text="Login" Width="232px" 
                        Height="30px" BackColor=#00a3a3cc ForeColor=white></asp:Button>
                    <br />
                    <br />
                </center>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <center><asp:Button ID="Button2" runat="server" Text="Sign Up" Width="232px" 
                        Height="30px"  BackColor=#ff9900 ForeColor=White></asp:Button>
                    <br />
                    <br />
                </center>
            </td>
        </tr>
    </table>
 <br/>

</asp:Content>


