@extends('master')
@section('content')
    <style>
        body { padding-top:20px; }
        .panel-body .btn:not(.btn-block) { width:120px;margin-bottom:10px; }
    </style>
    <div class="inner-header">
        <div class="container">
            <div class="pull-left">
                <h3 class="inner-title">Danh Sách Tổng Sản Phẩm</h3>
            </div>
            <div class="pull-right">
                <div class="beta-breadcrumb">
                    <h4><a href="/admin">Back to Admin</a></h4>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="container">

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    {{--<div class="panel-heading">--}}
                    {{--<h3 class="panel-title"><strong>Chi tiết hóa đơn</strong></h3>--}}
                    {{--</div>--}}
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-condensed">
                                <thead>
                                <tr>
                                    <td><strong>Mã sản phẩm</strong></td>
                                    <td><strong>Tên sản phẩm</strong></td>
                                    <td><strong>Đơn giá</strong></td>
                                    <td class=""><strong>Giá Khuyến Mãi</strong></td>
                                    <td class=""><strong>Đơn vị</strong></td>
                                    <td class=""><strong>Tình Trạng<br>(1:mới - 2:cũ)</strong></td>
                                    <td class=""><strong>Sửa</strong></td>
                                    <td class=""><strong>Xóa</strong></td>
                                </tr>
                                </thead>
                                <tbody>
                               {{--field here--}}
                               @foreach($allProduct as $all)
                               <tr>
                                   <td><strong>{{$all->id}}</strong></td>
                                   <td><strong>{{$all->name}}</strong></td>
                                   <td><strong>{{$all->unit_price}}</strong></td>
                                   <td class=""><strong>{{$all->promotion_price}}</strong></td>
                                   <td class=""><strong>{{$all->unit}}</strong></td>
                                   <td class=""><strong>{{$all->new}}</strong></td>
                                   <td> <a href="{{route('page.suasanpham',$all->id)}}}"><button class="btn btn-primary btn-block"><strong>Edit</strong></button></a></td>
                                   <form action="{{route('product.destroy',$all->id)}}" method="post" class="beta-form-checkout">

                                       {{ csrf_field() }}
                                       {{ method_field('DELETE') }}
                                       <td><button type="submit" class="btn btn-danger btn-block">Xóa</button></td>
                                   </form>
                               </tr>
                                   @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


@endsection