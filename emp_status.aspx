<%@ Page Title="" Language="VB" MasterPageFile="~/adminentry.master" AutoEventWireup="false" CodeFile="emp_status.aspx.vb" Inherits="Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
    .modalBackground
    {
        background-color: green;
        filter: alpha(opacity=40);
        opacity: 0.4;
    }
        A
        {
            text-decoration:none;
        }
    </style>
<br>
<table width="600px" style="background-color:lightgoldenrodyellow;">
<tr>
<td>
    <asp:Label ID="Label9" runat="server" Text="Show" Font-Bold="True" Style="margin-right:350px;"></asp:Label>
 </td>
 <td>
        <asp:RadioButtonList ID="emp_status" runat="server" 
        RepeatDirection="Horizontal" AutoPostBack="True">
        <asp:ListItem Text="PENDING" Selected="True" />
        <asp:ListItem Text="Approved" />
        </asp:RadioButtonList>
</td>
</tr>
</table>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br/>
       <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Search" 
           style="margin-left:400px"></asp:Label>
       <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="Search" AutoPostBack="true" style="margin-bottom:10px"></asp:TextBox>
       <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="email" DataSourceID="SqlDataSource1" Width="600px" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        CellPadding="2" ForeColor="Black" GridLines="None"  
        OnPageIndexChanging="OnPaging" PageSize="2" AllowPaging="True">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:BoundField DataField="eid" HeaderText="Eid" SortExpression="eid" />
            <asp:BoundField DataField="ename" HeaderText="Name" SortExpression="ename" />
            <asp:BoundField DataField="mobile_no" HeaderText="Mobile No" 
                SortExpression="mobile_no" />
            <asp:BoundField DataField="email" HeaderText="Email" ReadOnly="True" 
                SortExpression="email" />
            <asp:BoundField DataField="status" HeaderText="Status" 
                SortExpression="status" />
            <asp:CommandField HeaderText="" ShowSelectButton="True" 
                SelectText="Click"  />
        </Columns>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
     <asp:Label ID="Label5" runat="server" Style="margin-left:0px"></asp:Label><br/><br/>
    <asp:LinkButton ID="LinkButton1" runat="server" ></asp:LinkButton>
    <asp:Panel ID="Panel1" runat="server" Width="280px" Height="163px"  Style="display: none">
        <table style="Width:280px;Height:180px; background-color:hotpink">
           <tr style="Height:30px;">
            <td colspan="2"><br/><asp:Label ID="Label14" runat="server" 
                    Text="Choose Designation " width="230px" Height="7px" Font-Bold="True" style="margin-left:0px;"></asp:Label><br/><br/></td>
           </tr>
           <tr style="height:2px; background-color:white;">
           <td colspan="2"></td>
           </tr>
           <tr>
           <td ><asp:Label ID="Label11" runat="server" Text="Employee Name "  Font-Bold="true"></asp:Label>
               <br /><br/>
               </td>
           <td ><asp:Label ID="ename" runat="server" Text=""></asp:Label>
               <br /><br/>
           </td>
           </tr>
           <tr>
           <td><br><asp:Label ID="Label13" runat="server" Text="Employee Designation " Font-Bold="true"></asp:Label>
           <br />
               
           </td>
           <td><asp:DropDownList ID="DropDownList1" runat="server" width="90px" Height="20px" style="margin-left:7px;"
            DataSourceID="SqlDataSource2" DataTextField="emp_desig_desc" 
            DataValueField="emp_desig_id" AppendDataBoundItems="true">
               <asp:ListItem Value="select">--select--</asp:ListItem>
             </asp:DropDownList>
           </td>
           </tr>
           <tr style="height:2px;background-color:white;">
           <td colspan="2"></td>
           </tr>
           <tr>
           <td colspan="2" style="Height:30px;">
            <asp:Button ID="Button3" runat="server" Text="Submit" 
            ForeColor="White" BackColor="Green" style="margin-left:85px;"/>
            <asp:Button ID="Button4" runat="server" Text="Close" BackColor="Red" style="margin-left:25px;"
            ForeColor="White" />
           </td>
           </tr>
           <tr>
           <td colspan="2"><asp:Label ID="eid" runat="server" Text="" Font-Bold="true" visible="false"></asp:Label></td>
           </tr>
         </table>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server"
            ConnectionString="<%$ ConnectionStrings:pritamConnectionString %>" 
            SelectCommand="SELECT [emp_desig_id], [emp_desig_desc] FROM [emp_desig]">
        </asp:SqlDataSource>
     </asp:Panel>
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="LinkButton1" PopupControlID="Panel1" CancelControlID="Button2" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:pritamConnectionString %>" 
        
        SelectCommand="SELECT [eid], [ename], [mobile_no], [email], [status] FROM [employee] WHERE ([status] = @status)">
        <SelectParameters>
            <asp:ControlParameter ControlID="emp_status" Name="status" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

