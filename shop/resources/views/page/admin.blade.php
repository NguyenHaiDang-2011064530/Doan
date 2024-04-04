@extends('master')
@section('content')
<style>
    body { padding-top:20px; }
    .panel-body .btn:not(.btn-block) { width:120px;margin-bottom:10px; }
</style>
    <div class="inner-header">
        <div class="container">
            <div class="pull-left">
                <h3 class="inner-title">Admin</h3>
            </div>
            {{--<div class="pull-right">--}}
                {{--<div class="beta-breadcrumb">--}}
                    {{--<a href="/">Trang chủ</a> / <span>Đặt hàng</span>--}}
                {{--</div>--}}
            {{--</div>--}}
            <div class="clearfix"></div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <span class="glyphicon glyphicon-bookmark"></span> Lựa chọn</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class=" col-md-12 center">
                                <a href="{{route('page.themsanpham')}}" class="btn btn-danger btn-lg" role="button"><span class="glyphicon glyphicon-plus"></span> <br/>New shoe</a>
                                <a href="{{route('page.danhsachhoadon')}}" class="btn btn-warning btn-lg" role="button"><span class="glyphicon glyphicon-bookmark"></span> <br/>List Bills</a>
                                <a href="{{route('page.danhsachsanpham')}}" class="btn btn-primary btn-lg" role="button"><span class="glyphicon glyphicon-bookmark"></span> <br/>List Shoes</a>
                                {{--<a href="#" class="btn btn-primary btn-lg" role="button"><span class="glyphicon glyphicon-comment"></span> <br/>Comments</a>--}}
                            </div>
                        </div>
                        <a href="http://www.hcmunre.edu.vn/hcmunre/trang-chu/index" class="btn btn-success btn-lg btn-block" role="button"><span class="glyphicon glyphicon-globe"></span> Website</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

 <!-- .container -->
@endsection