<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DangNhap.aspx.cs" Inherits="Dangnhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">

            <div class="row">

				<div class="span4">
					<div class="titleHeader clearfix">
						<h3>Khách hàng mới</h3>
					</div><!--end titleHeader-->

					<div class="new-customer">
						<p>
							Tạo một tài khoản bạn sẽ có thể mua sắm nhanh hơn, cập nhật về tình trạng của đơn hàng và theo dõi các đơn hàng bạn đã thực hiện trước đó.
						</p>
						<a href="register.html" class="btn">Đăng ký</a>
					</div>
				</div><!--end span4-->


				<div class="span5">
					<div class="titleHeader clearfix">
						<h3>Đã có tài khoản</h3>
					</div><!--end titleHeader-->
                    
					<form method="post" class="login">
                        <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Text="lblMsg" Visible="False"></asp:Label>
						<div class="controls">
							<label for="email">E-Mail: <span class="text-error">*</span></label>
                            <asp:TextBox ID="txtEmail" type="text" class="input-block-level" name="" value="" placeholder="example@example.com" runat="server"></asp:TextBox>
						</div>
						<div class="controls">
							<label for="pw">Mật khẩu: <span class="text-error">*</span></label>
							<asp:TextBox ID="txtPass" class="input-block-level" name="" value="" placeholder="**************" runat="server" TextMode="Password"></asp:TextBox>
							<small><a href="#forget-pass" role="button" data-toggle="modal">Bạn quên mật khẩu?</a></small>
						</div>

						<div class="controls">
							<label class="checkbox">

						    <asp:CheckBox ID="ckbDangnhap" runat="server" text="Ghi nhớ đăng nhập" 
                                Checked="True" />

						    </label>
                            <asp:Button ID="btnOK" runat="server" onclick="btnOK_Click" Text="Đăng nhập" class="btn btn-primary"/>
						</div>
					</form><!--end form-->
				</div><!--end span5-->

				<div id="forget-pass" class="modal hide fade" tabindex="-1" role="dialog" data-backdrop="static" aria-hidden="true">
					<div class="modal-body">
						<form method="post" action="page" class="form-inline">
							<input type="text" name="" class="span4" placeholder="Nhập địa chỉ E-Mail của bạn...">

							<button type="submit" class="btn btn-primary">Gửi lại mật khẩu của tôi</button>

							<button type="button" class="btn btn-small" data-dismiss="modal" aria-hidden="true">Hủy</button>
						</form><!--end form-->
					</div><!--end modal-body-->
				</div><!--end modal-->


				<div class="span3">
					<div class="titleHeader clearfix">
						<h3>Account</h3>
					</div><!--end titleHeader-->
					<ul class="unstyled my-account">
						<li><a class="invarseColor" href="#"><i class="icon-caret-right"></i> Login or Register</a></li>
						<li><a class="invarseColor" href="#"><i class="icon-caret-right"></i> Forget my Password</a></li>
						<li><a class="invarseColor" href="#"><i class="icon-caret-right"></i> My Account</a></li>
						<li><a class="invarseColor" href="#"><i class="icon-caret-right"></i> My wishlist</a></li>
						<li><a class="invarseColor" href="#"><i class="icon-caret-right"></i> Order History</a></li>
						<li><a class="invarseColor" href="#"><i class="icon-caret-right"></i> Downloads</a></li>
						<li><a class="invarseColor" href="#"><i class="icon-caret-right"></i> Returns</a></li>
						<li><a class="invarseColor" href="#"><i class="icon-caret-right"></i> TRANSACTIONS</a></li>
						<li><a class="invarseColor" href="#"><i class="icon-caret-right"></i> Newlatters</a></li>
					</ul>
				</div><!--end span3-->

			</div><!--end row-->

</div> <!-- end container -->

</asp:Content>

