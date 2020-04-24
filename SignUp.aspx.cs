using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WADAssignment_4
{
    public partial class SignUp : System.Web.UI.Page
    {
        public object MessageBox { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsValid)
                {
                    // Read connection string from Web.config
                    string ConnString = ConfigurationManager.ConnectionStrings["c432019sp01patelb2ConnectionString"].ConnectionString;
                    // define INSERT query with parameters
                    string query = "INSERT INTO Users VALUES (@username, @password, @lastName, @firstName, @address, @birthDate, @phone)";


                    // create connection and command
                    SqlConnection cn = new SqlConnection(ConnString);
                    SqlCommand cmd = new SqlCommand(query, cn);

                    // define parameters and their values
                    cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = txtusernameregister.Text;
                    cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = txtpasswordregister.Text;
                    cmd.Parameters.Add("@lastName", SqlDbType.VarChar).Value = txtlastname.Text;
                    cmd.Parameters.Add("@firstName", SqlDbType.VarChar).Value = txtfirstname.Text;
                    cmd.Parameters.Add("@address", SqlDbType.VarChar).Value = txtAddress.Text;
                    cmd.Parameters.Add("@birthDate", SqlDbType.Date).Value = Convert.ToDateTime(txtDob.Text);
                    cmd.Parameters.Add("@phone", SqlDbType.BigInt).Value = txtphone.Text;
                    cn.Open();

                    SqlDataReader cdr = cmd.ExecuteReader();
                    while (cdr.Read())
                    {
                        if (cdr.HasRows == true)
                        {
                            Label1.Text = "Username = " + cdr[0].ToString() + " Already exist";
                            txtusernameregister.Text = "";
                            break;
                        }
                    }
                    cmd.ExecuteNonQuery();

                    lblErrorMsg.Text = "Now you will redirected to the SignIn Page !!!";
                    System.Threading.Thread.Sleep(5000);
                    Response.Redirect("~/Login.aspx");
                    cn.Close();
                }
            }
            catch (Exception ex)
            {
                Label1.Text = "username already Exits!!";
            }
        }
    }
}