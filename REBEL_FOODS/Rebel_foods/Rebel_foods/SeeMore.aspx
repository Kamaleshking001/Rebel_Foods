<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeeMore.aspx.cs" Inherits="Rebel_foods.SeeMore" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>See More</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
    <link rel="stylesheet" href="index.css">
    <style>
        .highlight-product {
            font-weight: bold; 
            color: #FF5733; 
        }

        .highlight-price {
            background-color: #f2f2f2; 
        }
        .shadow {
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2); 
        }
    </style>
</head>
<body>
    <!-- Navbar Section -->
     <nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
     <div class="container">
         <a class="navbar-brand" href="#">
             <img src="images/Rebel_logo.jfif" class="Rebel-Foods-logo" style="height:70px; width:200px;"/>
         </a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
             <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
             <div class="navbar-nav ml-auto">
                 <a class="nav-link active" id="navItem1" href="#wcuSection">
                     Why Choose Us?
                     <span class="sr-only">(current)</span>
                 </a>
                 <a class="nav-link" href="#exploreMenuSection" id="navItem2">Explore Menu</a>
                 <a class="nav-link" href="#deliveryPaymentSection" id="navItem3">Delivery & Payment</a>
                 <a class="nav-link" href="#followUsSection" id="navItem4">Follow Us</a>
                 

                 <% if (Session["isLoggedIn"] != null) {%>           
                  <a style="height:50px; width:50px;"  href="Buy Cart.aspx"><img src="images1/cart.png"/> <span id="span" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" runat="server">99+</span></a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
  
                      <!-- Your other navigation links -->
                      <a class="nav-item nav-link"  href="Login.aspx">Logout</a><br />
  
                      <asp:Label ID="Label1"  style="font-size:20px; color:slategrey;" runat="server" Text=""></asp:Label>
                  <% } else { %>
                      <a class="nav-item nav-link" href="Login.aspx">Login</a>
                      <a class="nav-item nav-link" href="Register.aspx">Register</a>
                  <% } %>
             </div>
         </div>
     </div>
 </nav>
    <form id="form1" runat="server">
    <!-- Main Content Section -->
    <div class="container mt-5">
        <hr style="width: 10px; color: black;" />
        <div class="row" style="margin-top: 100px;">
            <asp:Repeater ID="ProductRepeater" runat="server" OnItemCommand="ProductRepeater_ItemCommand">
                <HeaderTemplate>
                    <!-- Header Template for Repeater -->
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="col-12 col-md-6 col-lg-3 mb-4">
                        <asp:Label ID="Cat" class="card-title" runat="server" Text='<%# Eval("catagory") %>'></asp:Label>
                        <div class="card shadow">
                            <asp:Image ID="ProductImage" class="card-img-top mx-auto" Style="height: 150px; width: 150px;" runat="server" ImageUrl='<%# "images/" + Eval("proname") + ".png" %>' />
                            <div class="card-body text-center">
                                
                                <asp:Label ID="pron" class="card-title highlight-product" runat="server" Text='<%# Eval("proname") %>'></asp:Label>
                                <br />
                                <h5 class="card-title highlight-price">Price:</h5>
                                <asp:Label ID="price" class="card-text highlight-price" runat="server" Text='<%# Eval("price") %>'></asp:Label><span class="card-text highlight-price" style="font-weight:bold;"> $</span>
                                <br />
                                <h5 class="card-text">Quantity:</h5>
                                <asp:Label ID="qty" class="card-text" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                                <br />
                                <asp:Button ID="Button1" runat="server" Text="Buy Now" CssClass="btn btn-primary mt-3" CommandName="Buy" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    <!-- Footer Template for Repeater -->
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</form>




    <!-- Scripts Section -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>
