<%@ Page Title="" Language="C#" MasterPageFile="~/site1.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WADAssignment_4.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            display: inline-block;
            color: gray;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="div-CSSclass">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:c432019sp01patelb2ConnectionString %>" >
    </asp:SqlDataSource>
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <br />
        <asp:Label ID="lblusername" runat="server" Text="Username :" CssClass="sidelabel"></asp:Label>&nbsp;
    <asp:TextBox ID="txtusernameregister" runat="server" CssClass="rightcontrol"></asp:TextBox>
    &nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtusernameregister" CssClass="Validation-CssClass" Display="Static" ErrorMessage="Required Field!!"></asp:RequiredFieldValidator>
    &nbsp;<br />
    <br />
        <asp:Label ID="lbl5" runat="server" Text="Password : " CssClass="sidelabel"></asp:Label>&nbsp;
    <asp:TextBox ID="txtpasswordregister" runat="server" CssClass="rightcontrol" ></asp:TextBox>
    &nbsp;
    
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtpasswordregister" CssClass="Validation-CssClass" Display="Static" ErrorMessage="Required Field!!"></asp:RequiredFieldValidator>
    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtpasswordregister" CssClass="Validation-CssClass" Display="Dynamic" ErrorMessage=" password must be 8 character and should have 1 alphabet in uppercase, 1 digit, 1 special character!!" ValidationExpression="^(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,30}$"></asp:RegularExpressionValidator>
    <br />
    <br />
        <asp:Label ID="Label4" runat="server" Text="Lastname :" CssClass="sidelabel"></asp:Label>&nbsp;&nbsp;
    <asp:TextBox ID="txtlastname" runat="server" CssClass="rightcontrol"></asp:TextBox>
    &nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtlastname" CssClass="Validation-CssClass" ErrorMessage="Required Field!!"></asp:RequiredFieldValidator>
    <br />
    <br />
        <asp:Label ID="Label5" runat="server" Text="Firstname :" CssClass="sidelabel"></asp:Label>&nbsp;
    <asp:TextBox ID="txtfirstname" runat="server" CssClass="rightcontrol"></asp:TextBox>
    &nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtfirstname" CssClass="Validation-CssClass" ErrorMessage="Required Field!!"></asp:RequiredFieldValidator>
    <br />
    <br />   
   
        <asp:Label ID="Label6" runat="server" Text="Address :" Width="89px"></asp:Label>&nbsp;&nbsp;
    <asp:TextBox ID="txtAddress" runat="server" CssClass="rightcontrol" ></asp:TextBox>
    <br />
    <br />
        <asp:Label ID="Label7" runat="server" Text=" Date of Birth :" CssClass="sidelabel"></asp:Label>
    <asp:TextBox ID="txtDob" runat="server" TextMode="Date" CssClass="rightcontrol"></asp:TextBox>
    &nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Yellow" Text="MM/DD/YYYY"></asp:Label>
    <br />
    <br />
        <asp:Label ID="Label8" runat="server" Text="Phone :" CssClass="sidelabel"></asp:Label>&nbsp;
    <asp:TextBox ID="txtphone" runat="server" CssClass="rightcontrol"></asp:TextBox>
    &nbsp;
    
        <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Yellow" Text="10 digit!"></asp:Label>
    
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
    &nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblErrorMsg" runat="server" Text=""></asp:Label>
    <br />


</div>


</asp:Content>
