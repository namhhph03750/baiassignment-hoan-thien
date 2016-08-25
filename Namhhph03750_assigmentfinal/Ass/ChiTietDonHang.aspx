<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChiTietDonHang.aspx.cs" Inherits="ChiTietDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">
    <div class="checkout-outer">
						<div class="checkout-header">
							<a href="#" class="invarseColor pull-right" data-tip="tooltip" data-placment="top" data-title="EDIT" style="margin-right:12px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>
							<h4><i class="icon-caret-down"></i> Chi tiết đơn hàng</h4>
						</div><!--end checkout-header-->

						<div class="checkout-content">
							<table style="width:90%;" align="center">
								<tr>
									<td style="width:20%">Người nhận hàng:</td>
									<td><asp:Literal ID="ltlRecipient" runat="server" /></td>
								</tr>
								<tr>
									<td style="width:20%">Địa chỉ:</td>
									<td><asp:Literal ID="ltlAdd" runat="server" /></td>
								</tr>
                                <tr>
									<td style="width:20%">Số điện thoại:</td>
									<td><asp:Literal ID="ltlPhone" runat="server" /></td>
								</tr>
                                <tr>
									<td style="width:20%">Hình thức thanh toán:</td>
									<td><asp:Literal ID="ltlMethod" runat="server" /></td>
								</tr>
                                <asp:Literal ID="ltlMethodBank" runat="server" Visible="False" />
                                <tr>
									<td style="width:20%">Ghi chú:</td>
									<td><asp:Literal ID="ltlNote" runat="server" /></td>
								</tr>
                                <tr>
									<td style="width:20%">Trạng thái:</td>
									<td><asp:Literal ID="ltlStatus" runat="server" /></td>
								</tr>
                                <tr>
									<td colspan="2">
                                    
                                        <asp:GridView ID="GridView1" Width="100%" HorizontalAlign="Center" runat="server" 
                                            AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Mã SP">
                                                    <ItemTemplate>
                                                        <%# Eval("productid") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Tên sản phẩm">
                                                    <ItemTemplate>
                                                        <%# Eval("productname") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Đơn giá">
                                                    <ItemTemplate>
                                                        <%# Eval("price") %> VNĐ
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Số lượng">
                                                    <ItemTemplate>
                                                        <%# Eval("quantity") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Tổng cộng">
                                                    <ItemTemplate>
                                                        <%# Eval("total") %> VNĐ
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    
                                    </td>
									
								</tr>
                                <tr>
									<td Align="Center" style="width:30%"><b>Tổng số tiền:</b></td>
									<td Align="Right"><asp:Literal ID="ltlTotal" runat="server" /></td>
								</tr>
                                
							</table>
						</div><!--end checkout-content-->
					</div><!--end checkout-outer-->
</div>

</asp:Content>

