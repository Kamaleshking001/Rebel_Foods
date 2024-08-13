using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rebel_foods
{
    public partial class StockDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }
        private void BindGridView()
        {
            String name = ConfigurationManager.ConnectionStrings["rebel_foods"].ConnectionString;
            SqlConnection con = new SqlConnection(name);
            con.Open();


            string query = "SELECT * FROM add_pro";



            SqlCommand command = new SqlCommand(query, con);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();



            adapter.Fill(dataTable);
            con.Close();

            // Bind the DataTable to the GridView
            GridView1.DataSource = dataTable;
            GridView1.DataBind();

        }
        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)

        {
            if (e.CommandName == "Edit_Click")
            {

                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Optionally, retrieve the column index
                int category = 1; // Assuming you want the first column, change accordingly
                int proname = 2;
                int qty = 3;
                int pri = 4;

                int id = 0;

                // Optionally, you can retrieve cell value if needed
                string Name1 = GridView1.Rows[rowIndex].Cells[id].Text;
                string CATEGORY = GridView1.Rows[rowIndex].Cells[category].Text;
                string PRONAME = GridView1.Rows[rowIndex].Cells[proname].Text;
                string QUANTITY = GridView1.Rows[rowIndex].Cells[qty].Text;
                string PRICE = GridView1.Rows[rowIndex].Cells[pri].Text;


                Response.Redirect("AddPro.aspx?rowIndex=" + rowIndex.ToString() + "&MCATEGORY=" + CATEGORY.ToString() + "&MPRONAME=" + PRONAME.ToString() + "&MQUANTITY=" + QUANTITY.ToString() + "&MPRICE=" + PRICE.ToString() + "&name1=" + Name1.ToString());

                // Redirect or perform any action based on the row and column index
            }
            if (e.CommandName == "Delete_Click")

            {

                int rowIndex1 = Convert.ToInt32(e.CommandArgument);
                int Proname = 2;
                int qty1 = 3;

                string  PRONAME= GridView1.Rows[rowIndex1].Cells[Proname].Text;
                string QTY1 = GridView1.Rows[rowIndex1].Cells[qty1].Text;

                String name = ConfigurationManager.ConnectionStrings["rebel_foods"].ConnectionString;
                SqlConnection con = new SqlConnection(name);
                con.Open();


                // Write your SQL query to retrieve data from the database
                string query = "Delete FROM add_pro where proname=@PRONAME AND quantity=@QTY1";



                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@PRONAME", PRONAME);
                cmd.Parameters.AddWithValue("@QTY1", QTY1);


                int i = cmd.ExecuteNonQuery();



                if (i > 0)
                {

                    string alertScript = @"<script type='text/javascript'>
                            if(confirm('Data Deleted Successfully. Do you want to reload the page?')) {
                                window.location.href = window.location.href;
                            } else {
                                 
                            }
                      </script>";

                    // Write the JavaScript to the response
                    Response.Write(alertScript);
                }
                else
                {
                    String alert = @"<script type=text/javascript>alert('INVALD DELETE FUNCITON');</script>";
                    Response.Write(alert);
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = ConfigurationManager.ConnectionStrings["rebel_foods"].ConnectionString;
            using (SqlConnection con = new SqlConnection(name))
            {
                con.Open();

                string query = "SELECT * FROM add_pro WHERE proname LIKE @proname";
                string cust = cus.Value.ToString();

                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@proname", "%" + cust + "%");

                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                con.Close();

                // Bind the DataTable to the GridView
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }
    }
}