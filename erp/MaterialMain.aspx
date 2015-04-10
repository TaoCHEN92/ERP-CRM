<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageForMain.master" AutoEventWireup="true" CodeFile="MaterialMain.aspx.cs" Inherits="MaterialMain" %>
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
                          <asp:TextBox runat="server" ID="tbSelectMaterialByName" CssClass="form-control" Placeholder="按原料名搜索"></asp:TextBox>
                          <span class="input-group-btn">
                            <button class="btn btn-default"><i class="fa fa-search"></i></button>
                          </span>
                     </div>
                </div>
                </td>
                <td>
                    <button type="button" class="btn btn-default ml80" data-toggle="modal" data-target=".bs-example-modal-sm"><i class="fa fa-plus"></i> 添加新原料</button>
                </td>
            </tr>
        </table>
        <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width:550px">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加新的原材料</h4>
                  </div>
                  <div class="modal-body">
                       <table class="tbl-edit">
                           <tr>
                               <td><span style="color:red">*</span></td>
                               <td>原料名称:</td>
                               <td><asp:TextBox ID="tbNewMaterial" runat="server" CssClass="form-control"></asp:TextBox></td>
                               <td><asp:RequiredFieldValidator ID="rvtbNewCommand" runat="server" ValidationGroup="valajouterMaterial" ControlToValidate="tbNewMaterial" ErrorMessage="请输入原料名称" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                           </tr>
                           <tr>
                               <td><span style="color:red">*</span></td>
                               <td>原料类型:</td>
                               <td><asp:DropDownList ID="ddlTypeNewMaterial" runat="server" CssClass="form-control">
                                   <asp:ListItem Selected="true" Text="铜版纸" />
                                   <asp:ListItem Selected="true" Text="双胶纸" />
                                    <asp:ListItem  Text="袋子" />
                                   </asp:DropDownList></td>
                           </tr>
                           <tr>
                               <td><span style="color:red">*</span></td>
                               <td>单位:</td>
                               <td><asp:DropDownList ID="ddlUnitNewMaterial" runat="server" CssClass="form-control">
                                    <asp:ListItem Selected="true" Text="张" />
                                    <asp:ListItem  Text="件" />
                                    <asp:ListItem  Text="个" />
                                   </asp:DropDownList></td>
                           </tr>
                           <tr>
                               <td></td>
                               <td>供应商:</td>
                               <td><asp:TextBox ID="tbNewMaterialSupplier" runat="server" CssClass="form-control"></asp:TextBox></td>
                           </tr>
                           <tr>
                               <td><span style="color:red">*</span></td>
                               <td>初始库存:</td>
                               <td><asp:TextBox ID="tbNewMaterilStock" runat="server" CssClass="form-control"></asp:TextBox></td>
                               <td><asp:RequiredFieldValidator ID="rvtbewMaterilStock" runat="server" ValidationGroup="valajouterMaterial" ControlToValidate="tbNewMaterilStock" ErrorMessage="请设置初始库存量" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator id="RegularExpressionValidator1"  runat="server"
                                     ControlToValidate="tbNewMaterilStock"
                                     ValidationExpression="^\+?[1-9][0-9]*$" ForeColor="Red"
                                     ErrorMessage="请输入正整数" ValidationGroup="valajouterMaterial"></asp:RegularExpressionValidator>
                                    </td>
                           </tr>
                       </table>
                  </div>
                  <div class="modal-footer">
                    <button type="button" id="btnCancel" class="btn btn-default" data-dismiss="modal">取消</button>
                    <asp:Button ID="btnNewMaterial" runat="server" Text="提交" CssClass="btn btn-primary"  ValidationGroup="valajouterMaterial" OnClick="btnNewMaterial_click"/>
                  </div>
                </div>
              </div>
            </div>
        <div style="margin-top:20px">
             <asp:GridView ID="gvmaterial" runat="server" DataSourceID="odsmaterial" DataKeyNames="id" 
                AutoGenerateColumns="False" CssClass="gv" EmptyDataText="未找到任何原料信息" >
                  <HeaderStyle CssClass="GridViewHeader" />
                 <Columns>
                     <asp:BoundField DataField="id" HeaderText="原料编号" ReadOnly="True"/>
                     <asp:TemplateField HeaderText="原料名称">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbMaterialName" runat="server" Text='<%# Bind("material_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblMaterialName" runat="server" Text='<%# Bind("material_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="原料种类">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlMaterialType" runat="server" Text='<%# Bind("type") %>'>
                                 <asp:ListItem Selected="true" Text="铜版纸" />
                                    <asp:ListItem  Text="袋子" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblMaterialType" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="计量单位">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlMaterialUnit" runat="server" Text='<%# Bind("unit") %>'>
                                 <asp:ListItem Selected="true" Text="张" />
                                 <asp:ListItem  Text="件" />
                                 <asp:ListItem  Text="个" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblMaterialUnit" runat="server" Text='<%# Bind("unit") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="供应商">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbMaterialSupplier" runat="server" Text='<%# Bind("supplier") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblMaterialSupplier" runat="server" Text='<%# Bind("supplier") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="剩余库存量">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbMaterialStock" runat="server" Text='<%# Bind("stock") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator id="RegularExpressionValidator2"  runat="server"
                                     ControlToValidate="tbMaterialStock"
                                     ValidationExpression="^\+?[1-9][0-9]*$" ForeColor="Red"
                                     ErrorMessage="请输入正整数" ValidationGroup="groupupdate"></asp:RegularExpressionValidator>
                                    </td>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblMaterialStock" runat="server" Text='<%# Bind("stock") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                             <asp:ImageButton ID="ImgBtnDetailUpdate" runat="server" CausesValidation="True" CommandName="Update"  ImageUrl="App_Themes/Images/icon_ok_16.png" ToolTip="确定" ValidationGroup="groupupdate"></asp:ImageButton>
                             &nbsp;&nbsp;&nbsp;<asp:ImageButton ID="ImgBtnDetailUpdateCancel" runat="server" CausesValidation="False" CommandName="Cancel"  ImageUrl="App_Themes/Images/icon_cancel_16.png" ToolTip="取消"></asp:ImageButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                             <asp:ImageButton ID="ImgBtnDetailEdit" runat="server" CausesValidation="False" CommandName="Edit" width="17px" ImageUrl="App_Themes/Images/icon_edit_16.png" ToolTip="修改"></asp:ImageButton>
                             &nbsp;&nbsp;&nbsp;<asp:ImageButton ID="ImgBtnDetailDelete" runat="server" CausesValidation="False" CommandName="Delete" width="14px" ImageUrl="App_Themes/Images/icon_delete_16.png"  ToolTip="删除" ></asp:ImageButton>
                            <asp:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" TargetControlID="ImgBtnDetailDelete" ConfirmText="确定删除此原料信息？">
                 </asp:ConfirmButtonExtender>
                          </ItemTemplate>     
                    </asp:TemplateField>
                 </Columns>
             </asp:GridView>
            <asp:ObjectDataSource ID="odsmaterial" runat="server"
                TypeName="erp.bll.material"
                SelectMethod="MaterialSelectAll"
                UpdateMethod="MaterialUpdateById"
                DeleteMethod="MaterialDeleteById">
                <SelectParameters>
                        <asp:ControlParameter ControlID="tbSelectMaterialByName" Name="material_name" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                        <asp:Parameter Name="id" Type="String" />
                        <asp:Parameter Name="material_name" Type="String" />
                        <asp:Parameter Name="type" Type="String" />
                        <asp:Parameter Name="unit" Type="String" />
                        <asp:Parameter Name="stock" Type="String" />
                        <asp:Parameter Name="supplier" Type="String" />
                </UpdateParameters>
                <DeleteParameters>
                        <asp:Parameter Name="id" Type="String" />
                </DeleteParameters>
            </asp:ObjectDataSource>
         </div>
      </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.modal').on('hidden.bs.modal', function () {
                $('#<%= tbNewMaterial.ClientID %>').val('');
                $('#<%= tbNewMaterialSupplier.ClientID %>').val('');
                $('#<%= tbNewMaterilStock.ClientID %>').val('');
            });
         });
    </script>
</asp:Content>

