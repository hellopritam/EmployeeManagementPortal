<%@ Page Title="" Language="VB" MasterPageFile="~/adminentry.master" AutoEventWireup="false" CodeFile="subdivitionentry.aspx.vb" Inherits="subdivitionentry" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br/>
  <table class="dinput">
          <tr>
         <td colspan="2">
         <h4>Subdivition Details</h4>
         </td>
         </tr>
         <tr>
         <td colspan="2">
         <center>
         <asp:Image ID="Image1" runat="server" Width="150px" Height="100px" 
                 ImageUrl="~/boot/subdivition.png" ></asp:Image>
          </center><br>
         </td>
         </tr>
         <tr>
                <td >
                    <asp:Label ID="Label3" runat="server" Text="District Nmae" Font-Bold="True"></asp:Label>
                </td>
                <td >
                    <asp:DropDownList ID="DropDownList2" runat="server" Height="30px" Width="160px"  DataSourceID="SqlDataSource1" AutoPostBack="True" DataTextField="name" DataValueField="code" AppendDataBoundItems="true">
                        <asp:ListItem Value="select">--select--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pritamConnectionString %>" SelectCommand="SELECT DISTINCT [name],[code] FROM [district4]"></asp:SqlDataSource>
                </td>
            </tr>
            
        <tr>
            <td >
                <asp:Label ID="Label1" runat="server" 
                    Text="Subdivition Name" Font-Bold="True"></asp:Label></td>
            <td>
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Width="160px" Height="30px"  Enabled="False">
                    <asp:ListItem Value="select">--select--</asp:ListItem>
                    <asp:ListItem>New</asp:ListItem>
                </asp:DropDownList>
                <br />
            </td>
        </tr>
        
        <tr>
           <td><asp:Label ID="Label2" runat="server" 
                   Text="Subdivition Details" Font-Bold="True"></asp:Label></td>
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
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  
        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" 
OnRowCancelingEdit="GridView1_RowCancelingEdit" DataSourceID="SqlDataSource2" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        CellPadding="2" ForeColor="Black" GridLines="None" Width="500px" AllowPaging="True"  OnPageIndexChanging="OnPaging" PageSize="2">
     <AlternatingRowStyle BackColor="PaleGoldenrod" />
     <Columns>
          <asp:TemplateField HeaderText="Subdivition ID" SortExpression="scode">
                <ItemTemplate>
                    <asp:Label ID="scode" runat="server" Text='<%# Bind("scode")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
          <asp:TemplateField HeaderText="District Name" SortExpression="name">
                <ItemTemplate>
                    <asp:Label ID="name" runat="server" Text='<%# Bind("name")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Subdivition Name" 
              SortExpression="sname">
                <EditItemTemplate>
                     <asp:TextBox ID="sname" runat="server" Text='<%# Eval("sname")%>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("sname")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="Edit/Delete">
             <EditItemTemplate>
                 <asp:ImageButton ID="ImageButton3" runat="server"  CommandArgument='<%#Eval("scode")%>' CommandName="Update" ImageUrl="Images/save.png" Width="20px" Height="20px"></asp:ImageButton>
                 <asp:ImageButton ID="ImageButton4" runat="server"  CommandArgument='<%#Eval("scode")%>' CommandName="Cancel" ImageUrl="Images/cancel.png" Width="20px" Height="20px"></asp:ImageButton>
            </EditItemTemplate>
             <ItemTemplate>
                 <asp:ImageButton ID="ImageButton2" runat="server"  CommandArgument='<%#Eval("scode")%>' CommandName="Edit" ImageUrl="Images/edit.png" Width="20px" Height="20px"></asp:ImageButton>
                 <asp:ImageButton ID="ImageButton1" runat="server"  CommandArgument='<%#Eval("scode")%>' CommandName="DeleteCommand" ImageUrl="Images/delete.png" Width="20px" Height="20px"></asp:ImageButton>
                 
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
        
        
        SelectCommand="SELECT subdivision.scode, subdivision.sname, district4.name FROM subdivision INNER JOIN district4 ON subdivision.code = district4.code" >
    </asp:SqlDataSource>

  </asp:Content>

