<%@ Page Title="" Language="VB" MasterPageFile="~/usrcontrol.master" AutoEventWireup="false" CodeFile="usrview.aspx.vb" Inherits="usrview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" Visible="False">
    <style>
    a
    {
        text-decoration:none;
       
        
    }

</style>
    <br />
<asp:Label ID="sess_id" runat="server" Font-Bold="True" 
        ForeColor="#0BBFFF" Visible="False"></asp:Label>
<asp:Label ID="msg" runat="server" Font-Bold="True" Font-Size="Large" 
        ForeColor="#0BBFFF"></asp:Label>
    <br />
<br>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="task_code" DataSourceID="SqlDataSource1" Width="794px" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        CellPadding="2" ForeColor="Black" GridLines="None">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:TemplateField HeaderText="Update" SortExpression="task_code" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                 <a href="usr_project_detail.aspx?id=<%#Eval("task_code")%>">select </a>
                </ItemTemplate>
            </asp:TemplateField>
           
            <asp:TemplateField HeaderText="Task Code" SortExpression="task_code">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("task_code") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="proj_desc" HeaderText="Project Description" ItemStyle-HorizontalAlign="Center"
                SortExpression="proj_desc" />
            <asp:BoundField DataField="module_desc" HeaderText="Module Description" ItemStyle-HorizontalAlign="Center"
                SortExpression="module_desc" />
            <asp:BoundField DataField="from_date" HeaderText="From Date" ItemStyle-HorizontalAlign="Center"
                SortExpression="from_date" />
            <asp:BoundField DataField="working_status" HeaderText="Working Status" ItemStyle-HorizontalAlign="Center"
                SortExpression="working_status" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:pritamConnectionString %>" 
        SelectCommand="SELECT task.task_code, project.proj_desc, module.module_desc, task.from_date, task.working_status FROM task INNER JOIN project ON task.proj_code = project.proj_code INNER JOIN module ON module.module_code = task.module_code INNER JOIN employee ON task.emp_id = employee.eid where employee.email=@empid">
        <SelectParameters>
                <asp:ControlParameter ControlID="sess_id" Name="empid" PropertyName="Text" Type="String" />
            </SelectParameters>
    </asp:SqlDataSource>
   
</asp:Content>
