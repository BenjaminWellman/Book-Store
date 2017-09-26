<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/BookStore.master" CodeFile="pgConfirm.aspx.cs" Inherits="pgConfirm" %>
<%@ MasterType VirtualPath ="~/BookStore.master" %>
<%@ PreviousPageType VirtualPath="~/pgCheckout.aspx" %>


        <asp:Content ID="ContentArea1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <asp:Label ID="Label1" runat="server" Text="Name:" Width="110px"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <br />
        <asp:Label ID="Label2" runat="server" Text="Address:" Width="110px"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblAddress" runat="server" Text="Label"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <br />
        <asp:Label ID="Label3" runat="server" Text="Card Type:" Width="110px"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblCCType" runat="server" Text="Label"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <br />
        <asp:Label ID="Label4" runat="server" Text="Card #:" Width="110px"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblCCNumber" runat="server" Text="Label"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit Order" OnClick="btnSubmit_Click" />   

           

        </asp:Content>



        <asp:Content ID="ContentArea2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">


       
    
            <asp:Label ID="lblFrom" runat="server" Text="From:" Width="110px"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtFrom" runat="server">benjaminwellman@yahoo.com</asp:TextBox>
            <br />
            <asp:Label ID="lblTo" runat="server" Text="To:" Width="110px"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtTo" runat="server">bookstore@gmail.com</asp:TextBox>
            <br />
            <asp:Label ID="lblSubject" runat="server" Text="Subject:" Width="110px"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtSubject" runat="server">Customer Feedback</asp:TextBox>
            <br />
            <asp:Label ID="lblMessage" runat="server" Text="Message:" Width="110px"></asp:Label>
            <br />
            <asp:TextBox ID="txtMessage" runat="server" Height="100px" TextMode="MultiLine" Width="247px">Thanks for the great service! </asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblPassword" runat="server" Text="Enter SMTP Account Password:"></asp:Label>
            <br />
            <asp:TextBox ID="txtPassword" runat="server">password</asp:TextBox>
            <br />
            <asp:Button ID="btnSendMail" runat="server" OnClick="btnSendMail_Click" Text="Send Email" />
            <br />


       
    
        </asp:Content>