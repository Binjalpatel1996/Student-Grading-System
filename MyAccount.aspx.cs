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
    public partial class MyAccount : System.Web.UI.Page
    {
        string ConnString = ConfigurationManager.ConnectionStrings["c432019sp01patelb2ConnectionString"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            
            txtfirstnameAccount.ReadOnly = true;
            txtuserAccount.ReadOnly = true;
            txtlastnameAccount.ReadOnly = true;
            txtpasswordAccount.ReadOnly = true;
            txtAddressAccount.ReadOnly = true;
            txtdobAccount.ReadOnly = true;
            txtphoneAccount.ReadOnly = true;

            Button2.Enabled = false;
            Button3.Enabled = false;
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try { 
            Label1.Text = "";
            Users userObj = (Users)Session["usernamelogin"];
            Users userObjpass = (Users)Session["userpasswordlogin"];
                if (Session != null) {

                    string sel = "select * from Users where username='" + userObj.Username + "' and password='" + userObjpass.Password + "'";
                    SqlConnection cnn = new SqlConnection(ConnString);
                    SqlCommand cmd = new SqlCommand(sel, cnn);

                    cnn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtuserAccount.Text = reader["username"].ToString();
                        txtpasswordAccount.Text = reader["password"].ToString();
                        txtfirstnameAccount.Text = reader["firstName"].ToString();
                        txtlastnameAccount.Text = reader["lastNAme"].ToString();
                        txtAddressAccount.Text = reader["address"].ToString();
                        txtphoneAccount.Text = reader["phone"].ToString();
                        txtdobAccount.Text = reader["birthDate"].ToString();

                    }
                    else
                    {

                    }
                    reader.Close();
                    cmd.Dispose();
                    cnn.Close();
                    Button2.Enabled = false;
                    Button3.Enabled = true;
                    Button1.Enabled = false;
                }
                

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                Label1.Text = "";
                string query = "Update Users SET password=@password,lastName = @lastName, firstName = @firstName,address = @address, birthDate = @birthDate, phone = @phone WHERE username = @username";
                SqlConnection cn = new SqlConnection(ConnString);
                SqlCommand cmd = new SqlCommand(query, cn);
                // define parameters and their values
                cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = txtuserAccount.Text;
                cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = txtpasswordAccount.Text;
                cmd.Parameters.Add("@lastName", SqlDbType.VarChar).Value = txtlastnameAccount.Text;
                cmd.Parameters.Add("@firstName", SqlDbType.VarChar).Value = txtfirstnameAccount.Text;
                cmd.Parameters.Add("@address", SqlDbType.VarChar).Value = txtAddressAccount.Text;
                cmd.Parameters.Add("@birthDate", SqlDbType.Date).Value = Convert.ToDateTime(txtdobAccount.Text);
                cmd.Parameters.Add("@phone", SqlDbType.BigInt).Value = txtphoneAccount.Text;

                // open connection, execute UPDATE, close connection
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();

                Button2.Enabled = false;
                Button3.Enabled = false;
                Label1.Text = "Record Updated!";
                Button1.Enabled = true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            Button1.Enabled = false;
            txtfirstnameAccount.ReadOnly = false;
            txtuserAccount.ReadOnly = false;
            txtlastnameAccount.ReadOnly = false;
            txtpasswordAccount.ReadOnly = false;
            txtAddressAccount.ReadOnly = false;
            txtdobAccount.ReadOnly = false;
            txtphoneAccount.ReadOnly = false;
            Button2.Enabled = true;
        }
    }
}