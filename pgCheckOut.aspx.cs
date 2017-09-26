using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class pgCheckOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //displaying user feedback label message
        Master.UserFeedBack.Text = "Please enter billing information.";

        //initilize data field
        myBusinessLayer = new clsBusinessLayer(Server.MapPath("~/App_Data/"));

        //binding customer grid view
        BindCustomerGridView();

        //binding xml grid view
        BindXMLGridView();

    }//end page load


    clsBusinessLayer myBusinessLayer; 


    //getters for checkout variables
    public TextBox FirstName
    { get { return txtFirstName; } }

    public TextBox LastName
    { get { return txtLastName; } }

    public TextBox AddressLine1
    { get { return txtLine1; } }

    public TextBox AddressLine2
    { get { return txtLine2; } }

    public TextBox City
    { get { return txtCity; } }

    public TextBox State
    { get { return txtState; } }

    public TextBox Phone
    { get { return txtPhone; } }

    public TextBox CreditCardNumber
    { get { return txtCCNumber; } }

    public String CreditCardType
    { get { return rblCCType.SelectedValue; } }



    //find last name event
    protected void btnFindLastName_Click(object sender, EventArgs e)
    {
        //passing last name to business layer and returning customer information from data layer
        dsAccounts dsFindLastName = myBusinessLayer.FindCustomer(txtLastName.Text);

        //checking all database table rows
        if (dsFindLastName.tblCustomers.Rows.Count > 0)
        {
            //displaying customer information
            txtFirstName.Text = dsFindLastName.tblCustomers[0].FirstName;
            txtLastName.Text = dsFindLastName.tblCustomers[0].LastName;
            txtLine1.Text = dsFindLastName.tblCustomers[0].Address1;
            txtLine2.Text = dsFindLastName.tblCustomers[0].Address2;
            txtCity.Text = dsFindLastName.tblCustomers[0].City;
            txtState.Text = dsFindLastName.tblCustomers[0].State;
            txtPhone.Text = dsFindLastName.tblCustomers[0].PhoneNumber;
            customerID.Text = dsFindLastName.tblCustomers[0].CustomerID.ToString();

            Master.UserFeedBack.Text = "Record Found";
        }
        else
        {
            //result message error
            Master.UserFeedBack.Text = "No records were found!";
        }
    }//end find last name 


    //update customer event
    protected void btnUpdateCustomer_Click(object sender, EventArgs e)
    {
        //getting form data 
        string results = myBusinessLayer.UpdateCustomer(txtFirstName.Text, txtLastName.Text, txtLine1.Text, txtLine2.Text, txtCity.Text, txtState.Text, txtPhone.Text, Convert.ToInt32(customerID.Text));
       
        //sending form data to business layer
        updateForm(results);

    }//end update customer


    //add customer event
    protected void btnAddCustomer_Click(object sender, EventArgs e)
    {
        //getting form data
        string results = myBusinessLayer.InsertCustomer(txtFirstName.Text, txtLastName.Text, txtLine1.Text, txtLine2.Text, txtCity.Text, txtState.Text, txtPhone.Text);

        //sending form data to business layer
        updateForm(results);

    }//end add customer 


    //clear form event
    public void btnClearForm_Click(object sender, EventArgs e)
    {
        ClearInputs(Page.Controls);
    }

    
    //update XML event
    public void btnUpdateXML_Click(object sender, EventArgs e)
    {
        gvXML.DataSource = myBusinessLayer.WriteCustomerXMLFile(Cache);
        gvXML.DataBind();
    }





    //update form method
    private void updateForm(string results)
    {
        //clearing form
        ClearInputs(Page.Controls);

        //setting result message
        Master.UserFeedBack.Text = results;

        //binding customer grid view
        BindCustomerGridView();
    }


    //clear form method
    private void ClearInputs(ControlCollection ctrls)
    {
        foreach (Control ctrl in ctrls)
        {
            if (ctrl is TextBox)
                ((TextBox)ctrl).Text = string.Empty;
            else if (ctrl is DropDownList)
                ((DropDownList)ctrl).ClearSelection();
            else if (ctrl is RadioButton)
                ((RadioButton)ctrl).Checked = false;
            else if (ctrl is RadioButtonList)
                ((RadioButtonList)ctrl).ClearSelection();
            else
                ClearInputs(ctrl.Controls);
        }
    }//end clearinputs 


    //bind customer grid view
    private dsAccounts BindCustomerGridView()
    {
        
        string tempPath = Server.MapPath("~/App_Data/Accounts.mdb");
        clsDataLayer myDataLayer = new clsDataLayer(tempPath);

        dsAccounts customerListing = myBusinessLayer.SelectAllCustomers();

        gvCustomerList.DataSource = customerListing.tblCustomers;

        //binding customer list griedview
        gvCustomerList.DataBind();
        Cache.Insert("CustomerDataSet", customerListing);

        return customerListing;
    }


    //bind xml grid view
    public void BindXMLGridView()
    {
        gvXML.DataSource = myBusinessLayer.GetCustomerXMLFile();
        gvXML.DataBind();
    }


}//end pgCheckOut