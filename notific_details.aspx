<%@ Page Title="" Language="VB" MasterPageFile="~/adminentry.master" AutoEventWireup="false" CodeFile="notific_details.aspx.vb" Inherits="notific_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br/>          
<table class="dinput">
         <tr>
         <td colspan="2">
         <center>
         <h4>Notification Details</h4>
         </center>
         </td>
         </tr>
        
         <tr>
         <td colspan="2">
         <center>
         <asp:Image ID="Image1" runat="server" Width="140px" Height="100px" 
                 ImageUrl="~/boot/notification.png" ></asp:Image>
          </center>
         </td>
         </tr>
        <tr>
            <td ><asp:Label ID="Label1" runat="server" 
                    Text="Notification Category" Font-Bold="True"></asp:Label></td>
            <td>
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    Width="160px" Height="30px" DataSourceID="SqlDataSource1" 
                    DataTextField="notifi_category_desc" DataValueField="notifi_category_id" AppendDataBoundItems="true">
                    <asp:ListItem Value="select">--select--</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:pritamConnectionString %>" 
                    
                    SelectCommand="SELECT [notifi_category_id], [notifi_category_desc] FROM [notification_category]">
                </asp:SqlDataSource>
                <br />
            </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label4" runat="server" 
                    Text="Notification Code" Font-Bold="True"></asp:Label></td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" Width="160px" height="30px" AppendDataBoundItems="true" Enabled="False">
                    <asp:ListItem Value="select">--select--</asp:ListItem>
                    <asp:ListItem>New</asp:ListItem>
                </asp:DropDownList>
                <br />
            </td>
        </tr>
        <tr>
           <td><asp:Label ID="Label2" runat="server" 
                   Text="Notification Category Description" Font-Bold="True"></asp:Label></td>
            <td>
                <br />
                <asp:TextBox ID="TextBox2" runat="server" Width="160px" Height="30px" Enabled="False"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
        <tr>
           <td>
               <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Select File"></asp:Label>
           </td>
           <td>
               <asp:FileUpload ID="FileUpload1" runat="server"  Width="160px" Height="30px" /></td>
        </tr>
        <tr>
        <td colspan="2">
        </td>
        </tr>
         <tr>
            <td colspan="2">
                <center>
                    <asp:Button ID="Button2" runat="server" Text="Submit" Width="52px" 
                        Height="30px"  BackColor="skyblue" ForeColor="Green"></asp:Button>
                    <br />
                    <br />
                    <asp:Label ID="msg" runat="server" Text=""></asp:Label>
                </center>
            </td>
        </tr>
    </table>
  <br/>
       <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Search" 
           style="margin-left:400px"></asp:Label>
       <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="Search" AutoPostBack="true" style="margin-bottom:10px"></asp:TextBox>
       <br />
 <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"  
        OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating" 
OnRowCancelingEdit="GridView2_RowCancelingEdit" DataSourceID="SqlDataSource2" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        CellPadding="2" ForeColor="Black" GridLines="None" Width="580px"
        OnPageIndexChanging="OnPaging" PageSize="2" AllowPaging="True">
     <AlternatingRowStyle BackColor="PaleGoldenrod" />
     <Columns>
           <asp:TemplateField HeaderText="NID" SortExpression="notifi_id" >
                <ItemTemplate>
                    <asp:Label ID="notifi_id" runat="server" Text='<%# Bind("notifi_id")%>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
          <asp:TemplateField HeaderText="NCID" SortExpression="notifi_category_id">
                <ItemTemplate>
                    <asp:Label ID="notifi_category_id" runat="server" Text='<%# Bind("notifi_category_id")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NDate" 
              SortExpression="notifi_date">
                <EditItemTemplate>
                     <asp:TextBox ID="notifi_date" runat="server" Text='<%# Eval("notifi_date")%>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("notifi_date")%>'></asp:Label>
                </ItemTemplate>
              
            </asp:TemplateField>
          
             <asp:TemplateField HeaderText="Description" 
              SortExpression="notifi_desc">
                <EditItemTemplate>
                     <asp:TextBox ID="notifi_desc" runat="server" Text='<%# Eval("notifi_desc")%>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("notifi_desc")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="Status" 
              SortExpression="notifi_status">
                <EditItemTemplate>
                     <asp:TextBox ID="notifi_status" runat="server" Text='<%# Eval("notifi_status")%>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("notifi_status")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
              <asp:TemplateField HeaderText="Edit/Delete">
             <EditItemTemplate>
                 <asp:ImageButton ID="ImageButton3" runat="server"  CommandArgument='<%#Eval("notifi_id")%>' CommandName="Update" ImageUrl="Images/save.png" Width="20px" Height="20px"></asp:ImageButton>
                 <asp:ImageButton ID="ImageButton4" runat="server"  CommandArgument='<%#Eval("notifi_id")%>' CommandName="Cancel" ImageUrl="Images/cancel.png" Width="20px" Height="20px"></asp:ImageButton>
            </EditItemTemplate>
             <ItemTemplate>
                 <asp:ImageButton ID="ImageButton2" runat="server"  CommandArgument='<%#Eval("notifi_id")%>' CommandName="Edit" ImageUrl="Images/edit.png" Width="20px" Height="20px"></asp:ImageButton>
                 <asp:ImageButton ID="ImageButton1" runat="server"  CommandArgument='<%#Eval("notifi_id")%>' CommandName="DeleteCommand" ImageUrl="Images/delete.png" Width="20px" Height="20px"></asp:ImageButton>
                 
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
      <asp:Label ID="Label3" runat="server" Style="margin-left:0px"></asp:Label><br/><br/>
 <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:pritamConnectionString %>" 
        SelectCommand="SELECT [notifi_id], [notifi_category_id], [notifi_date], [notifi_desc], [notifi_status] FROM [notification]">
    </asp:SqlDataSource>
 </asp:Content>

