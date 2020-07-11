<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frist_webpage.aspx.vb" Inherits="frist_webpage" %>

<!doctype html>
<html lang="en">
  <head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title>Homepage</title>
     <style>
        .style1 {
            background-color: lightgoldenrodyellow;
         }
         .centerHeaderText th
         {
             text-align:center
         }
     </style>
  </head>
   <body style="background-color:pink">
    <form id="form2" runat="server">
      <div class="container">
   <nav class="navbar navbar-expand-lg navbar-light bg-light">




  <asp:Image ID="Image1" runat="server" Width="136px" Height="60px" 
                        ImageUrl="~/boot/companylogo3.jpg" style="margin-left: 0px;margin-right:10px;"></asp:Image><h5> Employee Management Portal</h5>
                

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse float-right" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
       
      </li>
	  </ul>
       </ul>
      <ul class="navbar-nav">
      <li class="nav-item active">
         <a class="nav-link mr-auto" href="admin_login.aspx">Admin Login<span class="sr-only">(current)</span></a>
      </li>
     </ul>
	   <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="EmpLogin.aspx">Login<span class="sr-only">(current)</span></a>
      </li>
	  </ul>
      <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="Empregister.aspx">Signup<span class="sr-only">(current)</span></a>
      </li>
     </ul>
  </div>
</nav>
<div class="style1">
<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="boot/slider1.jpg" class="d-block w-100" alt="..." width="40px" height="400px">
      <div class="carousel-caption d-none d-md-block">
        <h5>Welcome To Our Portal</h5>
      </div>
    </div>
    <div class="carousel-item">
      <img src="boot/slider2.jpg" class="d-block w-100" alt="..." width="40px" height="400px">
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
    <div class="carousel-item">
      <img src="boot/slider3.jpg" class="d-block w-100" alt="..." width="40px" height="400px">
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
 <br>
<h5>Job Notification</h5>

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
          BackColor="White" BorderColor="#DEDFDE" BorderWidth="1px" 
           ForeColor="Black" GridLines="Vertical" Width="100%" BorderStyle="None" 
          >
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="notifi_desc" HeaderText="Category" 
            SortExpression="notifi_desc" />
      
        <asp:BoundField DataField="notifi_category_desc" HeaderText="Notification"
            SortExpression="notifi_category_desc">
        
       
        </asp:BoundField>
        
        <asp:BoundField DataField="notifi_date" HeaderText="Notification Date" 
            SortExpression="notifi_date" >
          
        
        </asp:BoundField>
        <asp:HyperLinkField DataNavigateUrlFields="pdf_location" HeaderText="View" 
            Text="view" >
       
        </asp:HyperLinkField>
    </Columns>
      <FooterStyle BackColor="#CCCC99" />
    <HeaderStyle BackColor="#ff6666" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" 
        HorizontalAlign="Right" />
    <RowStyle BackColor="#F7F7DE" />
    <SelectedRowStyle BackColor="#CE5D5A" ForeColor="White" Font-Bold="True" />
    <SortedAscendingCellStyle BackColor="#FBFBF2" />
    <SortedAscendingHeaderStyle BackColor="#848384" />
    <SortedDescendingCellStyle BackColor="#EAEAD3" />
    <SortedDescendingHeaderStyle BackColor="#575357" />
      </asp:GridView>
 
      <br />
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:pritamConnectionString %>" 
          
          SelectCommand="SELECT [notifi_desc],  [notifi_date],[notification_category].[notifi_category_desc],[pdf_location] FROM [notification],[notification_category] where [notifi_status]='ENABLE' and [notification].notifi_category_id=[notification_category].notifi_category_id"></asp:SqlDataSource>
<div class="row">
<div class="card mx-auto" style="width: 18rem;">
  <img src="boot/card1.jpg" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Improve Workforse Management Efficiencies</h5>
    <a href="#" class="btn btn-primary">Learn More</a>
  </div>
</div>
<div class="card mx-auto" style="width: 18rem;">
  <img src="boot/card2.jpg" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">High Volume Production Management</h5>
    <a href="#" class="btn btn-primary">Learn More</a>
  </div>
</div>
<div class="card mx-auto" style="width: 18rem;">
  <img src="boot/card5.jpg" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Ensure Timely Completion Of a Project</h5>

    <a href="#" class="btn btn-primary">Learn More</a>
  </div>
</div>
</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </form>
  </body>
</html>