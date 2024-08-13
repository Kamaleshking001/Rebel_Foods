using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rebel_foods
{
    public partial class CustomerDetails : System.Web.UI.Page
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


            string query = "SELECT * FROM customer";



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

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = ConfigurationManager.ConnectionStrings["rebel_foods"].ConnectionString;
            using (SqlConnection con = new SqlConnection(name))
            {
                con.Open();

                string query = "SELECT * FROM customer WHERE uname LIKE @cname";
                string cust = cus.Value.ToString();

                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@cname", "%" + cust + "%");

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