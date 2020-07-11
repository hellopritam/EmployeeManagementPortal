<%@ Page Title="" Language="VB" MasterPageFile="~/usrcontrol.master" AutoEventWireup="false" CodeFile="usr_project_detail.aspx.vb" Inherits="usr_project_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br/>
<table style="background-color:lightgoldenrodyellow">
     <tr>
       <td colspan="2"><center><h2>Task Description</h2></center><br/></td>
     </tr>
         
       <tr>
           <td><asp:Label ID="Label10" runat="server" Text="Task Code" Font-Bold="True" 
                   ForeColor="Black"></asp:Label>
            <br/><asp:TextBox ID="task_code" runat="server" Height="30px" Width="160px" 
                   ReadOnly="True"></asp:TextBox>
            <br /><br/>
           </td>
           <td><asp:Label ID="Label1" runat="server" Text="Project Name" Font-Bold="True" 
                   ForeColor="Black"></asp:Label>
            <br/><asp:TextBox ID="proj_name" runat="server" Height="30px" Width="160px" 
                   ReadOnly="True"></asp:TextBox>
            <br /><br/>
           </td>
        </tr>
        <tr>
        <td colspan="2"><asp:Label ID="Label2" runat="server" Text="Module Name" Font-Bold="True" 
                   ForeColor="Black"></asp:Label>
            <br/><asp:TextBox ID="module_name" runat="server" Height="30px" Width="330px" 
                ReadOnly="True" ></asp:TextBox>
            <br /><br/>
           </td>
        
        </tr>
        <tr>
        <td colspan="2"><asp:Label ID="Label3" runat="server" Text="Task Description" Font-Bold="True" 
                   ForeColor="Black"></asp:Label>
            <br/><asp:TextBox ID="task_desc" runat="server" Height="30px" Width="330px" 
                ReadOnly="True"></asp:TextBox>
            <br /><br/>
           </td>
        </tr>
        <tr>
           <td><asp:Label ID="Label4" runat="server" Text="From Date" Font-Bold="True" 
                   ForeColor="Black"></asp:Label>
            <br/><asp:TextBox ID="From_date" runat="server" Height="30px" Width="160px" 
                    ReadOnly="True"></asp:TextBox>
            <br /><br/>
           </td>
           <td><asp:Label ID="Label5" runat="server" Text="To Date" Font-Bold="True" 
                   ForeColor="Black"></asp:Label>
            <br/><asp:TextBox ID="to_date" runat="server" Height="30px" Width="160px" 
                   TextMode="Date"></asp:TextBox>
            <br /><br/>
           </td>
        </tr>
       <tr>
           <td><asp:Label ID="Label6" runat="server" Text="Working Status" Font-Bold="True" 
                   ForeColor="Black"></asp:Label>
            <br/><asp:TextBox ID="Status" runat="server" Height="30px" Width="160px" ></asp:TextBox>
            <br /><br/>
           </td>
            <td><asp:Label ID="Label7" runat="server" Text="" Font-Bold="True" 
                   ForeColor="Black"></asp:Label>
            <br/><asp:ImageButton ID="pdf" runat="server" ImageUrl="~/boot/pdf_download.png" Height="60px" Width="200px"></asp:ImageButton></asp:TextBox>
            <br /><br/>
           </td>
           
        </tr>
         <tr>
          <td colspan="2">
            <center><asp:Button ID="Button1" runat="server" Text="Update" Height="30px" Width="80px" BackColor=#00BFFF ForeColor="white" Style="margin-right:20px "></asp:Button><asp:Button ID="Button2" runat="server" Text="Close" Height="30px" Width="80px" BackColor=red ForeColor="white"></asp:Button></center>
           </td>
        </tr>
        <br/>
    
    
</table>
</asp:Content>

