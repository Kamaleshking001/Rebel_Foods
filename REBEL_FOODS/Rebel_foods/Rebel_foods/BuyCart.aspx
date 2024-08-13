<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuyCart.aspx.cs" Inherits="Rebel_foods.BuyCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Food Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
    <style>
        /* Custom CSS styles */
        .navbar-brand img {
            height: 70px;
            width: 200px;
        }
        .navbar-toggler {
            background-color: #fff;
        }
        .nav-link {
            color: #333;
        }
        .nav-link.active {
            color: #007bff;
        }
        .product {
            border: 1px solid #dee2e6;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #f8f9fa;
        }
        .product img {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
        }
        .btn-cancel {
            background-color: #ffcccc;
            border-color: #ff6666;
            color: #ff6666;
        }
        .btn-cancel:hover {
            background-color: #ff9999;
            border-color: #ff3333;
            color: #ff3333;
        }
        #TotalPrice {
            color: #007bff;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <img src="images/Rebel_logo.jfif" class="Rebel-Foods-logo" alt="Rebel Foods Logo" />
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav ml-auto">
                        <a class="nav-link active" id="navItem1" href="#wcuSection">Why Choose Us?<span class="sr-only">(current)</span></a>
                        <a class="nav-link" href="#exploreMenuSection" id="navItem2">Explore Menu</a>
                        <a class="nav-link" href="#deliveryPaymentSection" id="navItem3">Delivery & Payment</a>
                        <a class="nav-link" href="#followUsSection" id="navItem4">Follow Us</a>
                        
                        <% if (Session["isLoggedIn"] != null) { %>
                            <a style="height:50px; width:50px;"  href="BuyCart.aspx"><img src="images1/cart.png"/><span id="span" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" runat="server">99+</span></a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
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


        <!-- Food items section -->
        <div class="container-fluid bg-light py-3" style="margin-top:100px">
            <div class="container">
                <h4 class="text-center mb-0">Total Price: $<span id="TotalPrice">0.00</span></h4>
            </div>
        </div>

        <div class="container mt-5">
            <div class="row">
                <div class="col-md-8">
                    <!-- Food items display -->
                    <h2>Our Menu</h2>
                    <asp:Repeater ID="rptProducts" runat="server">
                        <ItemTemplate>
                            <div class="product">
                                
                                <asp:Button ID="btnCheckout" runat="server" Text="Cancel Order" CssClass="btn btn-cancel d-block mx-auto"
                                    CommandArgument='<%# Eval("ProductName") %>' OnClick="btnCheckout_Click" />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="col-md-4">
                    <!-- Cart section -->
                    <h2>Cart</h2>
                    <!-- Cart items display -->
                    <!-- Individual item price -->
                    <h4>Price: $<span id="Price" runat="server"></span></h4> <!-- Display price -->
                    <!-- Checkout buttons -->
                </div>
            </div>
        </div>
    </form>

    <!-- Add your JavaScript and jQuery scripts here -->

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-PMZnXOFVfYhNn8hALQi65wGiYCkpvu9aB/0CaVaGwFP3rNM82/ysPLFY8WmVUKo6" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shCk5KVYB+XvJ6m8xgZIeTI7Ehx8hR2Z9J3zc" crossorigin="anonymous"></script>
</body>
</html>
