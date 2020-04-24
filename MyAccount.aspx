<%@ Page Title="" Language="C#" MasterPageFile="~/site1.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="WADAssignment_4.MyAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div-CSSclass">


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:c432019sp01patelb2ConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>


        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Click here to see your Personal Information!" Height="34px" Width="360px" />


        <br />
        <br />
        <div id="div1" class="div-CSSclass">
            <center>
        <table>
            <tr>
                <td>Username : </td>
                <td><asp:TextBox ID="txtuserAccount" runat="server" Width="223px"></asp:TextBox></td>
                <td>Password : </td>
                <td><asp:TextBox ID="txtpasswordAccount" runat="server"></asp:TextBox></td>
           </tr>
            <tr>
                <td>
                    Firstname : </td>
                <td><asp:TextBox ID="txtfirstnameAccount" runat="server"></asp:TextBox></td>
                
                <td>
                    Lastname : </td>
                    <td> <asp:TextBox ID="txtlastnameAccount" runat="server"></asp:TextBox>
                </td>
                               
            </tr>
            <tr>
                <td>Address : </td>
                <td>
                   <asp:TextBox ID="txtAddressAccount" runat="server"></asp:TextBox></td>
                <td>Phone:</td>
                <td>
                    <asp:TextBox ID="txtphoneAccount" runat="server"></asp:TextBox>
                </td>
                <td>Date of Birth</td>
                <td>
                   <asp:TextBox ID="txtdobAccount" runat="server"></asp:TextBox></td>
            </tr>
                       
        </table>
                </center>
            <br />
            <asp:Button ID="Button2" runat="server" Height="32px" OnClick="Button2_Click" Text="Click here to confirm!" Width="230px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" Height="32px" OnClick="Button3_Click" Text="Click here change your information!" Width="277px" />
&nbsp;<asp:Label ID="Label1" runat="server" ForeColor="Green"></asp:Label>
        </div>
&nbsp;<br />


    </div>
</asp:Content>
