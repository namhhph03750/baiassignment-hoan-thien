<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChiTietSanPham.aspx.cs" Inherits="ChiTietSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
            <div class="row">
				
				<div class="span9">
					<div class="row">

						<div class="product-details clearfix">
							<div class="span5">
								
								<div class="product-img">
                                    <asp:Literal ID="ltrImg" runat="server"/>
                                    
									
								</div><!--end product-img-->
								<div class="product-img-thumb">
									<a class="fancybox" href="template/img/650x700.jpg"><img src="template/img/68x60.jpg" alt=""></a>
									<a class="fancybox" href="template/img/650x700.jpg"><img src="template/img/68x60.jpg" alt=""></a>
									<a class="fancybox" href="template/img/650x700.jpg"><img src="template/img/68x60.jpg" alt=""></a>
									<a class="fancybox" href="template/img/650x700.jpg"><img src="template/img/68x60.jpg" alt=""></a>
								</div><!--product-img-thumb-->
							</div><!--end span5-->

							<div class="span4">
								<div class="product-set">
                                    <div class="product-title">
									    <h1><asp:Literal ID="ltrTitle" runat="server"/></h1>
								    </div>
									
									
									<div class="product-info">
										<dl class="dl-horizontal">

										  <dt>Mã sản phẩm:</dt>
										  <asp:Literal ID="ltrID" runat="server" />

										</dl>
									</div><!--end product-info-->
									<div class="product-inputs">
										<form method="post" action="page">
											<div class="controls-row">
												<select class="span2" name="#">
													<option>-- Select Color --</option>
													<option value="">Red</option>
													<option value="">Blue</option>
													<option value="">Brown</option>
												</select>
											</div><!--end controls-row-->

							
                                    <dl class="dl-horizontal">
								    	<div class="product-price">
									        <asp:Literal ID="ltrPrice" runat="server" />
									    </div><!--end product-price-->
                                    </dl>
                                

											

											<div class="input-append">
												<br />
												<asp:TextBox ID="txtQual" class="span1" type="text" name="" value="" placeholder="Số lượng" runat="server" />
                                                <asp:Button ID="btnBuy" class='btn btn-primary' runat="server" Text="Đặt mua" 
                                                    onclick="btnBuy_Click" />
                                                <!--<asp:Literal ID="ltlBuy" runat="server" />-->

											</div>
											
										</form><!--end form-->

									</div><!--end product-inputs-->
								</div><!--end product-set-->
							</div><!--end span4-->

						</div><!--end product-details-->

					</div><!--end row-->


					<div class="product-tab">
						<ul class="nav nav-tabs">
						  <li class="active">
						  	<a href="#descraption" data-toggle="tab">Sản phẩm</a>
						  </li>
						  <li>
						  	<a href="#specfications" data-toggle="tab">Cấu hình</a>
						  </li>
						  <li>
						  	<a href="#return-info" data-toggle="tab">Bình luận</a>
						  </li>
						  
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="descraption">
								<asp:Literal ID="ltrDescription" runat="server" />
							</div>
							<div class="tab-pane" id="specfications">
								<table class="table table-compare">
									<tr>
										<td class="aligned-color"><h5>Momery</h5></td>
										<td>Test One</td>
										<td>16GB</td>
									</tr>
									<tr>
										<td class="aligned-color"><h5>Processor</h5></td>
										<td>No. of Cores</td>
										<td>No.4</td>
									</tr>
									<tr>
										<td class="aligned-color"><h5>Momery</h5></td>
										<td>Test One</td>
										<td>16GB</td>
									</tr>
									<tr>
										<td class="aligned-color"><h5>Processor</h5></td>
										<td>No. of Cores</td>
										<td>No.4</td>
									</tr>
								</table>
							</div>
							<div class="tab-pane" id="return-info">
								<h4>Read our Returning info</h4><br>
								<p>
									Suspendisse potenti. In non nisl sem, eu rutrum augue. Donec eu dolor vel massa ornare cursus id eget erat. Mauris in ante magna. Curabitur eget risus mi, non interdum lacus. Duis magna leo, rhoncus eget malesuada quis, semper a quam. Morbi imperdiet imperdiet lectus ac pellentesque. Integer diam sem, vulputate in feugiat ut, porttitor eu libero. Integer non dolor ipsum. Cras condimentum mattis turpis quis vestibulum. Nulla a augue ipsum. Donec aliquam velit vel metus fermentum dictum sodales metus condimentum. Nullam id massa quis nulla molestie ultrices eget sed nulla. Cras feugiat odio at tellus euismod lacinia.
									
								</p>
							</div>

							<div class="tab-pane" id="read-review">
								<div class="single-review clearfix">
									<div class="review-header">
										<ul class="rating">
											<li><i class="star-on"></i></li>
											<li><i class="star-on"></i></li>
											<li><i class="star-off"></i></li>
											<li><i class="star-off"></i></li>
											<li><i class="star-off"></i></li>
										</ul>
										<h4>John Doe</h4>
										<small>26/11/2012</small>
									</div><!--end review-header-->

									<div class="review-body">
										<p>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
									</div><!--end review-body-->
								</div><!--end single-review-->

								<div class="single-review clearfix">
									<div class="review-header">
										<ul class="rating">
											<li><i class="star-off"></i></li>
											<li><i class="star-off"></i></li>
											<li><i class="star-off"></i></li>
											<li><i class="star-off"></i></li>
											<li><i class="star-off"></i></li>
										</ul>
										<h4>John Doe</h4>
										<small>26/11/2012</small>
									</div><!--end review-header-->

									<div class="review-body">
										<p>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
									</div><!--end review-body-->
								</div><!--end single-review-->

								<div class="single-review clearfix">
									<div class="review-header">
										<ul class="rating">
											<li><i class="star-on"></i></li>
											<li><i class="star-on"></i></li>
											<li><i class="star-on"></i></li>
											<li><i class="star-off"></i></li>
											<li><i class="star-off"></i></li>
										</ul>
										<h4>John Doe</h4>
										<small>26/11/2012</small>
									</div><!--end review-header-->

									<div class="review-body">
										<p>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
									</div><!--end review-body-->
								</div><!--end single-review-->
							</div>

							<div class="tab-pane" id="make-review">
								<form method="post" action="page" class="form-horizontal">
									<div class="control-group">
									    <label class="control-label" for="inputName">Your Name <span class="text-error">*</span></label>
									    <div class="controls">
									      <input type="text" name="#" id="inputName" placeholder="John Doe...">
									    </div>
									</div>
									<div class="control-group">
										<label class="control-label" for="inputReview">Your Review <span class="text-error">*</span></label>
									    <div class="controls">
									      <textarea name="#" id="inputReview" placeholder="Put your review here..."></textarea>
									    </div>
									</div>
									<div class="control-group">
										<label class="control-label">Your Rate <span class="text-error">*</span></label>
									    <div class="controls">
									    	<label class="radio inline">From Bad</label>
									    	<label class="radio inline">
											  <input type="radio" name="rate" value="option1">
											</label>
											<label class="radio inline">
											  <input type="radio" name="rate" value="option2">
											</label>
											<label class="radio inline">
											  <input type="radio" name="rate" value="option3">
											</label>
											<label class="radio inline">
											  <input type="radio" name="rate" value="option3">
											</label>
											<label class="radio inline">
											  <input type="radio" name="rate" value="option3">
											</label>
											<label class="radio inline">To Good</label>
									    </div>
									</div>
									<div class="control-group">
									    <div class="controls">
									      <button type="submit" class="btn btn-primary" name="submit">Add Review</button>
									    </div>
									</div>
								</form><!--end form-->
							</div>
						</div><!--end tab-content-->
					</div><!--end product-tab-->


					<div class="related-product">
						<div class="titleHeader clearfix">
							<h3>Sản phẩm liên quan</h3>
						</div><!--end titleHeader-->

						<div class="row">
							<ul class="hProductItems clearfix">
								<asp:Literal ID="ltrLienquan" runat="server" />
							</ul>
						</div><!--end row-->
					</div><!--end related-product-->

				</div><!--end span9-->


				<aside class="span3">
					<div class="aside-inner">
						<div class="special">
							<div class="titleHeader clearfix">
								<h3>Special</h3>
							</div><!--end titleHeader-->

							<ul class="vProductItemsTiny">
								<li class="span4 clearfix">
									<div class="thumbImage">
										<a href=""><img src="template/img/72x72.jpg" alt=""></a>
									</div>
									<div class="thumbSetting">
										<div class="thumbTitle">
											<a href="#" class="invarseColor">
												Foliomania the title here
											</a>
										</div>
										<div class="thumbPrice">
											<span>$150.00</span>
										</div>
										<ul class="rating">
											<li><i class="star-off"></i></li>
											<li><i class="star-off"></i></li>
											<li><i class="star-off"></i></li>
											<li><i class="star-off"></i></li>
											<li><i class="star-off"></i></li>
										</ul>
									</div>
								</li>
								<li class="span4 clearfix">
									<div class="thumbImage">
										<a href=""><img src="template/img/72x72.jpg" alt=""></a>
									</div>
									<div class="thumbSetting">
										<div class="thumbTitle">
											<a href="#" class="invarseColor">
												Foliomania the designer portfolio
											</a>
										</div>
										<div class="thumbPrice">
											<span>$150.00</span>
										</div>
										<ul class="rating">
											<li><i class="star-on"></i></li>
											<li><i class="star-on"></i></li>
											<li><i class="star-on"></i></li>
											<li><i class="star-off"></i></li>
											<li><i class="star-off"></i></li>
										</ul>
									</div>
								</li>
								<li class="span4 clearfix">
									<div class="thumbImage">
										<a href=""><img src="template/img/72x72.jpg" alt=""></a>
									</div>
									<div class="thumbSetting">
										<div class="thumbTitle">
											<a href="#" class="invarseColor">
												Foliomania the designer portfolio
											</a>
										</div>
										<div class="thumbPrice">
											<span>$150.00</span>
										</div>
										<ul class="rating">
											<li><i class="star-on"></i></li>
											<li><i class="star-on"></i></li>
											<li><i class="star-on"></i></li>
											<li><i class="star-off"></i></li>
											<li><i class="star-off"></i></li>
										</ul>
									</div>
								</li>
								<li class="span4 clearfix">
									<div class="thumbImage">
										<a href=""><img src="template/img/72x72.jpg" alt=""></a>
									</div>
									<div class="thumbSetting">
										<div class="thumbTitle">
											<a href="#" class="invarseColor">
												Foliomania the designer portfolio
											</a>
										</div>
										<div class="thumbPrice">
											<span>$150.00</span>
										</div>
									</div>
								</li>
							</ul>
						</div><!--end special-->



						<div class="special">
							<div class="titleHeader clearfix">
								<h3>Featured</h3>
							</div><!--end titleHeader-->

							<ul class="vProductItemsTiny">
								<li class="span4 clearfix">
									<div class="thumbImage">
										<a href=""><img src="template/img/72x72.jpg" alt=""></a>
									</div>
									<div class="thumbSetting">
										<div class="thumbTitle">
											<a href="#" class="invarseColor">
												Foliomania the title here
											</a>
										</div>
										<div class="thumbPrice">
											<span>$150.00</span>
										</div>
										<ul class="rating">
											<li><i class="star-off"></i></li>
											<li><i class="star-off"></i></li>
											<li><i class="star-off"></i></li>
											<li><i class="star-off"></i></li>
											<li><i class="star-off"></i></li>
										</ul>
									</div>
								</li>
								<li class="span4 clearfix">
									<div class="thumbImage">
										<a href=""><img src="template/img/72x72.jpg" alt=""></a>
									</div>
									<div class="thumbSetting">
										<div class="thumbTitle">
											<a href="#" class="invarseColor">
												Foliomania the designer portfolio
											</a>
										</div>
										<div class="thumbPrice">
											<span>$150.00</span>
										</div>
										<ul class="rating">
											<li><i class="star-on"></i></li>
											<li><i class="star-on"></i></li>
											<li><i class="star-on"></i></li>
											<li><i class="star-off"></i></li>
											<li><i class="star-off"></i></li>
										</ul>
									</div>
								</li>
								<li class="span4 clearfix">
									<div class="thumbImage">
										<a href=""><img src="template/img/72x72.jpg" alt=""></a>
									</div>
									<div class="thumbSetting">
										<div class="thumbTitle">
											<a href="#" class="invarseColor">
												Foliomania the designer portfolio
											</a>
										</div>
										<div class="thumbPrice">
											<span>$150.00</span>
										</div>
										<ul class="rating">
											<li><i class="star-on"></i></li>
											<li><i class="star-on"></i></li>
											<li><i class="star-on"></i></li>
											<li><i class="star-off"></i></li>
											<li><i class="star-off"></i></li>
										</ul>
									</div>
								</li>
								<li class="span4 clearfix">
									<div class="thumbImage">
										<a href=""><img src="template/img/72x72.jpg" alt=""></a>
									</div>
									<div class="thumbSetting">
										<div class="thumbTitle">
											<a href="#" class="invarseColor">
												Foliomania the designer portfolio
											</a>
										</div>
										<div class="thumbPrice">
											<span>$150.00</span>
										</div>
									</div>
								</li>
							</ul>
						</div><!--end special-->

						<div class="twitter-feed">
							<div class="titleHeader clearfix">
								<h3>Twitter Feeds</h3>
							</div><!--end titleHeader-->
							<div class="tweet">
								<!-- tweets will generate automaticlly here-->
							</div><!--end tweet-->
						</div><!--end twitter-feed-->

					</div><!--end aside-inner-->
				</aside><!--end span3-->

			</div><!--end row-->
        </div><!-- end containner -->

</asp:Content>

