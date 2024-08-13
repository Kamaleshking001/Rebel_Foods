using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Rebel_foods
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String rebel = ConfigurationManager.ConnectionStrings["rebel_foods"].ConnectionString;
            SqlConnection con = new SqlConnection(rebel);
            con.Open();

            SqlCommand cmd = new SqlCommand("sp_Log", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlParameter uname = new SqlParameter("@username", System.Data.SqlDbType.VarChar);
            cmd.Parameters.Add(uname).Value = username.Value.ToString();

            SqlParameter pass = new SqlParameter("@pass", System.Data.SqlDbType.VarChar);
            cmd.Parameters.Add(pass).Value = password.Value.ToString();


            SqlDataAdapter da=new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            try
            {
                String login = ds.Tables[0].Rows[0][0].ToString();
                Session["isloggedin"] = login;
                if (login != null)
                {
                    String alert = @"<script>alert('Login Successfull')</script>";
                    Response.Write(alert);
                    Response.Redirect("index.aspx");
                }
                else
                {
                    String alert = @"<script>alert('INVALID LOGIN')</script>";
                    Response.Write(alert);
                }
            }
            catch
            {
                String alert = @"<script>alert('INVALID username password')</script>";
                Response.Write(alert);
            }
            
            
        }
    }
}