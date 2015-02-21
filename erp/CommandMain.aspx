<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageForMain.master" AutoEventWireup="true" CodeFile="CommandMain.aspx.cs" Inherits="CommandMain" %>
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
                          <asp:TextBox runat="server" ID="tbSelectCommandById" CssClass="form-control" Placeholder="按合同号搜索"></asp:TextBox>
                          <span class="input-group-btn">
                            <button class="btn btn-default"><i class="fa fa-search"></i></button>
                          </span>
                     </div>
                </div>
                </td>
                <td>
                    <button type="button" class="btn btn-default ml80" data-toggle="modal" data-target=".bs-example-modal-lg"><i class="fa fa-plus"></i> 添加新订单</button>
                </td>
            </tr>
        </table>
         <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加新的订单</h4>
                  </div>
                  <div class="modal-body">
                       <table class="tbl-edit">
                           <tr>
                               <td><span style="color:red">*</span></td>
                               <td>公司名称:</td>
                               <td></td>
                               <td></td>
                           </tr>
                           <tr>
                               <td></td>
                               <td>公司号码:</td>
                               <td><asp:TextBox ID="tbNewPhoneNumber" runat="server"></asp:TextBox></td>
                           </tr>
                           <tr>
                               <td></td>
                               <td>公司传真:</td>
                               <td><asp:TextBox ID="tbNewFaxNumber" runat="server"></asp:TextBox></td>
                           </tr>
                           <tr>
                               <td></td>
                               <td>公司地址:</td>
                               <td><asp:TextBox ID="tbNewAddress" runat="server"></asp:TextBox></td>
                           </tr>
                       </table>
                  </div>
                  <div class="modal-footer">
                    <button type="button" id="btnCancel" class="btn btn-default" data-dismiss="modal">取消</button>
                    <asp:Button ID="btnNewEnterprise" runat="server" Text="保存" CssClass="btn btn-primary"  ValidationGroup="valajouterEnterprise"/>
                  </div>
                </div>
              </div>
        </div>
         <div style="margin-top:20px">
             <asp:GridView ID="gvcommand" runat="server" DataSourceID="odscommand" DataKeyNames="id_command" 
                AutoGenerateColumns="False" CssClass="gv" EmptyDataText="未找到任何订单信息" >
                  <HeaderStyle CssClass="GridViewHeader" />
                <Columns>
                     <asp:BoundField DataField="id_command" HeaderText="合同号" ReadOnly="True"/>
                     <asp:BoundField DataField="enterprise" HeaderText="客户名称" ReadOnly="True"/>
                     <asp:BoundField DataField="name_product" HeaderText="产品名称" ReadOnly="True"/>
                     <asp:BoundField DataField="date_pre_done" HeaderText="预计交货日期" ReadOnly="True" DataFormatString="{0:yyyy-MM-dd}"/>
                     <asp:BoundField DataField="status" HeaderText="进度" ReadOnly="True"/>
                     <asp:TemplateField ShowHeader="False">
                         <ItemTemplate>
                             <asp:ImageButton ID="ImgBtnDetailSelect" runat="server" CausesValidation="False" CommandName="Select" width="17px" ImageUrl="App_Themes/Images/icon_zoom.png" ToolTip="查看"></asp:ImageButton>
                              &nbsp;&nbsp;&nbsp;<asp:ImageButton ID="ImgBtnDetailEdit" runat="server" CausesValidation="False" CommandName="Edit" width="17px" ImageUrl="App_Themes/Images/icon_edit_16.png" ToolTip="修改"></asp:ImageButton>
                             &nbsp;&nbsp;&nbsp;<asp:ImageButton ID="ImgBtnDetailDelete" runat="server" CausesValidation="False" CommandName="Delete" width="14px" ImageUrl="App_Themes/Images/icon_delete_16.png"  ToolTip="删除" ></asp:ImageButton>
                            <asp:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" TargetControlID="ImgBtnDetailDelete" ConfirmText="确定删除此合同信息？">
                            </asp:ConfirmButtonExtender>
                     </ItemTemplate>     
                     </asp:TemplateField>
                </Columns>
             </asp:GridView>
         </div>
         <asp:ObjectDataSource ID="odscommand" runat="server"
            TypeName="erp.bll.command"
            SelectMethod="CommandSelectAll"
            DeleteMethod="CommandDeleteById">
        <SelectParameters>
                <asp:ControlParameter ControlID="tbSelectCommandById" Name="id_command" PropertyName="Text" Type="String" />
        </SelectParameters>
        <DeleteParameters>
                <asp:Parameter Name="id_command" Type="String" />
        </DeleteParameters>
  </asp:ObjectDataSource>
    </div>
</asp:Content>

