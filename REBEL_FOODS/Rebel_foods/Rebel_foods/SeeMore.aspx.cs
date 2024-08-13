using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Net.NetworkInformation;

namespace Rebel_foods
{
    public partial class SeeMore : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
            Label1.Text = Label1.Text + Session["isLoggedIn"];

        }
        private void BindGridView()
        {
            string name = ConfigurationManager.ConnectionStrings["rebel_foods"].ConnectionString;
            using (SqlConnection con = new SqlConnection(name))
            {
                con.Open();

                string query = "SELECT * FROM add_pro";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                ProductRepeater.DataSource = ds.Tables[0];
                ProductRepeater.DataBind();
            }
        }

        protected void ProductRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Buy")
            {

                if (Session["isLoggedIn"] != null)
                {


                    String Uname = Session["isLoggedIn"].ToString();
                    String user = Uname.ToString();

                    Label category = (Label)e.Item.FindControl("Cat");
                    Label pname = (Label)e.Item.FindControl("pron");
                    Label quantity = (Label)e.Item.FindControl("qty");
                    Label Price = (Label)e.Item.FindControl("price"); 




                    string category1 = category.Text;
                    string pname1 = pname.Text;
                    string quantity1 = quantity.Text;
                    string Price1 = Price.Text;


                    // Access the image URL if ProductImage is found
                    Image ProductImage = (Image)e.Item.FindControl("ProductImage");
                    string imageUrl = ProductImage != null ? ProductImage.ImageUrl : "Image not found";




                    String name = ConfigurationManager.ConnectionStrings["rebel_foods"].ConnectionString;
                    SqlConnection con = new SqlConnection(name);
                    con.Open();


                    // Write your SQL query to retrieve data from the database
                    string query = "Select username,email,addr,city,pincode from customer where username=@uname ";

                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@uname", user);


                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    String cusname = ds.Tables[0].Rows[0][0].ToString();
                    String cusmail = ds.Tables[0].Rows[0][1].ToString();
                    
                    String cusaddr = ds.Tables[0].Rows[0][2].ToString();
                    String cuscity = ds.Tables[0].Rows[0][3].ToString();
                    String cuspin = ds.Tables[0].Rows[0][4].ToString();







                    con.Close();


                    con.Open();



                    SqlCommand cmd1 = new SqlCommand("sp_cart_pro", con);
                    cmd1.CommandType = System.Data.CommandType.StoredProcedure;

                    SqlParameter parem1 = new SqlParameter("@username", System.Data.SqlDbType.VarChar);
                    cmd1.Parameters.Add(parem1).Value = cusname.ToString();

                    SqlParameter parem2 = new SqlParameter("@email", System.Data.SqlDbType.VarChar);
                    cmd1.Parameters.Add(parem2).Value = cusmail.ToString();

                    SqlParameter parem3 = new SqlParameter("@addr", System.Data.SqlDbType.VarChar);
                    cmd1.Parameters.Add(parem3).Value = cusaddr.ToString();

                    SqlParameter parem4 = new SqlParameter("@city", System.Data.SqlDbType.VarChar);
                    cmd1.Parameters.Add(parem4).Value = cuscity.ToString();

                    SqlParameter parem5 = new SqlParameter("@pincode", System.Data.SqlDbType.VarChar);
                    cmd1.Parameters.Add(parem5).Value = cuspin.ToString();

                    SqlParameter parem6 = new SqlParameter("@catagory", System.Data.SqlDbType.VarChar);
                    cmd1.Parameters.Add(parem6).Value = category1.ToString();

                    SqlParameter parem7 = new SqlParameter("@proname", System.Data.SqlDbType.VarChar);
                    cmd1.Parameters.Add(parem7).Value = pname1.ToString();

                    SqlParameter parem8 = new SqlParameter("@quantity", System.Data.SqlDbType.VarChar);
                    cmd1.Parameters.Add(parem8).Value = quantity1.ToString();

                    SqlParameter parem9 = new SqlParameter("@price", System.Data.SqlDbType.VarChar);
                    cmd1.Parameters.Add(parem9).Value = Price1.ToString();

                    SqlParameter parem10 = new SqlParameter("@proimg", System.Data.SqlDbType.VarChar);
                    cmd1.Parameters.Add(parem10).Value = imageUrl.ToString();


                    int i = cmd1.ExecuteNonQuery();
                    if (i > 0)
                    {
                        string script = @"<script type='text/javascript'>
                                            alert('YOU CAN SEE YOUR ORDER IN ADD TO CART');
                                            window.location.href = window.location.href;
                                        </script>";
                        Response.Write(script);

                    }
                    else
                    {
                        string script = @"<script type='text/javascript'>
                                            alert('Youhave some error');
                                        </script>";
                        Response.Write(script);
                    }
                    con.Close();







                }
                else
                {
                    Response.Redirect("Login.aspx");
                }

                // Now you can use the data and image URL as needed
                //string message = $"You clicked Buy for {brand} {model}, priced at ${price}. Image URL: {imageUrl}";
                //Response.Write(message);
            }
        }
    }
}