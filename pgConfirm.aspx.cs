using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pgConfirm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //displaying user feedback label message
        Master.UserFeedBack.Text = "Please confirm your billing information.";

        //exception handling
        try
        {
            //checking if previous page is cross page post back
            if (PreviousPage.IsCrossPagePostBack)
            {
                //setting name label to checkout page input field
                lblName.Text = PreviousPage.FirstName.Text + " " + PreviousPage.LastName.Text;

                //setting address label to checkout page input field
                lblAddress.Text = PreviousPage.AddressLine1.Text + " " + PreviousPage.AddressLine2.Text;

                //setting credit card number label to checkout page input field
                lblCCNumber.Text = PreviousPage.CreditCardNumber.Text;

                //setting credit card type label to checkout page input field
                lblCCType.Text = PreviousPage.CreditCardType;
            }
        }

        catch (Exception error)
        {
            //displaying user feedback label message
            Master.UserFeedBack.Text = " Sorry, there was an error processing your request.";
        }

      
    myBusinessLayer = new clsBusinessLayer(Server.MapPath("~/App_Data/"));

    }


    clsBusinessLayer myBusinessLayer;

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //displaying user feedback label message
        Master.UserFeedBack.Text = "Your order has been submitted for processing.";
    }


    protected void btnSendMail_Click(object sender, EventArgs e)
    {
        Master.UserFeedBack.Text = myBusinessLayer.SendEmail(txtFrom.Text, txtTo.Text, txtSubject.Text, txtMessage.Text, txtPassword.Text);
    }


}//end page Confirm