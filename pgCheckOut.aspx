<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/BookStore.master" CodeFile="pgCheckOut.aspx.cs" Inherits="pgCheckOut" %>
<%@ MasterType VirtualPath ="~/BookStore.master" %>


        <asp:Content ID="ContentArea1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
        <asp:Label ID="Label1" runat="server" Text="First Name:" Width="110px"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Last Name:" Width="110px"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Address Line 1:" Width="110px"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtLine1" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Address Line 2:" Width="110px"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtLine2" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label5" runat="server" Text="City:" Width="110px"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label6" runat="server" Text="State:" Width="110px"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label7" runat="server" Text="Phone Number:" Width="110px"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
        <br />
            <br />
            <asp:Label ID="lblGVDataBase" runat="server" Text="Customers In Database: "></asp:Label>
            <asp:GridView ID="gvCustomerList" runat="server" Font-Size="9">
            </asp:GridView>
            <br />
            <br />
            <asp:Label ID="lblGVXML" runat="server" Text="Customers In XML File:"></asp:Label>
            <asp:GridView ID="gvXML" runat="server" Font-Size="9">
            </asp:GridView>
        <br />
        </asp:Content>



        <asp:Content ID="ContentArea2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">


            <asp:Button ID="btnClearForm" runat="server" Text="Clear Form" OnClick="btnClearForm_Click" PostBackUrl="~/pgCheckOut.aspx" Width="120px" />
            &nbsp;&nbsp;&nbsp; <asp:Button ID="btnAddCustomer" runat="server" Text="Add Customer" Width="120px" OnClick="btnAddCustomer_Click" />
            <br />
            <br />
            <asp:Button ID="btnFindLastName" runat="server" OnClick="btnFindLastName_Click" Text="Find Last Name" Width="120px" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnUpdateCustomer" runat="server" OnClick="btnUpdateCustomer_Click" Text="Update Customer" Width="120px" />
            <br />
            <br />
            <asp:Label ID="lblCustID" runat="server" Text="Customer ID:"></asp:Label>
            &nbsp;
            <asp:Label ID="customerID" runat="server"></asp:Label>
            <br />
            <br />


        <asp:Label ID="Label9" runat="server" Text="Payment Method:"></asp:Label>
        <br />
        <asp:RadioButtonList ID="rblCCType" runat="server" Height="27px" Width="125px" AutoPostBack="True">
            <asp:ListItem Selected="True">Visa</asp:ListItem>
            <asp:ListItem>Master Card</asp:ListItem>
            <asp:ListItem>Discover</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Label ID="Label8" runat="server" Text="Credit Card Number:"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtCCNumber" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnSubmit" runat="server" PostBackUrl="~/pgConfirm.aspx" Text="Submit" Width="120px" />
        &nbsp;&nbsp;&nbsp;
            <br />
            <br />
        <asp:Button ID="btnUpdateXML" runat="server" OnClick="btnUpdateXML_Click" Text="Update XML" Width="120px" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        <br />
        
        </asp:Content>
