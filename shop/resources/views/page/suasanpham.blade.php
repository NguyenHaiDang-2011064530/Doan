@extends('master')
@section('content')
    <style>
        body { padding-top:20px; }
        .panel-body .btn:not(.btn-block) { width:120px;margin-bottom:10px; }
    </style>
    <div class="inner-header">
        <div class="container">
            <div class="pull-left">
                <h3 class="inner-title">Thêm sản phẩm</h3>
            </div>
            <div class="pull-right">
                <div class="beta-breadcrumb">
                    <a href="/">Trang chủ</a> / <span>Đặt hàng</span>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <div id="content">
        <form action="{{route('page.updateProduct', $product->id)}}" method="put" enctype="multipart/form-data">
            {{--<input type="hidden" name="_token" value="{{csrf_token()}}">--}}
            <div class="row">
                <div class="col-sm-3"></div>
                @if(count($errors)>0)
                    <div class="alert alert-danger">
                        @foreach($errors->all() as $err)
                            {{$err}}
                        @endforeach
                    </div>
                @endif
                <div class="col-sm-6">
                    <h4>Điền thông tin cần chỉnh sửa</h4>
                    <div class="space20">&nbsp;</div>
                    <div class="form-block">
                        <label for="name">Tên sản phẩm*</label>
                        <input class="form-control" type="name" name="name" value="{{$product->name}}" required>
                    </div>

                    <div class="form-block">
                        <label for="id_type">ID loại sản phẩm*</label>
                        <input class="form-control" type="id_type" name="id_type" value="{{$product->id_type}}" required>
                    </div>

                    <div class="form-block">
                        <label for="description">Description*</label>

                        <input type="text" class="form-control" name="description" value="{{$product->description}}"required>
                    </div>


                    <div class="form-block">
                        <label for="unit_price">Đơn giá*</label>
                        <input class="form-control" type="text" name="unit_price" value="{{$product->unit_price}}" required>
                    </div>
                    <div class="form-block">
                        <label for="promotion_price">Giá giảm*</label>
                        <input class="form-control" type="text" name="promotion_price" value="{{$product->promotion_price}}"required>
                    </div>

                    <div class="form-block">
                        <label for="unit">Đơn vị*</label>
                        <input class="form-control" type="text" name="unit" value="{{$product->unit}}" required>
                    </div>
                    <div class="form-block">
                        <label for="new">Tình trạng(1 : mới, 0: cũ)*</label>
                        <input class="form-control" type="text" name="new" value="{{$product->new}}" required>
                    </div>
                    <div class="form-block">
                        <label for="image">Hình ảnh*</label>

                        <input type="file" name="image" required/>

                    </div>
                    <div class="form-block">
                        <button type="submit" class="btn btn-primary">Gửi</button>
                    </div>
                </div>
                <div class="col-sm-3"></div>
            </div>
        </form>
    </div>



    <!-- .container -->
@endsection