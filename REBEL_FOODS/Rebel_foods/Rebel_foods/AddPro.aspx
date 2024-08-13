<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPro.aspx.cs" Inherits="Rebel_foods.AddPro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> ADD NEW PRODUCT</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="index.css">

<style>
    .container1 {
        margin: 70px;
        
    }

    .registration-form-container {
        background-color: #ffffff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }
</style>
</head>
<body>
  
             <div class="container1">
     <div class="registration-form-container">
         <h2 class="text-center mb-4">Add New Product</h2>
         <form id="registrationForm" runat="server">
             <div class="form-group">
                <label for="category">Category</label>
                <select name="categoryDropDown" id="category" class="form-control" required="required" runat="server">
                    <option value="Non-Veg Starters">Non-Veg Starters</option>
                    <option value="Veg Starters">Veg Starters</option>
                    <option value="Soups">Soups</option>
                    <option value="Fish & Sea food">Fish & Sea food</option>
                    <option value="Main Course">Main Course</option>
                    <option value="Noodles">Noodles</option>
                    <option value="Salads">Salads</option>
                    <option value="Desserts">Desserts</option>
                </select>
            </div>
             <div class="form-group">
                 <label for="proname">Product Name</label>
                 <input type="text" class="form-control" id="proname"  required runat="server">
             </div>
             <div class="form-group">
                 <label for="qnty">Quantity</label>
                 <input type="text" class="form-control" id="qnty"  required runat="server">
             </div>
             <div class="form-group">
                 <label for="pric">Price</label>
                 <input type="text" class="form-control" id="pric"  required runat="server">
             </div>
             <div class="form-group d-flex flex-column">
                <label for="fileUpload" class="mb-2">Image:</label>
                <asp:FileUpload ID="FileUpload1" class="form-control-file mb-3" runat="server" />
             </div>
             

             
             <asp:Button ID="Button1" class="btn btn-primary btn-block mt-4" runat="server" Text="Add Product" OnClick="Button1_Click" />
         </form>
     </div>
 </div>
        
</body>
</html>
