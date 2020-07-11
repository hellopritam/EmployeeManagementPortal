<%@ Page Title="" Language="VB" MasterPageFile="~/Usrlogin.master" AutoEventWireup="false" CodeFile="Empregister.aspx.vb" Inherits="Empregister" %>

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
</style>
    <br>
    <table id="ex1">
         <tr>
            <td colspan="3">
                 <center><asp:Label ID="reg_msg" runat="server" Text="" Font-Bold="True" ForeColor="Black"></asp:Label></center>
            </td>
        </tr>
         <tr>
            <td colspan="3">
                 <center><h2>Applicant Deatails</h2></center>
            </td>
        </tr>

         <tr>
            <td><asp:Label ID="Label1" runat="server" Text="Employee Name" Font-Bold="True" ForeColor="Black"></asp:Label></td>
            <td>
                <br />
                <asp:TextBox ID="ename" runat="server" Width="160px" Height="30px" placeholder="Enter Name"></asp:TextBox>
                <br />
                <br />
             </td>
            <td><asp:Label ID="ename_msg" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
        </tr>
        <tr>
           <td><asp:Label ID="Label2" runat="server" Text="Mobile Number" Font-Bold="True" ForeColor="Black"></asp:Label></td>
           <td><asp:TextBox ID="mobile_no" runat="server" Width="160px" Height="30px" placeholder="Enter Mobile Number"></asp:TextBox>
               <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="mobile_no" ErrorMessage="Enter a Valid Mobile Number" 
                    ValidationExpression="^([7-9]{1})([0-9]{9})$" Font-Bold="True" 
                   ForeColor="Black"></asp:RegularExpressionValidator>
            </td>
           <td><asp:Label ID="mobile_msg" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
        </tr>
          <tr>
            <td><asp:Label ID="Label5" runat="server" Text="Email Id" Font-Bold="True" ForeColor="Black"></asp:Label></td>
            <td><asp:TextBox ID="email" runat="server" Width="160px" Height="30px" placeholder="Enter Email-Id"></asp:TextBox>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ControlToValidate="email" ErrorMessage="Enter a Valid Email Id" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                 Font-Bold="True" ForeColor="Black"></asp:RegularExpressionValidator></td>
            <td><asp:Label ID="email_msg" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
        </tr>
         <tr>
           <td><asp:Label ID="Label4" runat="server" Text="Date Of Birth" Font-Bold="True" ForeColor="Black"></asp:Label></td>
            <td><asp:TextBox ID="dob" runat="server" Width="160px" Height="30px" 
                    TextMode="Date" placeholder="Enter DOB"></asp:TextBox>
                <br />
                <br />
            </td>
           <td><asp:Label ID="dob_msg" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
        </tr>
          <tr>
           <td><asp:Label ID="Label17" runat="server" Text="Full Address" Font-Bold="True" ForeColor="Black"></asp:Label></td>
           <td><asp:TextBox ID="faddress" runat="server" Height="43px" TextMode="MultiLine" 
                   Width="161px" placeholder="Enter Full Address"></asp:TextBox>
               <br />
               <br />
             </td>
           <td><asp:Label ID="faddress_msg" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
         </tr>
         <tr>
           <td><asp:Label ID="Label6" runat="server" Text="Language Known" Font-Bold="True" 
                   ForeColor="Black"></asp:Label></td>
           <td>
               <asp:CheckBox ID="language1" Text="bengali" runat="server" />
               <asp:CheckBox ID="language2" Text="english" runat="server" />
               <asp:CheckBox ID="language3" Text="hindi" runat="server" />
               <br />
               <br />
             </td>
           <td><asp:Label ID="language_msg" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
         </tr>
          <tr>
           <td><asp:Label ID="Label18" runat="server" Text="Gender" Font-Bold="True" ForeColor="Black"></asp:Label></td>
            <td>
            <asp:RadioButtonList ID="RadioBut" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Text="male" Selected="True" />
            <asp:ListItem Text="female"/>
            <asp:ListItem Text="others"/>
          </asp:RadioButtonList>
          <br>
            </td>
            <td><asp:Label ID="gender_msg" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
        </tr>
         <tr>
           <td><asp:Label ID="Label9" runat="server" Text="District" Font-Bold="True" ForeColor="Black"></asp:Label></td>
            <td><asp:DropDownList ID="district" runat="server" DataSourceID="SqlDataSource1" 
                    DataTextField="name" DataValueField="name" AppendDataBoundItems="true" Width="160px" Height="30px">
                    <asp:ListItem Text="select district" Value="select" />
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:pritamConnectionString %>" 
                    SelectCommand="SELECT [name] FROM [district4]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="district" ErrorMessage="Please select a district" 
                    InitialValue="select" Font-Bold="True"></asp:RequiredFieldValidator>
                <br />
           </td>
           <td><asp:Label ID="district_msg" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
        </tr>
       <tr>
           <td><asp:Label ID="Label10" runat="server" Text="Subdivition" Font-Bold="True" ForeColor="Black"></asp:Label></td>
            <td><asp:DropDownList ID="sdivition" runat="server" DataSourceID="SqlDataSource2" 
                    DataTextField="sname" DataValueField="sname" AppendDataBoundItems="true" Width="160px" Height="30px">
                    <asp:ListItem Text="select subdivition" Value="select"/>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:pritamConnectionString %>" 
                    SelectCommand="SELECT [sname] FROM [subdivision]"></asp:SqlDataSource><br>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="select"
                ErrorMessage="Please select a subdivition" Font-Bold="True" ForeColor="Black" ControlToValidate="sdivition"></asp:RequiredFieldValidator>
                <br />
           </td>
           <td><asp:Label ID="sdivition_msg" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
        </tr>
        <tr>
           <td><asp:Label ID="Label7" runat="server" Text="Password" Font-Bold="True" ForeColor="Black"></asp:Label></td>
            <td>
                <br />
                <asp:TextBox ID="password" runat="server" Height="30px" Width="160px" TextMode="password" placeholder="Enter Password"></asp:TextBox>
                <br />
                <br />
           </td>
            <td><asp:Label ID="password_msg" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
        </tr>
        <tr>
           <td><asp:Label ID="Label8" runat="server" Text="Confirm Password" Font-Bold="True" ForeColor="Black"></asp:Label></td>
           <td>
               <asp:TextBox ID="cpassword" runat="server" Height="30px" Width="160px" TextMode="password" placeholder="Confirm Password"></asp:TextBox>
               <br />
              <asp:CompareValidator ID="CompareValidator1" runat="server" 
                  ControlToCompare="password" ControlToValidate="cpassword" Font-Bold="True" ForeColor="Black"
                  ErrorMessage="Password Not Match"></asp:CompareValidator>
            </td>
           <td><asp:Label ID="cpassword_msg" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
        </tr>
       
        <tr>
           <td><asp:Label ID="Label15" runat="server" Text="Upload Image" Font-Bold="True" ForeColor="Black"></asp:Label></td>
           <td><asp:FileUpload ID="FileUpload1" runat="server" Height="22px"></asp:FileUpload>
               <br />
        <asp:Label ID="fileupload" runat="server"></asp:Label>
           </td>
        </tr>
        <tr>
            <td colspan="3">
                <br><center><asp:Button ID="Button1" runat="server" Text="Register" Font-Bold="True" ForeColor="Black" height="30px"></asp:Button></center>
            </td>
        </tr>
    </table>
    <br>
</asp:Content>

