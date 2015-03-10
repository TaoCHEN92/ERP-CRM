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
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加新的订单</h4>
                  </div>
                  <div class="modal-body">
                       <table class="tbl-edit">
                           <tr><td><div style="font-size: 18px;color: rgb(23, 168, 187);">订单信息</div></td></tr>
                           <tr>
                               <td><span style="color:red;float:right">*</span></td>
                               <td>合同号:</td>
                               <td><asp:TextBox ID="tbIdCommand" runat="server" cssClass="form-control"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="rvtbNewIdCommand" runat="server" ValidationGroup="valajouterCommand" ControlToValidate="tbIdCommand" ErrorMessage="" ForeColor="Red"></asp:RequiredFieldValidator>
                               </td>
                               <td>返单号:</td>
                               <td><asp:TextBox ID="tbIdCommand_last" runat="server" cssClass="form-control"></asp:TextBox></td>
                           </tr>
                           <tr>
                               <td><span style="color:red;float:right">*</span></td>
                               <td>客户名称:</td>
                               <td><asp:DropDownList ID="ddlNameClient" runat="server" CssClass="form-control" DataSourceID="odsNameClient" DataTextField="enterprise" DataValueField="id"></asp:DropDownList></td>
                                    <asp:ObjectDataSource ID="odsNameClient" runat="server" SelectMethod="ClientSelectAll" TypeName="erp.bll.client" >
                                        <SelectParameters>
                                            <asp:Parameter Name="enterprise" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                              <td>产品名称:</td>
                              <td><asp:TextBox ID="tbNameProduct" runat="server" cssClass="form-control"></asp:TextBox></td>
                           </tr>
                           <tr>
                               <td></td>
                               <td>规格:</td>
                               <td><asp:TextBox ID="tbFormat" runat="server" cssClass="form-control"></asp:TextBox></td>
                               <td>单位:</td>
                               <td><asp:DropDownList ID="ddlUnit" runat="server" cssClass="form-control">
                                  <asp:ListItem Selected="true" Text="本" />
                                   </asp:DropDownList></td>
                           </tr>
                           <tr>
                               <td><span style="color:red;float:right">*</span></td>
                               <td>数量:</td>
                               <td><asp:TextBox ID="tbQuantity" runat="server" cssClass="form-control"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="rvtbNewQuantity" runat="server" ValidationGroup="valajouterCommand" ControlToValidate="tbQuantity" ErrorMessage="" ForeColor="Red"></asp:RequiredFieldValidator>
                               </td>
                                <td><span style="color:red">*</span>单价:</td>
                                <td><asp:TextBox ID="tbPriceUnit" runat="server" cssClass="form-control"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="rvtbNewPriceUnit" runat="server" ValidationGroup="valajouterCommand" ControlToValidate="tbPriceUnit" ErrorMessage="" ForeColor="Red"></asp:RequiredFieldValidator>
                               </td>
                           </tr>
                           <tr>
                               <td><span style="color:red;float:right">*</span></td>
                               <td>交货时间:</td>
                               <td>
                                   <div class="input-group date" style="border-spacing:0px">
                                       <asp:TextBox ID="tbDatePreDone" runat="server" cssClass="form-control"></asp:TextBox>
                                       <span class="input-group-addon">
                                           <i class="fa fa-calendar"></i>
                                       </span>
                                       <asp:RequiredFieldValidator ID="rvtbNewDatePreDone" runat="server" ValidationGroup="valajouterCommand" ControlToValidate="tbDatePreDone" ErrorMessage="" ForeColor="Red"></asp:RequiredFieldValidator>
                                   </div>
                               </td>
                               <td></td>
                               <td>  <asp:RegularExpressionValidator id="RegularExpressionValidator2"  runat="server"
                                     ControlToValidate="tbQuantity"
                                     ValidationExpression="^\+?[1-9][0-9]*$" ForeColor="Red"
                                     ErrorMessage="数量需为正整数" ValidationGroup="valajouterCommand">
                                     </asp:RegularExpressionValidator><asp:RegularExpressionValidator id="RegularExpressionValidator1"  runat="server"
                                     ControlToValidate="tbPriceUnit"
                                     ValidationExpression="^[0-9].*$" ForeColor="Red"
                                     ErrorMessage="单价需为正数" ValidationGroup="valajouterCommand"></asp:RegularExpressionValidator>
                                   
                                    </td>
                           </tr>
                           <tr><td><div style="font-size: 18px;color: rgb(23, 168, 187);">原料信息</div></td></tr>
                           <tr id="tr_material_1">
                               <td></td>
                               <td>材料1:</td>
                               <td><asp:DropDownList ID="ddlMaterial_1" runat="server" cssClass="form-control" DataSourceID="odsMaterial" DataTextField="material_name" DataValueField="id"></asp:DropDownList></td>
                               <td>使用数量:</td>
                               <td><asp:TextBox ID="tbQuantityMaterial_1" runat="server" cssClass="form-control"></asp:TextBox></td>
                               <td><a class="addMaterial"><i class="fa fa-plus-circle fa-2x"></i></a>
                               </td>
                               <td> <asp:RegularExpressionValidator id="RegularExpressionValidator3"  runat="server"
                                     ControlToValidate="tbQuantityMaterial_1"
                                     ValidationExpression="^\+?[1-9][0-9]*$" ForeColor="Red"
                                     ErrorMessage="数量需为正整数" ValidationGroup="valajouterCommand"></asp:RegularExpressionValidator>
                               </td>
                           </tr>
                           <tr id="tr_material_2" style="display:none">
                               <td></td>
                               <td>材料2:</td>
                               <td><asp:DropDownList ID="ddlMaterial_2" runat="server" cssClass="form-control" DataSourceID="odsMaterial"  DataTextField="material_name" DataValueField="id"></asp:DropDownList></td>
                               <td>使用数量:</td>
                               <td><asp:TextBox ID="tbQuantityMaterial_2" runat="server" cssClass="form-control"></asp:TextBox></td>
                               <td>
                                   <a class="addMaterial"><i class="fa fa-plus-circle fa-2x"></i></a>
                                   <a class="deleteMaterial"><i class="fa fa-times-circle fa-2x"></i></a>
                               </td>
                               <td> <asp:RegularExpressionValidator id="RegularExpressionValidator4"  runat="server"
                                     ControlToValidate="tbQuantityMaterial_2"
                                     ValidationExpression="^\+?[1-9][0-9]*$" ForeColor="Red"
                                     ErrorMessage="数量需为正整数" ValidationGroup="valajouterCommand"></asp:RegularExpressionValidator>
                               </td>
                           </tr>
                           <tr id="tr_material_3" style="display:none">
                               <td></td>
                               <td>材料3:</td>
                               <td><asp:DropDownList ID="ddlMaterial_3" runat="server" cssClass="form-control"  DataSourceID="odsMaterial"  DataTextField="material_name" DataValueField="id"></asp:DropDownList></td>
                               <td>使用数量:</td>
                               <td><asp:TextBox ID="tbQuantityMaterial_3" runat="server" cssClass="form-control"></asp:TextBox></td>
                               <td>
                                   <a class="addMaterial"><i class="fa fa-plus-circle fa-2x"></i></a>
                                   <a class="deleteMaterial"><i class="fa fa-times-circle fa-2x"></i></a>
                               </td>
                               <td> <asp:RegularExpressionValidator id="RegularExpressionValidator5"  runat="server"
                                     ControlToValidate="tbQuantityMaterial_3"
                                     ValidationExpression="^\+?[1-9][0-9]*$" ForeColor="Red"
                                     ErrorMessage="数量需为正整数" ValidationGroup="valajouterCommand"></asp:RegularExpressionValidator>
                               </td>
                           </tr>
                           <tr id="tr_material_4" style="display:none">
                               <td></td>
                               <td>材料4:</td>
                               <td><asp:DropDownList ID="ddlMaterial_4" runat="server" cssClass="form-control"  DataSourceID="odsMaterial"  DataTextField="material_name" DataValueField="id"></asp:DropDownList></td>
                               <td>使用数量:</td>
                               <td><asp:TextBox ID="tbQuantityMaterial_4" runat="server" cssClass="form-control"></asp:TextBox></td>
                               <td>
                                   <a class="addMaterial"><i class="fa fa-plus-circle fa-2x"></i></a>
                                   <a class="deleteMaterial"><i class="fa fa-times-circle fa-2x"></i></a>
                               </td>
                                <td> <asp:RegularExpressionValidator id="RegularExpressionValidator6"  runat="server"
                                     ControlToValidate="tbQuantityMaterial_4"
                                     ValidationExpression="^\+?[1-9][0-9]*$" ForeColor="Red"
                                     ErrorMessage="数量需为正整数" ValidationGroup="valajouterCommand"></asp:RegularExpressionValidator>
                               </td>
                           </tr>
                           <asp:ObjectDataSource ID="odsMaterial" runat="server" SelectMethod="MaterialSelectAll" TypeName="erp.bll.material" >
                                        <SelectParameters>
                                            <asp:Parameter Name="material_name" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>              
                           <tr>
                               <td></td>
                               <td>备注:</td>
                               <td><textarea id="txaRemark" runat="server" cols="20" rows="3" class="form-control"></textarea></td>
                               <td></td>
                               <td></td>
                           </tr>
                       </table>
                  </div>
                  <div class="modal-footer">
                    <button type="button" id="btnCancel" class="btn btn-default" data-dismiss="modal">取消</button>
                    <asp:Button ID="btnNewCommand" runat="server" Text="提交" CssClass="btn btn-primary"  ValidationGroup="valajouterCommand" OnClick="btnNewCommand_click"/>
                  </div>
                </div>
            </div>
        </div>
         <div style="margin-top:20px">
             <asp:GridView ID="gvcommand" runat="server" DataSourceID="odscommand_gv" DataKeyNames="id_command" 
                AutoGenerateColumns="False" CssClass="gv" EmptyDataText="未找到任何订单信息" AllowPaging="True" OnSelectedIndexChanged="gvcommand_SelectedIndexChanged" OnRowDataBound="gvcommand_RowDataBound">
                  <HeaderStyle CssClass="GridViewHeader" />
                <Columns>
                     <asp:BoundField DataField="id_command" HeaderText="合同号" ReadOnly="True"/>
                     <asp:BoundField DataField="status" HeaderText="进度" ReadOnly="True"/>
                     <asp:BoundField DataField="enterprise" HeaderText="客户名称" ReadOnly="True"/>
                     <asp:BoundField DataField="name_product" HeaderText="产品名称" ReadOnly="True"/>
                     <asp:BoundField DataField="date_pre_done" HeaderText="预计交货日期" ReadOnly="True" DataFormatString="{0:yyyy-MM-dd}"/>
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
         <div style="margin-top:20px">
             <asp:FormView ID="fvcommand" runat="server" DefaultMode="ReadOnly"  DataSourceID="odscommand_fv" Visible="false" BorderStyle="Dashed">
        <rowstyle backcolor="White"
          wrap="false"/>
        <pagerstyle backcolor="CornFlowerBlue"/>
                 <ItemTemplate>
                     <table class="tbl-edit">
                           <tr><td><div style="font-size: 18px;color: rgb(23, 168, 187);">订单信息</div></td></tr>
                           <tr>
                               <td style="font-weight:bold">合同号:</td>
                               <td><asp:Label ID="fv_lblIdCommand" runat="server"  Text='<%# Bind("id_command") %>'></asp:Label>
                               </td>
                           </tr>
                            <tr> 
                             <td style="font-weight:bold">返单号:</td>
                             <td><asp:Label ID="fv_lblIdCommand_last" runat="server"  Text='<%# Bind("id_command_last") %>'></asp:Label></td></tr>
                            <tr>
                               <td style="font-weight:bold">状态:</td>
                               <td>
                                   <asp:Label ID="fv_lblStatus" runat="server"  Text='<%# Bind("status") %>'></asp:Label>
                               </td>
                           </tr>
                           <tr>
                               <td style="font-weight:bold">客户名称:</td>
                               <td><asp:Label ID="fv_lblNameClient" runat="server"  Text='<%# Bind("enterprise") %>'></asp:Label></td>
                           </tr>
                           <tr>
                              <td style="font-weight:bold">产品名称:</td>
                              <td><asp:Label ID="fv_lblNameProduct" runat="server"  Text='<%# Bind("name_product") %>'></asp:Label></td>
                           </tr>
                           <tr>
                               <td style="font-weight:bold">规格:</td>
                               <td><asp:Label ID="fv_lblFormat" runat="server"  Text='<%# Bind("format") %>'></asp:Label></td>
                           </tr>
                           <tr>
                               <td style="font-weight:bold">单位:</td>
                               <td><asp:Label ID="fv_lblUnit" runat="server"  Text='<%# Bind("unit") %>'></asp:Label></td>
                           </tr>
                           <tr>
                              
                               <td style="font-weight:bold">数量:</td>
                               <td><asp:Label ID="fv_lblQuantity" runat="server"  Text='<%# Bind("quantity") %>'></asp:Label>
                               </td>
                           </tr>
                           <tr>
                                <td style="font-weight:bold">单价:</td>
                                <td><asp:Label ID="fv_lblPriceUnit" runat="server"  Text='<%# Bind("price_unit") %>'></asp:Label>
                               </td>
                           </tr>
                          <tr>
                               <td style="font-weight:bold">下单时间:</td>
                               <td>
                                   <asp:Label ID="fv_lblDateBegin" runat="server"  Text='<%# Bind("date_begin") %>'></asp:Label>
                               </td>
                           </tr>
                           <tr>
                               <td style="font-weight:bold">预计交货时间:</td>
                               <td>
                                   <asp:Label ID="fv_lblDatePreDone" runat="server"  Text='<%# Eval("date_pre_done" ,"{0:d}") %>'></asp:Label>
                               </td>
                           </tr>
                           <tr>
                               <td style="font-weight:bold">完工时间:</td>
                               <td>
                                   <asp:Label ID="fv_lblDateDone" runat="server"  Text='<%# Bind("date_done") %>' Visible='<%# Eval("status").ToString()=="已完成"? Boolean.Parse("True"):Boolean.Parse("False") %>'></asp:Label>
                               </td>
                           </tr>
                           <tr>
                               <td style="font-weight:bold">发货时间:</td>
                               <td>
                                   <asp:Label ID="Label1" runat="server"  Text='<%# Bind("date_delivery") %>' Visible='<%# Eval("status").ToString()=="已发货"? Boolean.Parse("True"):Boolean.Parse("False") %>'></asp:Label>
                               </td>
                           </tr>
                           <tr>
                               <td style="font-weight:bold">付款时间:</td>
                               <td>
                                   <asp:Label ID="Label2" runat="server"  Text='<%# Bind("date_pay") %>' Visible='<%# Eval("status").ToString()=="已付款"? Boolean.Parse("True"):Boolean.Parse("False") %>'></asp:Label>
                               </td>
                           </tr>
                           <tr><td><div style="font-size: 18px;color: rgb(23, 168, 187);">原料信息</div></td></tr>
                          <tr><td>
                              <asp:GridView ID="gvcommand_used" runat="server">
                                  <columns>
                                      <asp:TemplateField HeaderText="原料名称">
                                            <EditItemTemplate>
                                                <asp:DropdownList ID="ddlMaterial" runat="server" Text='<%# Bind("id_material") %>'></asp:DropdownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblMaterial" runat="server" Text='<%# Bind("material_name") %>'></asp:Label>
                                            </ItemTemplate>
                                      </asp:TemplateField>
                                       <asp:TemplateField HeaderText="使用数量">
                                            <EditItemTemplate>
                                                <asp:Textbox ID="tbQuantity" runat="server" Text='<%# Bind("quantity") %>'></asp:Textbox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblQuantity" runat="server" Text='<%# Bind("quantity") %>'></asp:Label>
                                            </ItemTemplate>
                                      </asp:TemplateField>
                                  </columns>
                              </asp:GridView>
                          </td></tr>
                           <asp:ObjectDataSource ID="odsMaterial" runat="server" SelectMethod="MaterialSelectAll" TypeName="erp.bll.material" >
                                        <SelectParameters>
                                            <asp:Parameter Name="material_name" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>              
                           <tr>
                               <td style="font-weight:bold">备注:</td>
                               <td><asp:Label id="fv_lblRemark" runat="server" ></asp:Label></td>
                           </tr>
                       </table>
                 </ItemTemplate>
                 <EditItemTemplate></EditItemTemplate>
             </asp:FormView>
         </div>
         <asp:ObjectDataSource ID="odscommand_gv" runat="server"
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
         <asp:ObjectDataSource ID="odscommand_fv" runat="server"
             TypeName="erp.bll.command"
             SelectMethod="CommandSelectById"
             UpdateMethod="CommandUpdateById">
           <SelectParameters>
               <asp:Parameter Name="id_command" Type="String" />
           </SelectParameters>
           <UpdateParameters>
               <asp:Parameter Name="id_command" Type="String" />
               <asp:Parameter Name="id_command_last" Type="String" />
               <asp:Parameter Name="id_cilent" Type="String" />
               <asp:Parameter Name="name_product" Type="String" />
               <asp:Parameter Name="date_pre_done" Type="String" />
               <asp:Parameter Name="date_begin" Type="String" />
               <asp:Parameter Name="format" Type="String" />
               <asp:Parameter Name="quantity" Type="String" />
               <asp:Parameter Name="price_unit" Type="String" />
               <asp:Parameter Name="unit" Type="String" />
               <asp:Parameter Name="date_done" Type="String" />
               <asp:Parameter Name="date_delivery" Type="String" />
               <asp:Parameter Name="date_pay" Type="String" />
               <asp:Parameter Name="remark" Type="String" />
               <asp:Parameter Name="Is_Done" Type="String" />
               <asp:Parameter Name="Is_Sent" Type="String" />
               <asp:Parameter Name="Is_Paid" Type="String" />
           </UpdateParameters>
         </asp:ObjectDataSource>
         <script>
            $(function () {
                $('#<%= tbDatePreDone.ClientID %>').datetimepicker({
                    pickTime: false,
                    format:'YYYY-MM-DD',
                     language: 'zh'
                });
             });
        </script>
         <script type="text/javascript">
             $(document).ready(function () { 
                 $("a.addMaterial").click(function () {
                     var cur_tr_id = $($(this).parent("td")).parent("tr").attr('id');
                     var index = cur_tr_id.substring(12, 13);
                     index ++;
                     var next_tr_id = "tr_material_" + index;
                     $('#' + next_tr_id).toggle();
                     $(this).hide();
                 });

                 $("a.deleteMaterial").click(function () {
                     var cur_tr_id = $($(this).parent("td")).parent("tr").attr('id');
                     var index = cur_tr_id.substring(12, 13);
                     var tb_name = "tbQuantityMaterial_" + index;
                     $('[id*= ' + tb_name + ']').val('');
                     var tr_id = "tr_material_" + index;
                     if (index != 1)
                     {
                         index--;
                         var last_tr_id = "tr_material_" + index;
                         $('#' + last_tr_id).find("a.addMaterial").show();
                     }
                     $('#' + tr_id).hide();
                 });
             });
    </script>
    </div>
   
</asp:Content>

