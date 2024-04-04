@extends('master')
@section('content')
<script>
    //made by vipul mirajkar thevipulm.appspot.com
    var TxtType = function(el, toRotate, period) {
        this.toRotate = toRotate;
        this.el = el;
        this.loopNum = 0;
        this.period = parseInt(period, 10) || 2000;
        this.txt = '';
        this.tick();
        this.isDeleting = false;
    };

    TxtType.prototype.tick = function() {
        var i = this.loopNum % this.toRotate.length;
        var fullTxt = this.toRotate[i];

        if (this.isDeleting) {
            this.txt = fullTxt.substring(0, this.txt.length - 1);
        } else {
            this.txt = fullTxt.substring(0, this.txt.length + 1);
        }

        this.el.innerHTML = '<span class="wrap">'+this.txt+'</span>';

        var that = this;
        var delta = 200 - Math.random() * 100;

        if (this.isDeleting) { delta /= 2; }

        if (!this.isDeleting && this.txt === fullTxt) {
            delta = this.period;
            this.isDeleting = true;
        } else if (this.isDeleting && this.txt === '') {
            this.isDeleting = false;
            this.loopNum++;
            delta = 500;
        }

        setTimeout(function() {
            that.tick();
        }, delta);
    };

    window.onload = function() {
        var elements = document.getElementsByClassName('typewrite');
        for (var i=0; i<elements.length; i++) {
            var toRotate = elements[i].getAttribute('data-type');
            var period = elements[i].getAttribute('data-period');
            if (toRotate) {
                new TxtType(elements[i], JSON.parse(toRotate), period);
            }
        }
        // INJECT CSS
        var css = document.createElement("style");
        css.type = "text/css";
        css.innerHTML = ".typewrite > .wrap { border-right: 0.08em solid #fff}";
        document.body.appendChild(css);
    };
</script>
	<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Contacts</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="/">Home</a> / <span>Contacts</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="beta-map">
		<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7838.439793593294!2d106.666962!3d10.7944632!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xae118f87eef3dca1!2sHo+Chi+Minh+City+University+of+Natural+Resources+and+Environment!5e0!3m2!1sen!2s!4v1542537739656" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
	</div>
	<div class="container">
		<div id="content" class="space-top-none">
			
			<div class="space50">&nbsp;</div>
			<div class="row">
				<div class="col-sm-8">
					<h2><a href="" class="typewrite" data-period="2000" data-type='[ "Contact Form" ]'></a></h2>
					<div class="space20">&nbsp;</div>
					<p>Trụ sở: 236B Lê Văn Sỹ, Phường 1, Quận Tân Bình, TP. Hồ Chí Minh<br>

						Điện thoại: (028) 38 44 30 06</p>
					<div class="space20">&nbsp;</div>
					<form action="#" method="post" class="contact-form">	
						<div class="form-block">
							<input name="your-name" type="text" placeholder="Your Name (required)">
						</div>
						<div class="form-block">
							<input name="your-email" type="email" placeholder="Your Email (required)">
						</div>
						<div class="form-block">
							<input name="your-subject" type="text" placeholder="Subject">
						</div>
						<div class="form-block">
							<textarea name="your-message" placeholder="Your Message"></textarea>
						</div>
						<div class="form-block">
							<button type="submit" class="beta-btn primary">Send Message <i class="fa fa-chevron-right"></i></button>
						</div>
					</form>
				</div>
				<div class="col-sm-4" style="text-align: center;" >
					<h2><a href="" class="typewrite" data-period="2000" data-type='[ "Contact Information" ]'></a></h2>
					{{--<h2 >Contact Information</h2>--}}
					<div class="space20">&nbsp;</div>

					<h6 class="contact-title"><b>Address</b></h6>
					<p>
						236B Đường Lê Văn Sỹ<br>
						Phường 1, Tân Bình, <br>
						Hồ Chí Minh
					</p>
					<div class="space20">&nbsp;</div>
					<h6 class="contact-title"><b>About us</b></h6>

					<p>
						<code><b>1. Lê Văn Nguyên</b></code> <br>
						Mssv: 0450080080 <br>
						SDT 0947946308
					</p>
					<br>
					<p>
						<code><b>2. Trần Tuấn Kiệt </b></code><br>
						Mssv: 0450080061 <br>
						SDT 0961612308
					</p>

					<div class="space20">&nbsp;</div>
					<h6 class="contact-title"><b>Quotes</b></h6>
					<p>
					<blockquote><i>Nếu bạn muốn biến những ước mơ của mình thành hiện thực, điều đầu tiên mà bạn cần phải làm là thức dậy.</i></blockquote><br><br>
						<i>Thành công không phải chìa khóa mở cửa hạnh phúc. Hạnh phúc là chìa khóa dẫn tới thành công. Nếu bạn yêu điều bạn đang làm, bạn sẽ thành công...</i><br>
					</p>
					<br>
					<b><a href="http://www.hcmunre.edu.vn/hcmunre/trang-chu/index">Trường ĐH Tài Nguyên và Môi Trường</a></b>
				</div>
			</div>
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection