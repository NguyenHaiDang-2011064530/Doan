@extends('master')
@section('content')
    <style>
        .invoice-title h2, .invoice-title h3 {
            display: inline-block;
        }

        .table > tbody > tr > .no-line {
            border-top: none;
        }

        .table > thead > tr > .no-line {
            border-bottom: none;
        }

        .table > tbody > tr > .thick-line {
            border-top: 2px solid;
        }
    </style>
    <div class="inner-header">
        <div class="container">
            <div class="pull-left">
                <h3 class="inner-title">Thông tin đặt hàng của bạn</h3>
            </div>
            <div class="pull-right">
                <div class="beta-breadcrumb">
                    <a href="/">Trang chủ</a> / <span>Đặt hàng</span>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <div class="container">
        <div id="content">
            <code><h2><div class="row">@if(Session::has('thongbao')){{Session::get('thongbao')}}@endif</div></h2></code>
            <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
            <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
            <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
            <!------ Include the above in your HEAD tag ---------->

            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="invoice-title">
                            <h2>Hóa đơn</h2><h3 class="pull-right">Order {{$bill->id}}</h3>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-xs-6">
                                <address>
                                    <strong>Hình thức thanh toán</strong><br>
                                   {{$bill->payment}}
                                </address>
                            </div>
                            <div class="col-xs-6 text-right">
                                <address>
                                    <strong>Ngày mua:</strong><br>
                                    {{$bill->date_order}}<br><br>
                                </address>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><strong>Chi tiết hóa đơn</strong></h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-condensed">
                                        <thead>
                                        <tr>

                                            <td><strong>Mã sản phẩm</strong></td>
                                            <td class=""><strong>Ghi chú</strong></td>
                                            <td class=""><strong>Số lượng</strong></td>

                                            <td class=""><strong>Tổng tiền</strong></td>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <!-- foreach ($order->lineItems as $line) or some such thing here -->
                                        <tr>

                                            <td class="">{{$bill_detail->id_product}}</td>
                                            <td class="">{{$bill->note}}</td>
                                            <td class="">{{$bill_detail->quantity}}</td>
                                            <td class="">{{$bill->total}}</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div> <!-- #content -->
        <h3 class="text-center">*Nếu muốn hủy hóa đơn, quí khách vui lòng liên lạc cho tổng đài và cung cấp mã hóa đơn. Cảm ơn đã quan tâm và ủng hộ shop!</h3>
        <br>
        <div class="clearfix"></div>
    </div> <!-- .container -->
@endsection