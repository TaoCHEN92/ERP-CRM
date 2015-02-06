<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder_signin" >

     <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false" OnAuthenticate="LoginUser_OnAuthenticate">
        <LayoutTemplate>
            <div class="form-signin" role="form">
                    <div>
                        <h1>金利达 <span style="font-size:14px">因为专一，所以专业</span></h1>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="UserName" runat="server" AutoCompleteType="None" placeholder="用户名" CssClass="form-control input-lg textEntry ltr-dir"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="Password" runat="server" placeholder="密码" CssClass="form-control input-lg passwordEntry  ltr-dir" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="btn-wrapper text-center">
                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="btn btn-primary btn-block btn-lg" Text="登录" OnClientClick="return ValidateLogin();" />
                    </div>
            </div>
        </LayoutTemplate>
    </asp:Login>
</asp:Content>

