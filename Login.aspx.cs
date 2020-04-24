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
    public partial class Login : System.Web.UI.Page
    {
        Users userobj = new Users();
             Users userobjpass = new Users();
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            LinkButton1.Enabled = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsValid)
                {
                    // Read connection string from Web.config
                    string ConnString = ConfigurationManager.ConnectionStrings["c432019sp01patelb2ConnectionString"].ConnectionString;
                    string usernames = TextBox1.Text;
                    string passwords = TextBox2.Text;
                    string query = "select * from Users where username='" + usernames + "' and password='" + passwords + "'";

                    SqlConnection cnn = new SqlConnection(ConnString);
                    SqlCommand cmd = new SqlCommand(query, cnn);
                    // define parameters and their values
                    cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = usernames;
                    cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = passwords;
                    cnn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    
                    if (reader.Read())
                    {
                        if (reader.HasRows != true)
                        {
                            Label1.Text = "Username = " + reader[0].ToString() + " does not exist!!!";
                            TextBox1.Text = "";
                            
                        }
                        Label1.Text = "<h1>Hey There! Welcome</h1><br/><h3>Go to MyAccount to see your personal information!!</h3> ";
                        LinkButton1.Enabled = true;
                        userobj.Username = usernames;
                        Session["usernamelogin"] = userobj;
                        userobjpass.Password = passwords;
                        Session["userpasswordlogin"] = userobjpass;
                        TextBox1.Enabled = false;
                        TextBox2.Enabled = false;
                    }
                    else
                    {
                        Label1.Text = "Username & Password Is not correct Try again..!!";

                    }
                    reader.Close();
                    cmd.Dispose();
                    cnn.Close();
                                        

                }
            }
            catch (Exception ex)
            {
                Label1.Text = "Username does not Exist!!";

            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox1.Enabled = true;

            TextBox2.Enabled = true;
            LinkButton1.Enabled = false;
        }
    }
}