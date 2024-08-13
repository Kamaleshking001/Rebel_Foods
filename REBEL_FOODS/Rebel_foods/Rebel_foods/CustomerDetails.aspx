<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerDetails.aspx.cs" Inherits="Rebel_foods.CustomerDetails" %>

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
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered gridview-border" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="CUSTOMER ID" ItemStyle-HorizontalAlign="Justify" HeaderStyle-HorizontalAlign="Justify" />
            <asp:BoundField DataField="username" HeaderText="USER NAME" ItemStyle-HorizontalAlign="Justify" HeaderStyle-HorizontalAlign="Justify" />
            <asp:BoundField DataField="email" HeaderText="EMAIL ID" ItemStyle-HorizontalAlign="Justify" HeaderStyle-HorizontalAlign="Justify" />
            <asp:BoundField DataField="addr" HeaderText="MOBILE NO" ItemStyle-HorizontalAlign="Justify" HeaderStyle-HorizontalAlign="Justify" />
            <asp:BoundField DataField="city" HeaderText="ADDRESS" ItemStyle-HorizontalAlign="Justify" HeaderStyle-HorizontalAlign="Justify" />
            <asp:BoundField DataField="pincode" HeaderText="PINCODE" ItemStyle-HorizontalAlign="Justify" HeaderStyle-HorizontalAlign="Justify" />
            <asp:ButtonField Text="Edit" ItemStyle-HorizontalAlign="Justify" HeaderStyle-HorizontalAlign="Justify" />
            <asp:ButtonField Text="Delete" ItemStyle-HorizontalAlign="Justify" HeaderStyle-HorizontalAlign="Justify" />
           
        </Columns>
    </asp:GridView>
            </div>
    </form>
</body>
</html>
