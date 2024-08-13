<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Rebel_foods.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="index.css">
    <style>
        #form1{
            margin-top:120px;
        }
    </style>
</head>
<body>
    
     <nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
     <div class="container">

         <a class="navbar-brand" href="#">
             <img src="https://d1tgh8fmlzexmh.cloudfront.net/ccbp-responsive-website/food-munch-img.png" class="food-munch-logo" />
         </a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
             <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
             <div class="navbar-nav ml-auto">
                 <a class="nav-link" id="navItem1" href="Register.aspx">
                     Register
                     
                 </a>
                 
                 <a class="nav-link active" id="navItem2" href="Login.aspx">Login
                     <span class="sr-only">(current)</span>
                 </a>
             </div>
         </div>
     </div>
 </nav>
    <form id="form1" runat="server">
        <div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="text-center">Rebel Foods Login</h4>
                </div>
                <div class="card-body">
            
                    
                        <div class="form-group">
                            <label for="username">Username:</label>
                            <input type="text" class="form-control" id="username" required runat="server">
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" class="form-control" id="password" required runat="server">
                        </div>
                    <asp:Button ID="Button1" class="btn btn-primary btn-block" runat="server" Text="Login" OnClick="Button1_Click" />
                   
                </div>
            </div>
        </div>
    </div>
</div>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
