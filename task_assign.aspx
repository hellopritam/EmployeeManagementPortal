<%@ Page Title="" Language="VB" MasterPageFile="~/adminentry.master" AutoEventWireup="false" CodeFile="task_assign.aspx.vb" Inherits="task_assign" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
    #ex1 {
  border-radius: 5px 5px 5px 5px;
  background:lightgoldenrodyellow ;
  padding: 20px;
  width: 300px;
  height: 150px;
}
.modalBackground
    {
        background-color: green;
        filter: alpha(opacity=40);
        opacity: 0.4;
    }
</style>
    <br>
    <table id="ex1">
     <tr>
       <td><center><h4>Provide Task</h4></center></td>
     </tr>
         <tr>
           <td><asp:Label ID="Label9" runat="server" Text="Employee Designation" 
                   Font-Bold="True" ForeColor="Black"></asp:Label>
            <br />
               <asp:DropDownList ID="emp_desig" runat="server" onselectedindexchanged="emp_desig_SelectedIndexChanged"
                   Width="160px" Height="30px"
                    AppendDataBoundItems="True" AutoPostBack="True">
                </asp:DropDownList>
               <br /><br/>
            </td>
        </tr>
       <tr>
           <td><asp:Label ID="Label10" runat="server" Text="Employee Name" Font-Bold="True" 
                   ForeColor="Black"></asp:Label>
            <br/><asp:DropDownList ID="emp_name" runat="server" 
                  AppendDataBoundItems="True" Height="30px" Width="160px">
               </asp:DropDownList>
            <br /><br/>
           </td>
        </tr>
         <tr>
           <td><asp:Label ID="Label15" runat="server" Text="Project Name" Font-Bold="True" ForeColor="Black"></asp:Label>
           <br />
           <asp:DropDownList ID="proj_name" runat="server" 
                   DataSourceID="SqlDataSource3" DataTextField="proj_desc" 
                   DataValueField="proj_code" AppendDataBoundItems="true" Height="30px" Width="160px" >
               <asp:ListItem Value="select">--select project--</asp:ListItem>
               </asp:DropDownList><br /><br/>
               <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                   ConnectionString="<%$ ConnectionStrings:pritamConnectionString %>" 
                   SelectCommand="SELECT [proj_desc], [proj_code] FROM [project]"></asp:SqlDataSource>
             </td>
        </tr>
        <tr>
           <td><asp:Label ID="Label1" runat="server" Text="Module Name" Font-Bold="True" 
                   ForeColor="Black"></asp:Label>
               <br />
           <asp:DropDownList ID="module_name" runat="server" 
                   DataSourceID="SqlDataSource4" DataTextField="module_desc" 
                   DataValueField="module_code" AppendDataBoundItems="true" 
                   AutoPostBack="True" Height="30px" Width="160px">
               <asp:ListItem Value="select">--select module--</asp:ListItem>
               </asp:DropDownList> <br />
               <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                   ConnectionString="<%$ ConnectionStrings:pritamConnectionString %>" 
                   SelectCommand="SELECT [module_desc], [module_code] FROM [module]"></asp:SqlDataSource>
               <asp:Button ID="add_module" runat="server" Text="Add new module" ></asp:Button>
               <br /><br/>
             </td>
        </tr>
        <tr>
           <td><asp:Label ID="Label7" runat="server" Text="Effected From" Font-Bold="True" 
                   ForeColor="Black"></asp:Label>
                <br />
                <asp:TextBox ID="eff_date" runat="server" Height="30px" Width="160px" 
                    TextMode="Date"></asp:TextBox>
                <br />
                <br />
           </td>
        </tr>
        <tr>
           <td><asp:Label ID="Label8" runat="server" Text="Task Description" Font-Bold="True" 
                   ForeColor="Black"></asp:Label><br />
               <asp:TextBox ID="task_desc" runat="server" Height="40px" Width="160px" TextMode="MultiLine"></asp:TextBox>
               <br /><br/>
              
            </td>
        </tr>
        <tr>
           <td>
               <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Task Document"></asp:Label><br/>
               <asp:FileUpload ID="FileUpload1" runat="server" Height="30px" Width="160px"/></td>
        </tr>
       <tr>
            <td colspan="3">
                <br>
                <asp:Label ID="msg" runat="server" Font-Bold="True" 
                   ForeColor="Black"></asp:Label><center><asp:Button ID="Button1" runat="server" Text="Submit" BackColor=#00BFFF Font-Bold="True" ForeColor="white"></asp:Button><asp:Button ID="cancel" runat="server" Text="Cancel" Font-Bold="True" BackColor="Red" ForeColor="white"></asp:Button></center>
            </td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="task_code" DataSourceID="SqlDataSource1" BackColor="White" 
        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        ForeColor="Black" GridLines="Vertical" Width="898px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="emp_id" HeaderText="EID" 
                SortExpression="emp_id" />
             <asp:BoundField DataField="ename" HeaderText="Name" 
                SortExpression="ename" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="task_code" HeaderText="Task Code" ReadOnly="True" 
                SortExpression="task_code" />
            <asp:BoundField DataField="task_desc" HeaderText="Task Description" 
                SortExpression="task_desc" />
            <asp:BoundField DataField="emp_desig_desc" HeaderText="Designation Description" 
                SortExpression="emp_desig_desc" />
            <asp:BoundField DataField="proj_desc" HeaderText="Project Description" 
                SortExpression="proj_desc" />
            <asp:BoundField DataField="module_desc" HeaderText="Module Description" 
                SortExpression="module_desc" />
             <asp:BoundField DataField="from_date" HeaderText="Assign Date" 
                SortExpression="from_date" />
             <asp:BoundField DataField="to_date" HeaderText="Updation Date" 
                SortExpression="to_date" />
                 <asp:BoundField DataField="working_status" HeaderText="Working Status" 
                SortExpression="working_status" />

        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:pritamConnectionString %>" 
        
        SelectCommand="SELECT task.emp_id,task.from_date,task.to_date,task.working_status,employee.ename, employee.email, task.task_code, task.task_desc, emp_desig.emp_desig_desc, project.proj_desc, task.proj_code, module.module_desc FROM task INNER JOIN employee ON task.emp_id = employee.eid INNER JOIN emp_desig ON task.emp_id = emp_desig.emp_desig_id INNER JOIN project ON task.proj_code = project.proj_code INNER JOIN module ON module.module_code = task.module_code">
    </asp:SqlDataSource>
    <br>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Panel ID="Panel1" runat="server" Width="280px" Height="163px" style="display:none;">
        <table style="Width:280px;Height:180px; background-color:hotpink">
           <tr style="Height:30px;">
            <td colspan="2"><br/><asp:Label ID="Label14" runat="server" 
                    Text="Module Entry" width="230px" Height="7px" Font-Bold="True" style="margin-left:0px;"></asp:Label><br/><br/></td>
           </tr>
           <tr style="height:2px; background-color:white;">
           <td colspan="2"></td>
           </tr>
           <tr>
           <td><br><asp:Label ID="Label13" runat="server" Text="module description" Font-Bold="true"></asp:Label>
           <br />
               
           </td>
           <td>
             <asp:TextBox ID="TextBox1" runat="server" width="190px" Height="50px" 
                   style="margin-left:7px;" TextMode="MultiLine"></asp:TextBox>
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
     </asp:Panel>
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="add_module" PopupControlID="Panel1" CancelControlID="Button2" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
    </asp:Content>

