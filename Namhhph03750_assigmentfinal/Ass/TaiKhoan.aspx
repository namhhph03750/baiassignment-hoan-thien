<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TaiKhoan.aspx.cs" Inherits="TaiKhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <div class="container">

			<div class="row">

				<div class="span9">
					<div class="account-list-outer">

						<div class="checkout-outer">
						<div class="checkout-header">
							<a href="#" class="invarseColor pull-right" data-tip="tooltip" data-placment="top" data-title="EDIT" style="margin-right:12px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>
							<h4><i class="icon-caret-down"></i> Thông tin Tài khoản</h4>
						</div><!--end checkout-header-->

						<div class="checkout-content">
                            
							<div class="form-horizontal">
                                
                                <div class="control-group">
								    &nbsp;&nbsp;
								    <asp:Label ID="lblMsg" runat="server" Visible="False" Font-Bold="True"></asp:Label>
								</div><!--end control-group-->
								<div class="control-group">
								    <label class="control-label">Họ và tên: <span class="text-error">*</span></label>
								    <div class="controls">
                                       <asp:TextBox ID="txtName" runat="server" placeholder="Nguyễn Văn A" 
                                            Width="250px"></asp:TextBox>
								    </div>
								</div><!--end control-group-->

								<div class="control-group">
								    <label class="control-label">Địa chỉ: <span class="text-error">*</span></label>
								    <div class="controls">
                                      <asp:TextBox ID="txtAdd" runat="server" 
                                            placeholder="Số 4 CMT8, P.4, Q.Tân Bình, TP.HCM" Width="250px"></asp:TextBox>
								    </div>
								</div><!--end control-group-->

								<div class="control-group">
								    <label class="control-label">SĐT: <span class="text-error">*</span></label>
								    <div class="controls">
                                        <asp:TextBox ID="txtPhone" runat="server" placeholder="0974095295" 
                                            Width="250px"></asp:TextBox>
								    </div>
								</div><!--end control-group-->

								<div class="control-group">
								    <label class="control-label">Tên tài khoản (Email): <span class="text-error">*</span></label>
								    <div class="controls">
                                        <asp:TextBox ID="txtEmail" runat="server" placeholder="top1phim@gmail.com" 
                                            Width="250px" Enabled="False"></asp:TextBox>
								    </div>
								</div><!--end control-group-->

								<div class="control-group">
								    <label class="control-label">Xác nhận mật khẩu: <span class="text-error">*</span></label>
								    <div class="controls">
                                        <asp:TextBox ID="txtPass" runat="server" 
                                            placeholder="Nhập mật khẩu vào ô này" Width="250px" TextMode="Password"></asp:TextBox>
								    </div>
								</div><!--end control-group-->
						
                                <div class="control-group">
								        
							        <div class="controls">
                                        <asp:Button ID="btnOK" runat="server" class="btn btn-primary" Text="Xác nhận" 
                                            onclick="btnOK_Click" />
                                        
							        </div>
							    </div><!--end control-group-->
							</div><!--end form-->
						</div><!--end checkout-content-->
					</div><!--end checkout-outer-->
					</div><!--end -->
				</div><!--end span9-->


				<div class="span3">
					<div class="titleHeader clearfix">
						<h3>Account</h3>
					</div><!--end titleHeader-->
					<ul class="unstyled my-account">
						<li><a class="invarseColor" href="./TaiKhoan.aspx"><i class="icon-caret-right"></i> Đổi thông tin cá nhân</a></li>
						<li><a class="invarseColor" href="?case=pass"><i class="icon-caret-right"></i> Đổi mật khẩu</a></li>
						<li><a class="invarseColor" href="?case=order"><i class="icon-caret-right"></i> Đơn hàng</a></li>
						<li><a class="invarseColor" href="./GioHang.aspx"><i class="icon-caret-right"></i> Giỏ hàng</a></li>
					</ul>
				</div><!--end span3-->

			</div><!--end row-->

		</div><!--end conatiner-->

</asp:Content>

