<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChuyenMuc.aspx.cs" Inherits="ChuyenMuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">
        
			<div class="row">
                    <div class="span12">
						<!-- <div class="span12"> -->
						<div class="titleHeader clearfix">
							<h3>Sản phẩm: <asp:Literal ID="ltlCategoryName" runat="server" /></h3>
							<div class="pagers">
								<div class="btn-toolbar">
									<button class="btn btn-mini">Xem thêm</button>
								</div>
							</div>
						</div><!--end titleHeader-->
						<!-- </div> -->
						<div class="row">
							<ul class="hProductItems clearfix">
                                <asp:Literal ID="ltlProduct" runat="server"/>
							</ul>
						</div><!--end row-->
                    </div>
			</div><!--end row-->

            <div class="pagination pagination-right">
						<span class="pull-left">Trang <asp:Literal ID="numpage" runat="server" /> trên tổng số <asp:Literal ID="totalpage" runat="server" /> trang:</span>
						<ul>
							<li><a class="invarseColor" href="">Prev</a></li>
							<li class="active"><a class="invarseColor" href="">1</a></li>
							<li><a class="invarseColor" href="">2</a></li>
							<li><a class="invarseColor" href="">2</a></li>
							<li><a class="invarseColor" href="">3</a></li>
							<li><a class="invarseColor" href="">Next</a></li>
						</ul>
			</div><!--end pagination-->
</div> <!-- end container -->

</asp:Content>

