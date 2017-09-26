using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pgLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.UserFeedBack.Text = "Please enter username and password.";
    }


    protected void btnLogin_Click(object sender, EventArgs e)
    {
        clsBusinessLayer myBusinessLayer = new clsBusinessLayer(Server.MapPath("~/App_Data/"));

        bool isValidUser = myBusinessLayer.CheckUserCredentials(Session, txtUserID.Text, txtPassword.Text);

        //checking if valid customer
        if (isValidUser)
        {   
            //redirct page 
            Response.Redirect("~/pgCheckOut.aspx");
        }
        else if (Convert.ToBoolean(Session["LockedSession"]))
        {
            Master.UserFeedBack.Text = "Account is disabled. Contact System Administrator";

            //hide login button
            btnLogin.Visible = false;
        }
        else
        {
            //result message error 
            Master.UserFeedBack.Text = "The User ID and/or Password supplied is incorrect. Please try again!";
        }
    }


}//end login page
