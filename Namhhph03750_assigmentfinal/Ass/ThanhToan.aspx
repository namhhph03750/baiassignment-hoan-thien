<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ThanhToan.aspx.cs" Inherits="ThanhToan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
<div class="checkout-outer">
						<div class="checkout-header">
							<a href="#" class="invarseColor pull-right" data-tip="tooltip" data-placment="top" data-title="EDIT" style="margin-right:12px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>
							<h4><i class="icon-caret-down"></i> Thông tin thanh toán</h4>
						</div><!--end checkout-header-->

						<div class="checkout-content">
							<div class="form-inline">
								<asp:Label ID="lbltongtien" runat="server" /> [<a id="lkbOut" class="invarseColor" href="GioHang.aspx"><i>Xem lại giỏ hàng</i></a>]
							</div><!--end form-->

							<hr>

							<div class="form-horizontal">
                                <div class="control-group">
                                <label class="control-label">Hình thức thanh toán: <span class="text-error">*</span></label>
								    <div class="controls">
                                        <label class="radio inline">
								            <asp:RadioButton ID="rdbBank" runat="server" GroupName="Bank" 
                                            AutoPostBack="True" Checked="True" Text="Chuyển khoản ngân hàng" 
                                            oncheckedchanged="rdbBank_CheckedChanged" />
                                        </label>
                                        <label class="radio inline">
                                            <asp:RadioButton ID="rdbTT" runat="server" GroupName="Bank" 
                                            AutoPostBack="True" Text="Thanh toán trực tiếp" 
                                            oncheckedchanged="rdbTT_CheckedChanged" />
                                        </label>
                                        
								    </div>
								</div><!--end control-group-->

								<div class="control-group">
								    <label class="control-label">Người nhận hàng: <span class="text-error">*</span></label>
								    <div class="controls">
                                       <asp:TextBox ID="txtRecipient" runat="server" placeholder="Nguyễn Văn A" 
                                            Width="250px"></asp:TextBox>
								    </div>
								</div><!--end control-group-->

								<div class="control-group">
								    <label class="control-label">Địa chỉ: <span class="text-error">*</span></label>
								    <div class="controls">
                                      <asp:TextBox ID="txtRecipientAdd" runat="server" 
                                            placeholder="Số 4 CMT8, P.4, Q.Tân Bình, TP.HCM" Width="250px"></asp:TextBox>
								    </div>
								</div><!--end control-group-->

								<div class="control-group">
								    <label class="control-label">SĐT: <span class="text-error">*</span></label>
								    <div class="controls">
                                        <asp:TextBox ID="txtRecipientPhone" runat="server" placeholder="0974095295" 
                                            Width="250px"></asp:TextBox>
								    </div>
								</div><!--end control-group-->

								<div class="control-group">
								    <label class="control-label">Chủ khoản: <span class="text-error">*</span></label>
								    <div class="controls">
                                        <asp:TextBox ID="txtSender" runat="server" placeholder="Nguyễn Văn B" 
                                            Width="250px"></asp:TextBox>
								    </div>
								</div><!--end control-group-->

								<div class="control-group">
								    <label class="control-label">Ngân hàng: <span class="text-error">*</span></label>
								    <div class="controls">
                                        <asp:TextBox ID="txtBankname" runat="server" 
                                            placeholder="VietcomBank chi nhánh TP.Buôn Ma Thuột" Width="250px"></asp:TextBox>
								    </div>
								</div><!--end control-group-->

								<div class="control-group">
								    <label class="control-label">Số tài khoản: <span class="text-error">*</span></label>
								    <div class="controls">
                                        <asp:TextBox ID="txtPaynum" runat="server" placeholder="17838a28" Width="250px"></asp:TextBox>
								    </div>
								</div><!--end control-group-->
								<div class="control-group">
								    <label class="control-label">Ghi chú: </label>
								    <div class="controls">
                                       <asp:TextBox ID="txtNotes" runat="server" placeholder="Ghi chú thêm..." 
                                            TextMode="MultiLine" Width="250px"></asp:TextBox>
								    </div>
								</div><!--end control-group-->
                                <div class="control-group">
								        
							        <div class="controls">
                                        <asp:Button ID="btnOK" runat="server" class="btn btn-primary" Text="Thanh toán" 
                                            onclick="btnOK_Click" />
                                        <asp:Button ID="btnBack" runat="server" class="btn" Text="Xem lại giỏ hàng" />
                                        
							        </div>
							    </div><!--end control-group-->
							</div><!--end form-->
						</div><!--end checkout-content-->
					</div><!--end checkout-outer-->

</div>
</asp:Content>

