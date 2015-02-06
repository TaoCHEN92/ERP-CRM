<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageForMain.master" AutoEventWireup="true" CodeFile="ClientMain.aspx.cs" Inherits="ClientMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="gvclient" runat="server" DataSourceID="odsclient" DataKeyNames="id">
        <Columns>
             <asp:BoundField DataField="id" HeaderText="客户编号" ReadOnly="True"/>
             <asp:TemplateField HeaderText="公司名称">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbEnterprise" runat="server" Text='<%# Bind("enterprise") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEnterprise" runat="server" Text='<%# Bind("enterprise") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
             <asp:TemplateField HeaderText="公司号码">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbPhoneNumber" runat="server" Text='<%# Bind("phone_number") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Bind("phone_number") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
             <asp:TemplateField HeaderText="公司地址">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbAddress" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="odsclient" runat="server"
            TypeName="erp.bll.client"
            SelectMethod="ClientSelectAll"  >
            <SelectParameters>
                <asp:Parameter Name="id" Type="String" />
            </SelectParameters>
  </asp:ObjectDataSource>
</asp:Content>

