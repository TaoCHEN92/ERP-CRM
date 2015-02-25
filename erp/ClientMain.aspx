<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageForMain.master" AutoEventWireup="true" CodeFile="ClientMain.aspx.cs" Inherits="ClientMain" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div style="margin-top:100px">
        <table>
            <tr>
                <td>
                <div style="width:250px">
                    <div class="input-group">
                          <asp:TextBox runat="server" ID="tbSelectClientByName" CssClass="form-control" Placeholder="按公司名搜索"></asp:TextBox>
                          <span class="input-group-btn">
                            <button class="btn btn-default"><i class="fa fa-search"></i></button>
                          </span>
                     </div>
                </div>
                </td>
                <td>
                    <button type="button" class="btn btn-default ml80" data-toggle="modal" data-target=".bs-example-modal-sm"><i class="fa fa-user-plus"></i> 添加新客户</button>
                </td>
            </tr>
        </table>
        <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width:450px">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加新的客户</h4>
                  </div>
                  <div class="modal-body">
                       <table class="tbl-edit">
                           <tr>
                               <td><span style="color:red">*</span></td>
                               <td>公司名称:</td>
                               <td><asp:TextBox ID="tbNewEnterprise" runat="server" CssClass="form-control"></asp:TextBox></td>
                               <td><asp:RequiredFieldValidator ID="rvtbNewEnterprise" runat="server" ValidationGroup="valajouterEnterprise" ControlToValidate="tbNewEnterprise" ErrorMessage="请输入公司名称" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                           </tr>
                           <tr>
                               <td></td>
                               <td>公司号码:</td>
                               <td><asp:TextBox ID="tbNewPhoneNumber" runat="server" CssClass="form-control"></asp:TextBox></td>
                           </tr>
                           <tr>
                               <td></td>
                               <td>公司传真:</td>
                               <td><asp:TextBox ID="tbNewFaxNumber" runat="server" CssClass="form-control"></asp:TextBox></td>
                           </tr>
                           <tr>
                               <td></td>
                               <td>公司地址:</td>
                               <td><asp:TextBox ID="tbNewAddress" runat="server" CssClass="form-control"></asp:TextBox></td>
                           </tr>
                       </table>
                  </div>
                  <div class="modal-footer">
                    <button id="btnCancel" class="btn btn-default" data-dismiss="modal" type="reset">取消</button>
                    <asp:Button ID="btnNewEnterprise" runat="server" Text="提交" CssClass="btn btn-primary"  ValidationGroup="valajouterEnterprise" OnClick="btnNewEnterprise_click"/>
                  </div>
                </div>
              </div>
            </div>
        <div style="margin-top:20px">
         <asp:GridView ID="gvclient" runat="server" DataSourceID="odsclient" DataKeyNames="id" 
            AutoGenerateColumns="False" CssClass="gv" EmptyDataText="未找到任何公司信息" >
              <HeaderStyle CssClass="GridViewHeader" />
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
                 <asp:TemplateField HeaderText="公司传真">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbFaxNumber" runat="server" Text='<%# Bind("fax_number") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFaxNumber" runat="server" Text='<%# Bind("fax_number") %>'></asp:Label>
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
                 <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                             <asp:ImageButton ID="ImgBtnDetailUpdate" runat="server" CausesValidation="True" CommandName="Update"  ImageUrl="App_Themes/Images/icon_ok_16.png" ToolTip="确定" ValidationGroup="grouprupdate"></asp:ImageButton>
                             &nbsp;&nbsp;&nbsp;<asp:ImageButton ID="ImgBtnDetailUpdateCancel" runat="server" CausesValidation="False" CommandName="Cancel"  ImageUrl="App_Themes/Images/icon_cancel_16.png" ToolTip="取消"></asp:ImageButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                             <asp:ImageButton ID="ImgBtnDetailEdit" runat="server" CausesValidation="False" CommandName="Edit" width="17px" ImageUrl="App_Themes/Images/icon_edit_16.png" ToolTip="修改"></asp:ImageButton>
                             &nbsp;&nbsp;&nbsp;<asp:ImageButton ID="ImgBtnDetailDelete" runat="server" CausesValidation="False" CommandName="Delete" width="14px" ImageUrl="App_Themes/Images/icon_delete_16.png"  ToolTip="删除" ></asp:ImageButton>
                            <asp:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" TargetControlID="ImgBtnDetailDelete" ConfirmText="确定删除此用户信息？">
                 </asp:ConfirmButtonExtender>
                          </ItemTemplate>     
                    </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </div>
    </div>
    <asp:ObjectDataSource ID="odsclient" runat="server"
            TypeName="erp.bll.client"
            SelectMethod="ClientSelectAll"
            UpdateMethod="ClientUpdateById"
            DeleteMethod="ClientDeleteById">
        <SelectParameters>
                <asp:ControlParameter ControlID="tbSelectClientByName" Name="enterprise" PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
                <asp:Parameter Name="id" Type="String" />
                <asp:Parameter Name="enterprise" Type="String" />
                <asp:Parameter Name="phone_number" Type="String" />
                <asp:Parameter Name="fax_number" Type="String" />
                <asp:Parameter Name="address" Type="String" />
        </UpdateParameters>
        <DeleteParameters>
                <asp:Parameter Name="id" Type="String" />
        </DeleteParameters>
  </asp:ObjectDataSource>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.modal').on('hidden.bs.modal', function () {
                $('#<%= tbNewEnterprise.ClientID %>').val('');
                $('#<%= tbNewPhoneNumber.ClientID %>').val('');
                $('#<%= tbNewFaxNumber.ClientID %>').val('');
                $('#<%= tbNewAddress.ClientID %>').val('');
            });
        });
    </script>
</asp:Content>

