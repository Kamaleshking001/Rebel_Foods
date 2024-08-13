using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rebel_foods
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             Label1.Text = Label1.Text + Session["isLoggedIn"];

            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewMenu.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("SeeMore.aspx");
        }
    }
}