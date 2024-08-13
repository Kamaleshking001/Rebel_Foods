using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Rebel_foods
{
    public partial class BuyCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Label1.Text + Session["isLoggedIn"];

            
            {
                if (Session["isLoggedIn"] != null)
                {
                    string Uname = Session["isLoggedIn"].ToString();

                    string name = ConfigurationManager.ConnectionStrings["rebel_foods"].ConnectionString;
                    SqlConnection con = new SqlConnection(name);
                    con.Open();

                    string query = "SELECT catagory,proname,quantity,price,proimg from cart_pro where username=@uname";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@uname", Uname);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string catag = dt.Rows[i][0].ToString();
                        string pn = dt.Rows[i][1].ToString();
                        string pq = dt.Rows[i][2].ToString();
                        string pri = dt.Rows[i][3].ToString();
                        string pimg = dt.Rows[i][4].ToString();

                        // Create a new Button control
                        Button btnCheckout = new Button();
                        btnCheckout.ID = "btnCheckout" + i;
                        btnCheckout.Text = "Checkout";
                        btnCheckout.CssClass = "btn btn-primary";
                        btnCheckout.CommandArgument = pn; // Set CommandArgument to the product name
                        btnCheckout.Click += new EventHandler(btnCheckout_Click); // Attach the event handler

                        // Add the button dynamically to the form
                        rptProducts.Controls.Add(btnCheckout);

                        // Generate HTML markup for the product
                        string productHtml = "<div class=\"product\">" +
                                                "<h4>" + pn + "</h4>" +
                                                "<p>Category: " + catag + "</p>" +
                                                "<p>Quantity: " + pq + "</p>" +
                                                "<p>Price: $" + pri + "</p>" +
                                                "<img src=\"" + pimg + "\" alt=\"Product Image\" />" +
                                              "</div>";

                        // Add the product HTML to the productContainer
                        rptProducts.Controls.Add(new LiteralControl(productHtml));
                    }
                }
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string productName = btn.CommandArgument;

            if (Session["isLoggedIn"] != null)
            {
                string Uname = Session["isLoggedIn"].ToString();

                string name = ConfigurationManager.ConnectionStrings["rebel_foods"].ConnectionString;
                using (SqlConnection con = new SqlConnection(name))
                {
                    con.Open();

                    // Delete the selected product from the database
                    string query = "DELETE FROM cart_pro WHERE username = @uname AND proname = @productName";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@uname", Uname);
                    cmd.Parameters.AddWithValue("@productName", productName);
                    cmd.ExecuteNonQuery();
                }
            }

            // Reload the page to reflect the changes
            Response.Redirect(Request.RawUrl);
        }

    }
}