using System;
using System.Collections.Generic;
using System.Configuration;
using System.Configuration.Internal;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rebel_foods
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String rebel = ConfigurationManager.ConnectionStrings["rebel_foods"].ConnectionString;
            SqlConnection con=new SqlConnection(rebel);
            con.Open();

            SqlCommand cmd = new SqlCommand("sp_reg", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlParameter uname = new SqlParameter("@username", System.Data.SqlDbType.VarChar);
            cmd.Parameters.Add(uname).Value= username.Value.ToString();

            SqlParameter mail = new SqlParameter("@email", System.Data.SqlDbType.VarChar);
            cmd.Parameters.Add(mail).Value = email.Value.ToString();

            SqlParameter addr = new SqlParameter("@addr", System.Data.SqlDbType.VarChar);
            cmd.Parameters.Add(addr).Value = address.Value.ToString();

            SqlParameter city1 = new SqlParameter("@city", System.Data.SqlDbType.VarChar);
            cmd.Parameters.Add(city1).Value = city.Value.ToString();

            SqlParameter pin = new SqlParameter("@pincode", System.Data.SqlDbType.VarChar);
            cmd.Parameters.Add(pin).Value = pincode.Value.ToString();

            SqlParameter pass = new SqlParameter("@pass", System.Data.SqlDbType.VarChar);
            cmd.Parameters.Add(pass).Value = password.Value.ToString();

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                String alert = @"<script>alert('Registration Successfull')</script>";
                Response.Write(alert);
                Response.Redirect("Login.aspx");

            }
            else
            {
                String alert = @"<script>alert('INVALID Registration')</script>";
                Response.Write(alert);
            }
        }

    }
}