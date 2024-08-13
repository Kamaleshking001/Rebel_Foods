using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rebel_foods
{
    public partial class AddPro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)

            {


                if (Request.QueryString["rowIndex"] != null)
                {





                    string PROCAT = Request.QueryString["MCATEGORY"];
                    category.Value = PROCAT.ToString();

                    string PRONAME = Request.QueryString["MPRONAME"];
                    proname.Value = PRONAME.ToString();

                    string PROQTY = Request.QueryString["MQUANTITY"];
                    qnty.Value = PROQTY.ToString();

                    string PROPRI = Request.QueryString["MPRICE"];
                    pric.Value = PROPRI.ToString();

                    



                }


            }




        }
        private bool IsImage(string fileName)
        {
            string extension = Path.GetExtension(fileName);
            string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };
            return allowedExtensions.Contains(extension.ToLower());
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (FileUpload1.HasFile)
            {
                try
                {
                    // Check if the uploaded file is an image
                    if (IsImage(FileUpload1.FileName))
                    {


                        string uploadFolderPath = Server.MapPath("~/images/");

                        // Ensure the folder exists, create if not
                        if (!Directory.Exists(uploadFolderPath))
                        {
                            Directory.CreateDirectory(uploadFolderPath);
                        }

                        // Get the file name
                        string fileName = proname.Value.ToString();

                        // Combine the folder path and file name to get the full path
                        string filePath = Path.Combine(uploadFolderPath, fileName + ".png");

                        // Save the file to the server
                        FileUpload1.SaveAs(filePath);



                        String cata = category.Value.ToString();

                        String rebel = ConfigurationManager.ConnectionStrings["rebel_foods"].ConnectionString;
                        SqlConnection con = new SqlConnection(rebel);
                        con.Open();

                        SqlCommand cmd = new SqlCommand("sp_add_pro", con);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        SqlParameter cat = new SqlParameter("@catagory", System.Data.SqlDbType.VarChar);
                        cmd.Parameters.Add(cat).Value = cata;

                        SqlParameter pname = new SqlParameter("@proname", System.Data.SqlDbType.VarChar);
                        cmd.Parameters.Add(pname).Value = proname.Value.ToString();

                        SqlParameter qty = new SqlParameter("@quantity", System.Data.SqlDbType.VarChar);
                        cmd.Parameters.Add(qty).Value = qnty.Value.ToString();

                        SqlParameter pri = new SqlParameter("@price", System.Data.SqlDbType.VarChar);
                        cmd.Parameters.Add(pri).Value = pric.Value.ToString();

                        SqlParameter proimg = new SqlParameter("@proimg", System.Data.SqlDbType.VarChar);
                        cmd.Parameters.Add(proimg).Value = fileName.ToString()+".png";


                        int i = cmd.ExecuteNonQuery();


                        if (i > 0)
                        {
                            string script = @"<script type='text/javascript'>
                                            alert('PRODUCT DATA ADDED SUCCESSFULLY');
                                        </script>";
                            Response.Write(script);



                        }
                        else
                        {
                            string script = @"<script type='text/javascript'>
                                            alert('INVALID PRODUCT DATA');
                                        </script>";
                            Response.Write(script);



                        }
                    }

                }
                catch (Exception ex)
                {
                    // Display an error message if something goes wrong
                    Response.Write("Error: " + ex.Message);
                }


            }
            else
            {
                // Display a message if no file was selected
                Response.Write("Please select a file to upload.");
            }
        }
    }
}