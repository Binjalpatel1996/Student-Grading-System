<%@ Page Title="" Language="C#" MasterPageFile="~/site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WADAssignment_4.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="div1" class="div-CSSclass">
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:c432019sp01patelb2ConnectionString %>" SelectCommand="SELECT password FROM Users WHERE username=@username;">
             <SelectParameters>
                 <asp:Parameter Name="username" />
             </SelectParameters>
         </asp:SqlDataSource>
         <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#33CC33"></asp:Label>&nbsp;
         <br />
         <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" >SignOut</asp:LinkButton>
         <br />
         <br />
       <br />
        <asp:Label ID="lblUsername" runat="server" Text="Username : "></asp:Label> 
       &nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        &nbsp;&nbsp;
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="Validation-CssClass" ErrorMessage="Required Field!!"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="lblPassword" runat="server" Text="Password : "></asp:Label>
        &nbsp;
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        &nbsp;&nbsp;
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" CssClass="Validation-CssClass" ErrorMessage="Required Field!!"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="SignIn" OnClick="Button1_Click" Height="34px" Width="97px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#CC9900" NavigateUrl="~/SignUp.aspx">Create a new account!!</asp:HyperLink>
        <br />
       <br />
   </div>
</asp:Content>
