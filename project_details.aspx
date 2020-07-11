<%@ Page Title="" Language="VB" MasterPageFile="~/adminentry.master" AutoEventWireup="false" CodeFile="project_details.aspx.vb" Inherits="project_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br/>
 <table class="dinput">
         <td colspan="2">
         <center><h4>Project Details</h4></center>
         </td>
         </tr>
        
         <tr>
         <td colspan="2">
         <center>
         <asp:Image ID="Image1" runat="server" Width="140px" Height="100px" 
                 ImageUrl="~/boot/project.png" ></asp:Image>
          </center>
         </td>
         </tr>
        <tr>
            <td ><asp:Label ID="Label1" runat="server" 
                    Text="Project Category" Font-Bold="True"></asp:Label></td>
            <td>
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Width="160px" Height="30px">
                    <asp:ListItem Value="select">--select--</asp:ListItem>
                    <asp:ListItem>New</asp:ListItem>
                </asp:DropDownList>
                <br />
            </td>
        </tr>
        
        <tr>
           <td><asp:Label ID="Label2" runat="server" 
                   Text="Project Category Description" Font-Bold="True"></asp:Label></td>
            <td>
                <br />
                <asp:TextBox ID="TextBox2" runat="server" Width="160px" Height="30px" 
                    Enabled="False"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
        
         <tr>
            <td colspan="2">
                <center>
                    <asp:Button ID="Button2" runat="server" Text="Submit" Width="52px" 
                        Height="30px"  BackColor="skyblue" ForeColor="Green"></asp:Button>
                    <br />
                    <asp:Label ID="msg" runat="server"></asp:Label>
                    <br />
                </center>
            </td>
        </tr>
    </table>
 <br>
       <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Search" 
           style="margin-left:230px"></asp:Label>
       <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="Search" AutoPostBack="true" style="margin-bottom:10px"></asp:TextBox>
       <br />
 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  
        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" 
OnRowCancelingEdit="GridView1_RowCancelingEdit" DataSourceID="SqlDataSource1" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        CellPadding="2" ForeColor="Black" GridLines="None" Width="420px"
        AllowPaging="True" OnPageIndexChanging="OnPaging" PageSize="2">
     <AlternatingRowStyle BackColor="PaleGoldenrod" />
     <Columns>
          <asp:TemplateField HeaderText="Project Code" SortExpression="proj_code">
                <ItemTemplate>
                    <asp:Label ID="proj_code" runat="server" Text='<%# Bind("proj_code")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Description" 
              SortExpression="proj_desc">
                <EditItemTemplate>
                     <asp:TextBox ID="proj_desc" runat="server" Text='<%# Eval("proj_desc")%>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("proj_desc")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Edit/Delete">
             <EditItemTemplate>
                 <asp:ImageButton ID="ImageButton3" runat="server"  CommandArgument='<%#Eval("proj_code")%>' CommandName="Update" ImageUrl="Images/save.png" Width="20px" Height="20px"></asp:ImageButton>
                 <asp:ImageButton ID="ImageButton4" runat="server"  CommandArgument='<%#Eval("proj_code")%>' CommandName="Cancel" ImageUrl="Images/cancel.png" Width="20px" Height="20px"></asp:ImageButton>
            </EditItemTemplate>
             <ItemTemplate>
                 <asp:ImageButton ID="ImageButton2" runat="server"  CommandArgument='<%#Eval("proj_code")%>' CommandName="Edit" ImageUrl="Images/edit.png" Width="20px" Height="20px"></asp:ImageButton>
                 <asp:ImageButton ID="ImageButton1" runat="server"  CommandArgument='<%#Eval("proj_code")%>' CommandName="DeleteCommand" ImageUrl="Images/delete.png" Width="20px" Height="20px"></asp:ImageButton>
                 
              </ItemTemplate>
          </asp:TemplateField>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:pritamConnectionString %>" 
        SelectCommand="SELECT [proj_code], [proj_desc] FROM [project]"></asp:SqlDataSource>
 

</asp:Content>

