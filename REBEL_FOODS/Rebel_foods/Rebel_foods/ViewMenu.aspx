<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewMenu.aspx.cs" Inherits="Rebel_foods.ViewMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ViewMenu</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/20c5629a29.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="index.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" >
<meta name="kamalesh" content="none,noarchive"/>
</head>
<body>
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
    <div class="explore-menu-section pt-5 pb-5" id="exploreMenuSection">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1 class="menu-section-heading">Explore Menu</h1>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <div class="shadow menu-item-card p-3 mb-3">
                    <img src="https://d1tgh8fmlzexmh.cloudfront.net/ccbp-responsive-website/em-ginger-fried-img.png" class="menu-item-image w-100" />
                    <h1 class="menu-card-title">Non-Veg Starters</h1>
                    <a  href="SeeMore.aspx" class="menu-item-link">
                        View All
                        <svg width="16px" height="16px" viewBox="0 0 16 16" class="bi bi-arrow-right-short" fill="#d0b200" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z" />
                        </svg>
                    </a>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <div class="shadow menu-item-card p-3 mb-3">
                    <img src="https://d1tgh8fmlzexmh.cloudfront.net/ccbp-responsive-website/em-veg-starters-img.png" class="menu-item-image w-100" />
                    <h1 class="menu-card-title">Veg Starters</h1>
                    <a href="SeeMore.aspx" class="menu-item-link">
                        View All
                        <svg width="16px" height="16px" viewBox="0 0 16 16" class="bi bi-arrow-right" fill="#d0b200" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z" />
                        </svg>
                    </a>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <div class="menu-item-card shadow p-3 mb-3">
                    <img src="https://d1tgh8fmlzexmh.cloudfront.net/ccbp-responsive-website/em-soup-img.png" class="menu-item-image w-100" />
                    <h1 class="menu-card-title">Soups</h1>
                    <a href="SeeMore.aspx" class="menu-item-link">
                        View All
                        <svg width="16px" height="16px" viewBox="0 0 16 16" class="bi bi-arrow-right" fill="#d0b200" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z" />
                        </svg>
                    </a>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <div class="menu-item-card shadow p-3 mb-3">
                    <img src="https://d1tgh8fmlzexmh.cloudfront.net/ccbp-responsive-website/em-grilled-seafood-img.png" class="menu-item-image w-100" />
                    <h1 class="menu-card-title">Fish & Sea food</h1>
                    <a href="SeeMore.aspx" class="menu-item-link">
                        View All
                        <svg width="16px" height="16px" viewBox="0 0 16 16" class="bi bi-arrow-right" fill="#d0b200" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z" />
                        </svg>
                    </a>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <div class="menu-item-card shadow p-3 mb-3">
                    <img src="https://d1tgh8fmlzexmh.cloudfront.net/ccbp-responsive-website/em-hyderabadi-biryani-img.png" class="menu-item-image w-100" />
                    <h1 class="menu-card-title">Main Course</h1>
                    <a href="SeeMore.aspx" class="menu-item-link">
                        View All
                        <svg width="16px" height="16px" viewBox="0 0 16 16" class="bi bi-arrow-right" fill="#d0b200" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z" />
                        </svg>
                    </a>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <div class="menu-item-card shadow p-3 mb-3">
                    <img src="https://d1tgh8fmlzexmh.cloudfront.net/ccbp-responsive-website/em-mushroom-noodles-img.png" class="menu-item-image w-100" />
                    <h1 class="menu-card-title">Noodles</h1>
                    <a href="SeeMore.aspx" class="menu-item-link">
                        View All
                        <svg width="16px" height="16px" viewBox="0 0 16 16" class="bi bi-arrow-right" fill="#d0b200" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z" />
                        </svg>
                    </a>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <div class="menu-item-card shadow p-3 mb-3">
                    <img src="https://d1tgh8fmlzexmh.cloudfront.net/ccbp-responsive-website/em-gluten-img.png" class="menu-item-image w-100" />
                    <h1 class="menu-card-title">Salads</h1>
                    <a href="SeeMore.aspx" class="menu-item-link">
                        View All
                        <svg width="16px" height="16px" viewBox="0 0 16 16" class="bi bi-arrow-right" fill="#d0b200" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z" />
                        </svg>
                    </a>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <div class="menu-item-card shadow p-3 mb-3">
                    <img src="https://d1tgh8fmlzexmh.cloudfront.net/ccbp-responsive-website/em-coffee-bourbon-img.png" class="menu-item-image w-100" />
                    <h1 class="menu-card-title">Desserts</h1>
                    <a href="SeeMore.aspx" class="menu-item-link">
                        View All
                        <svg width="16px" height="16px" viewBox="0 0 16 16" class="bi bi-arrow-right" fill="#d0b200" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z" />
                        </svg>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
