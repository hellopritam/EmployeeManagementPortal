<%@ Page Title="" Language="VB" MasterPageFile="~/adminentry.master" AutoEventWireup="false" CodeFile="recordsearch.aspx.vb" Inherits="recordsearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script>
         function printpage() {

             var getpanel = document.getElementById("<%= Panel1.ClientID%>");
      var MainWindow = window.open('', '', 'height=500,width=800');
      MainWindow.document.write('<html><head><title>Employee Records</title>');
      MainWindow.document.write('</head><body>');
      MainWindow.document.write(getpanel.innerHTML);
      MainWindow.document.write('</body></html>');
      MainWindow.document.close();
      setTimeout(function () {
          MainWindow.print();
      }, 500);
      return false;
  }
 </script>

    <h3 style="background-color:lightgoldenrodyellow;">Employee Details</h3>
    <center>
    <div>
        <br/>
        <asp:Label ID="Label12" runat="server" Text="Search" Font-Bold="True" 
            BackColor="Green" ForeColor="White" Height="17px" Width="50px"></asp:Label>
         &nbsp;&nbsp;&nbsp;
         <asp:Label ID="Label10" runat="server" Text="District " Font-Bold="True"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" style="margin-right: 20px" Height="27px" Width="150px" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name" AppendDataBoundItems="true">
            <asp:ListItem Value="select">--select--</asp:ListItem>
        </asp:DropDownList>
         <asp:Label ID="Label11" runat="server" Text="Sub-Divition " Font-Bold="True"></asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" Height="27px" Width="150px" DataSourceID="SqlDataSource3" DataTextField="sname" DataValueField="sname" AppendDataBoundItems="true">
            <asp:ListItem Value="select">--select--</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <table style="background-color:lightgoldenrodyellow;">
        <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="Name " Font-Bold="True"></asp:Label><br>
            <asp:TextBox ID="ename" runat="server" Height="27px" Width="150px"
               ></asp:TextBox>
        </td>
        <td>
        <asp:Label ID="Label2" runat="server" Text="Mobile No" Font-Bold="True"></asp:Label><br>
        <asp:TextBox ID="mobile_no" runat="server" Height="27px" Width="150px"></asp:TextBox>
        </td>
        <td>
        <asp:Label ID="Label3" runat="server" Text="Email" Font-Bold="True"></asp:Label><br>
        <asp:TextBox ID="email" runat="server" Height="27px" Width="150px"></asp:TextBox>
        </td>
          <td>
         <asp:Label ID="Label9" runat="server" Text="Gender" Font-Bold="True"></asp:Label><br>
         <asp:RadioButtonList ID="gender" runat="server" Height="27px" Width="150px" RepeatDirection="Horizontal">
            <asp:ListItem Text="male" Selected="True" />
            <asp:ListItem Text="female"/>
            <asp:ListItem Text="others"/>
          </asp:RadioButtonList>
          </td>
        </tr>
        <tr>
        <td colspan="3">
        <asp:Label ID="Label4" runat="server" Text="Full Address" Font-Bold="True"></asp:Label><br>
        <asp:TextBox ID="faddress" runat="server"  Width="527px" style="margin-right:30px"
                Height="27px"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label5" runat="server" Text="DOB(YYYY-DD-MM)" Font-Bold="True"></asp:Label><br>
            <asp:TextBox ID="dob" runat="server" Height="27px" Width="150px" ></asp:TextBox>
        </td>
        </tr>
        <tr>
        <td>
            
            <asp:Label ID="Label6" runat="server" Text="District" Font-Bold="True"></asp:Label><br>
            <asp:DropDownList ID="district" runat="server" 
            DataSourceID="SqlDataSource4" DataTextField="name" DataValueField="name" Height="27px" Width="150px" AppendDataBoundItems="true" >
            <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:pritamConnectionString %>" 
            SelectCommand="SELECT [name] FROM [district4]"></asp:SqlDataSource>
        </td>
        <td>
           <asp:Label ID="Label7" runat="server" Text="Sdivition" Font-Bold="True"></asp:Label><br>
           <asp:DropDownList ID="sdivition" runat="server" 
            DataSourceID="SqlDataSource5" DataTextField="sname" DataValueField="sname" Height="27px" Width="150px" AppendDataBoundItems="true" >
            <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:pritamConnectionString %>" 
            SelectCommand="SELECT [sname] FROM [subdivision]"></asp:SqlDataSource>
        </td>
        <td>
         <asp:Label ID="Label8" runat="server" Text="Language" Font-Bold="True"></asp:Label><br>
         <asp:TextBox ID="language" runat="server" Height="27px" Width="150px"></asp:TextBox>
        </td>
        <td>
          <asp:Label ID="Label18" runat="server" Text="Password" Font-Bold="True"></asp:Label><br>
          <asp:TextBox ID="password" runat="server" Height="27px" Width="150px"></asp:TextBox>
        </td>
        </tr>
        <tr>
          <td colspan="3">
          <br>
          <asp:TextBox ID="eid" runat="server" Visible="false" Width="2px"></asp:TextBox>
          <center><asp:Button ID="Button2" runat="server" Text="Update" BackColor="green" ForeColor="white"></asp:Button></center>
         </td>
         <td>
            <br />
            <br>
            <asp:Button ID="Button1" runat="server" Text="Delete" BackColor="red" 
                ForeColor="white"></asp:Button>
        </td>
        </tr>
        </table>
          <br>
       <asp:Label ID="Label13" runat="server" Font-Bold="True" Text="Search" 
           style="margin-left:800px"></asp:Label>
       <asp:TextBox ID="TextBox3" runat="server"  AutoPostBack="true" style="margin-bottom:10px" OnTextChanged="Search"></asp:TextBox>
       <br />
            <asp:Panel ID="Panel1" runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="eid" DataSourceID="SqlDataSource2" Width="980px" 
            ForeColor="Black" GridLines="Vertical" 
            style="margin-right: 0px" BackColor="White" 
            BorderColor="#DEDFDE" BorderWidth="1px" BorderStyle="None" CellPadding="0" 
            AllowPaging="True" OnPageIndexChanging="OnPaging" PageSize="2">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                 <asp:BoundField DataField="ename" HeaderText="Name" SortExpression="ename" />
                <asp:BoundField DataField="mobile_no" HeaderText="Mobile No." SortExpression="mobile_no" />
                <asp:BoundField DataField="email" HeaderText="Email" 
                    SortExpression="email" />
                <asp:BoundField DataField="faddress" HeaderText="Faddress" 
                    SortExpression="faddress" />
                <asp:BoundField DataField="dob" HeaderText="DOB" SortExpression="dob" />
                <asp:BoundField DataField="district" HeaderText="Distruct" SortExpression="district" />
                <asp:BoundField DataField="sdivition" HeaderText="Sdivition" 
                    SortExpression="sdivition" />
                <asp:BoundField DataField="language" HeaderText="Language" SortExpression="language" />
                <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                <asp:BoundField DataField="password" HeaderText="Password" 
                    SortExpression="password" />
                <asp:BoundField DataField="status" HeaderText="Status" ReadOnly="True" 
                    SortExpression="status" />
                <asp:BoundField DataField="designation_id" HeaderText="Designation_id" 
                    SortExpression="designation_id" />
                <asp:BoundField DataField="eid" HeaderText="Eid" SortExpression="eid"  />
                    <asp:TemplateField HeaderText="Picture" >
                    <ItemTemplate>
                        <asp:Image ID="iamge1" runat="server" style="margin-bottom: 3px" Width="100px" Height="100px" ImageUrl='<%# "data:Image;base64,"&Convert.ToBase64String(Eval("pic"))%>'/>
                    </ItemTemplate>
               </asp:TemplateField>
               <asp:CommandField ShowSelectButton="True" />
              </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" 
                HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" ForeColor="White" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
           </asp:Panel>
     
        <asp:Label ID="Label14" runat="server" Style="margin-left:0px"></asp:Label><br/><br/>
        <asp:Button ID="Button3" runat="server" OnClientClick="return printpage();"  Text="Print" BackColor="green" ForeColor="white"/><br/>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcs %>" SelectCommand="SELECT DISTINCT [name] FROM [district4]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:pritamConnectionString %>" 
            SelectCommand="SELECT * FROM [employee] WHERE (([district] = @name) AND ([sdivition] = @sname))">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="name" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DropDownList2" Name="sname" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:pritamConnectionString %>" 
            SelectCommand="SELECT [sname] FROM [subdivision]"></asp:SqlDataSource>
        <br />
    </div>
</center>
</asp:Content>

