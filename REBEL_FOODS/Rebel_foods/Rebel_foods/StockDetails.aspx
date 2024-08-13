<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockDetails.aspx.cs" Inherits="Rebel_foods.StockDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />

   <style type="text/css">
    .cus_item {
       display: flex;
       justify-content: center;
       align-items: center;
       height: 100vh;
   }
     .search{
        width:100%;
        height:100px;
        background-color:grey;
        display:flex;
        flex-direction:row;
        justify-content:center;
        align-items:center;

    }
      </style>
</head>
<body>
    <form id="form1" runat="server">
                         <div class="search">
     <input id="cus" class="form-control me-2" type="search" placeholder="Search" aria-label="Search" runat="server">&emsp;
     <asp:Button ID="Button1" class="btn btn-outline-success" runat="server" Text="Search" OnClick="Button1_Click" />
</div>
        <div class="cus_item">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered gridview-border" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="PRODUCT ID" ItemStyle-HorizontalAlign="Justify" HeaderStyle-HorizontalAlign="Justify" />
            <asp:BoundField DataField="catagory" HeaderText="PRODUCT CATEGORY" ItemStyle-HorizontalAlign="Justify" HeaderStyle-HorizontalAlign="Justify" />
            <asp:BoundField DataField="proname" HeaderText="PRODUCT NAME" ItemStyle-HorizontalAlign="Justify" HeaderStyle-HorizontalAlign="Justify" />
            <asp:BoundField DataField="quantity" HeaderText="PRODUCT QUANTITY" ItemStyle-HorizontalAlign="Justify" HeaderStyle-HorizontalAlign="Justify" />
            <asp:BoundField DataField="price" HeaderText="PRODUCT PRICE" ItemStyle-HorizontalAlign="Justify" HeaderStyle-HorizontalAlign="Justify" />
            <asp:BoundField DataField="proimg" HeaderText="PRODUCT IMAGE" ItemStyle-HorizontalAlign="Justify" HeaderStyle-HorizontalAlign="Justify" />
            <asp:ButtonField Text="Edit" ItemStyle-HorizontalAlign="Justify" HeaderStyle-HorizontalAlign="Justify" />
            <asp:ButtonField Text="Delete" ItemStyle-HorizontalAlign="Justify" HeaderStyle-HorizontalAlign="Justify" />
           
        </Columns>
    </asp:GridView>
            </div>
    </form>
</body>
</html>
