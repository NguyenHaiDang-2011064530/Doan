@extends('master')
@section('content')
	<style>
		/* carousel */
		#quote-carousel
		{
			padding: 0 10px 30px 10px;
			margin-top: 30px;
		}

		/* Control buttons  */
		#quote-carousel .carousel-control
		{
			background: none;
			color: #222;
			font-size: 2.3em;
			text-shadow: none;
			margin-top: 30px;
		}
		/* Previous button  */
		#quote-carousel .carousel-control.left
		{
			left: -12px;
		}
		/* Next button  */
		#quote-carousel .carousel-control.right
		{
			right: -12px !important;
		}
		/* Changes the position of the indicators */
		#quote-carousel .carousel-indicators
		{
			right: 50%;
			top: auto;
			bottom: 0px;
			margin-right: -19px;
		}
		/* Changes the color of the indicators */
		#quote-carousel .carousel-indicators li
		{
			background: #c0c0c0;
		}
		#quote-carousel .carousel-indicators .active
		{
			background: #333333;
		}
		#quote-carousel img
		{
			width: 250px;
			height: 100px
		}
		/* End carousel */

		.item blockquote {
			border-left: none;
			margin: 0;
		}

		.item blockquote img {
			margin-bottom: 10px;
		}

		.item blockquote p:before {
			content: "\f10d";
			font-family: 'Fontawesome';
			float: left;
			margin-right: 10px;
		}



		/**
          MEDIA QUERIES
        */

		/* Small devices (tablets, 768px and up) */
		@media (min-width: 768px) {
			#quote-carousel
			{
				margin-bottom: 0;
				padding: 0 40px 30px 40px;
			}

		}

		/* Small devices (tablets, up to 768px) */
		@media (max-width: 768px) {

			/* Make the indicators larger for easier clicking with fingers/thumb on mobile */

			#quote-carousel .carousel-indicators {
				bottom: -20px !important;
			}
			#quote-carousel .carousel-indicators li {
				display: inline-block;
				margin: 0px 5px;
				width: 15px;
				height: 15px;
			}
			#quote-carousel .carousel-indicators li.active {
				margin: 0px 5px;
				width: 20px;
				height: 20px;
			}
		}
	</style>
<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Sản phẩm {{$loap_sp->name}}</h6>

				<div class="item active">
					<blockquote>
						<div class="row">
							<div class="col-sm-9">
								<div class="col-md-9"><p><a href="{{route('loaisanpham',$loap_sp->id)}}">{{$loap_sp->description}}</a></p></div>
							</div>
						</div>
					</blockquote>
				</div>


			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{route('trang-chu')}}">Home</a> / <span>Loại sản phẩm</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
</div>
<div class="container">
	<div id="content" class="space-top-none">
		<div class="main-content">
			<div class="space60">&nbsp;</div>
			<div class="row">
				<div class="col-sm-3">
					<ul class="aside-menu">
					@foreach($loai as $l)
						<li><a href="{{route('loaisanpham',$l->id)}}">{{$l->name}}</a></li>

					@endforeach
					</ul>
				</div>
				<div class="col-sm-9">
					<div class="beta-products-list">
						<h4>Sản phẩm mới</h4>
						<div class="beta-products-details">

							<div class="clearfix"></div>
						</div>

						<div class="row">
						@foreach($sp_theoloai as $sp)
							<div class="col-sm-4">
								<div class="single-item">
									@if($sp->promotion_price!=0)
										<div class="ribbon-wrapper"><div class="ribbon sale">Sale</div></div>
									@endif
									<div class="single-item-header">
										<a href="{{route('chitietsanpham',$sp->id)}}"><img src="source/image/product/{{$sp->image}}" alt="" height="250px"></a>
									</div>
									<div class="single-item-body">
										<p class="single-item-title">{{$sp->name}}</p>
										<p class="single-item-price" style="font-size: 18px">
										@if($sp->promotion_price !=0)
											<span class="flash-del">{{number_format($sp->unit_price)}} đồng</span>
												<span class="flash-sale">{{number_format($sp->promotion_price)}} đồng</span>
											<br>
										@else
										<span>{{number_format($sp->unit_price)}} đồng</span>
										@endif
										</p>
										<br>
										<div class="clearfix"></div>
									</div>
									<div class="single-item-caption">
										<a class="add-to-cart pull-left" href="{{route('themgiohang',$sp->id)}}"><i class="fa fa-shopping-cart"></i></a>
										<a class="beta-btn primary" href="{{route('chitietsanpham',$sp->id)}}">Details <i class="fa fa-chevron-right"></i></a>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						@endforeach
						</div>
					</div> <!-- .beta-products-list -->

					<div class="space50">&nbsp;</div>

					<div class="beta-products-list">
						<h4>Sản phẩm khác</h4>
						<div class="beta-products-details">
							<p class="pull-left">Tìm thấy {{count($sp_khac)}} sản phẩm</p>
							<div class="clearfix"></div>
						</div>
						<div class="row">
						@foreach($sp_khac as $sp_k)
							<div class="col-sm-4">
								<div class="single-item">
									@if($sp_k->promotion_price!=0)
										<div class="ribbon-wrapper"><div class="ribbon sale">Sale</div></div>
									@endif
									<div class="single-item-header">
										<a href="product.html"><img src="source/image/product/{{$sp_k->image}}" alt="" height="250px"></a>
									</div>
									<div class="single-item-body">
										<p class="single-item-title">{{$sp_k->name}}</p>
										<p class="single-item-price" style="font-size: 18px">
										@if($sp_k->promotion_price !=0)
											<span class="flash-del">{{number_format($sp_k->unit_price)}} đồng</span>
												<span class="flash-sale">{{number_format($sp_k->promotion_price)}} đồng</span>
										@else
										<span>{{number_format($sp_k->unit_price)}} đồng</span>
										@endif
										</p>
									</div>
									<div class="single-item-caption">
										<a class="add-to-cart pull-left" href="shopping_cart.html"><i class="fa fa-shopping-cart"></i></a>
										<a class="beta-btn primary" href="product.html">Details <i class="fa fa-chevron-right"></i></a>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						@endforeach
						</div>
						<div class="row">{{$sp_khac->links()}}</div>
						<div class="space40">&nbsp;</div>
						
					</div> <!-- .beta-products-list -->
				</div>
			</div> <!-- end section with sidebar and main content -->


		</div> <!-- .main-content -->
	</div> <!-- #content -->
</div> <!-- .container -->
@endsection