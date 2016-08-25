<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GioHang.aspx.cs" Inherits="GioHang" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
<div class="checkout-outer">
						<div class="checkout-header">
							<a href="#" class="invarseColor pull-right" data-tip="tooltip" data-placment="top" data-title="EDIT" style="margin-right:12px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>
							<h4><i class="icon-caret-down"></i> Giỏ hàng</h4>
						</div><!--end checkout-header-->

						<div class="checkout-content">
<table style="width:100%">
            <tr>
                <td colspan="3">
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                        DataKeyNames="productid" GridLines="None" AutoGenerateColumns="False" 
                        Width="100%" onrowdeleting="GridView1_RowDeleting">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <EditRowStyle BackColor="#999999" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ButtonType="Image" HeaderText="Xóa" ShowDeleteButton="true" 
                    DeleteImageUrl="~/template/images/delete.png">    
                <ItemStyle Width="10px" HorizontalAlign="Center"/>
                </asp:CommandField>
                    
                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Mã sản phẩm">
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
                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="số lượng">
                 <ItemTemplate> 
                  <asp:TextBox ID="txtsl" runat="server" Text='<%#Eval("quantity")%>' Width="50px" Height="10px"></asp:TextBox>
                 </ItemTemplate>

                </asp:TemplateField>
                <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Tổng cộng">
                    <ItemTemplate> 
                        <%# Eval("total")%> VNĐ
                    </ItemTemplate> 
                </asp:TemplateField>
            </Columns>
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

        
                </td>
            </tr>
            <tr style=" background-color:#E6E6FA">
                <td colspan="2" style="height: 21px; text-align: right">
                    <span style="color: #000099"><strong><em>&nbsp;Tổng Tiền Giỏ hàng: </em></strong></span></td>
                <td style="height: 21px; padding-right:5px; text-align: Right">
                    <asp:Label ID="lbltongtien" runat="server" Font-Bold="True" ForeColor="Red" Text="Chưa có sản phẩm"></asp:Label></td>
            </tr>
            <tr>
                <td style="padding:20px">
                    <asp:Button ID="btnBack" class="btn btn-primary" runat="server" 
                    Text="<< Quay lại mua hàng " onclick="btnBack_Click" /></td>
                <td style="padding:20px; text-align:right ">
                    <asp:Button ID="btnUpdate" class="btn btn-primary" runat="server" 
                    Text="+ Cập nhật giỏ hàng " onclick="btnUpdate_Click" /></td>
                <td style="padding:20px; text-align:right ">
                    <asp:Button ID="btnCheckout" class="btn btn-primary" runat="server" 
                    Text=" Thanh Toán >>" onclick="btnCheckout_Click" /></td>

            </tr>
        </table>
        </div>
        </div>
</div>
</asp:Content>

