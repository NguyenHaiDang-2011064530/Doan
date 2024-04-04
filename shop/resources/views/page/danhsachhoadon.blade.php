@extends('master')
@section('content')
    <style>
        body { padding-top:20px; }
        .panel-body .btn:not(.btn-block) { width:120px;margin-bottom:10px; }
    </style>
    <div class="inner-header">
        <div class="container">
            <div class="pull-left">
                <h3 class="inner-title">Danh Sách Hóa Đơn</h3>
            </div>
            <div class="pull-right">
                <div class="beta-breadcrumb">
                    <h4><a href="/admin"=>Back to Admin</a></h4>
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
                                    <td><strong>Mã hóa đơn</strong></td>
                                    <td><strong>Mã khác hàng</strong></td>
                                    <td><strong>Hình thức thann toán</strong></td>
                                    <td class=""><strong>Ghi chú</strong></td>
                                    <td class=""><strong>Ngày mua</strong></td>
                                    <td class=""><strong>Tổng tiền</strong></td>
                                    <td class=""><strong>Xóa hóa đơn</strong></td>


                                </tr>
                                </thead>
                                <tbody>
                                @foreach($bill as $bill)
                                <tr>
                                    <td><strong>{{$bill->id}}</strong></td>
                                    <td><strong>{{$bill->id_customer}}</strong></td>
                                    <td><strong>{{$bill->payment}}</strong></td>
                                    <td><strong>{{$bill->note}}</strong></td>
                                    <td><strong>{{$bill->date_order}}</strong></td>
                                    <td><strong>{{$bill->total}}</strong></td>
                                    <form action="{{route('bill.destroy',$bill->id)}}" method="post" class="beta-form-checkout">
                                        {{--<input type="hidden" name="_token" value="{{csrf_token()}}">--}}
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