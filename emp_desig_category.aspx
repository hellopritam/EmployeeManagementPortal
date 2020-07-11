<%@ Page Title="" Language="VB" MasterPageFile="~/adminentry.master" AutoEventWireup="false" CodeFile="emp_desig_category.aspx.vb" Inherits="emp_desig_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br>
 <table class="dinput">
         <td colspan="2">
         <h4>Designation Category</h4>
         </td>
         </tr>
        
         <tr>
         <td colspan="2">
         <center>
         <asp:Image ID="Image1" runat="server" Width="140px" Height="100px" 
                 ImageUrl="~/boot/designation.png" ></asp:Image>
          </center>
         </td>
         </tr>
        <tr>
            <td >
                <asp:Label ID="Label1" runat="server" 
                    Text="Designation Category" Font-Bold="True"></asp:Label></td>
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
                   Text="Designation Description" Font-Bold="True"></asp:Label></td>
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
 <br/>
       <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Search" 
           style="margin-left:310px"></asp:Label>
       <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="Search" AutoPostBack="true" style="margin-bottom:10px"></asp:TextBox>
       <br />
       <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"  
        OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating" 
        OnRowCancelingEdit="GridView2_RowCancelingEdit" DataSourceID="SqlDataSource2" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        CellPadding="2" ForeColor="Black" GridLines="None" Width="500px"  
        OnPageIndexChanging="OnPaging" PageSize="2" AllowPaging="True">
     <AlternatingRowStyle BackColor="PaleGoldenrod" />
     <Columns>
          <asp:TemplateField HeaderText="EDID" SortExpression="emp_desig_id">
                <ItemTemplate>
                    <asp:Label ID="emp_desig_id" runat="server" Text='<%# Bind("emp_desig_id")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" 
              SortExpression="emp_desig_desc">
                <EditItemTemplate>
                     <asp:TextBox ID="emp_desig_desc" runat="server" Text='<%# Eval("emp_desig_desc")%>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("emp_desig_desc")%>'></asp:Label>
                </ItemTemplate>
              
            </asp:TemplateField>
          
             <asp:TemplateField HeaderText="Status" 
              SortExpression="notifi_desc">
                <EditItemTemplate>
                     <asp:TextBox ID="emp_desig_status" runat="server" Text='<%# Eval("emp_desig_status")%>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("emp_desig_status")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
              <asp:TemplateField HeaderText="Edit/Delete">
             <EditItemTemplate>
                 <asp:ImageButton ID="ImageButton3" runat="server"  CommandArgument='<%#Eval("emp_desig_id")%>' CommandName="Update" ImageUrl="Images/save.png" Width="20px" Height="20px"></asp:ImageButton>
                 <asp:ImageButton ID="ImageButton4" runat="server"  CommandArgument='<%#Eval("emp_desig_id")%>' CommandName="Cancel" ImageUrl="Images/cancel.png" Width="20px" Height="20px"></asp:ImageButton>
            </EditItemTemplate>
             <ItemTemplate>
                 <asp:ImageButton ID="ImageButton2" runat="server"  CommandArgument='<%#Eval("emp_desig_id")%>' CommandName="Edit" ImageUrl="Images/edit.png" Width="20px" Height="20px"></asp:ImageButton>
                 <asp:ImageButton ID="ImageButton1" runat="server"  CommandArgument='<%#Eval("emp_desig_id")%>' CommandName="DeleteCommand" ImageUrl="Images/delete.png" Width="20px" Height="20px"></asp:ImageButton>
                 
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
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:pritamConnectionString %>" 
        SelectCommand="SELECT * FROM [emp_desig]"></asp:SqlDataSource>
</asp:Content>

