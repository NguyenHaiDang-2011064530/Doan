<?php


namespace App\Http\Controllers;

use App\Slide;
use App\Product;
use App\ProductType;
use App\Cart;
use App\Customer;
use App\Bill;
use App\BillDetail;
use App\User;
use Image;
use Session;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Hash;

class PageController extends Controller
{
    public function postLogin(Request $req)
    {
        $this->validate($req,
            [
                'email' => 'required|email',
                'password' => 'required|min:6|max:20'
            ],
            [
                'email.required' => 'Vui lòng nhập email',
                'email.email' => 'Email không đúng định dạng',
                'password.required' => 'Vui lòng nhập mật khẩu',
                'password.min' => 'Mật khẩu ít nhất 6 kí tự',
                'password.max' => 'Mật khẩu không quá 20 kí tự'
            ]
        );
        $credentials = array('email' => $req->email, 'password' => $req->password);
        $user = User::where([
            ['email', '=', $req->email]
//                ['status','=','1']
        ])->first();


        if ($user) {
            if (Auth::attempt($credentials)) {
                return redirect()->route('trang-chu')->with(['flag' => 'success', 'message' => 'Đăng nhập thành công']);
            } else {
                return redirect()->back()->with(['flag' => 'danger', 'message' => 'Đăng nhập không thành công']);
            }
        } else {
            return redirect()->back()->with(['flag' => 'danger', 'message' => 'Tài khoản chưa kích hoạt']);
        }

    }

    public function updateProduct(Request $request, $id)
    {
        $this->validate($request, array(
            'name' => 'required|max:255',
            'id_type' => 'required',
            'unit_price' => 'required',
            'description' => 'required',
            'promotion_price' => 'required',
            'unit' => 'required',
            'new' => 'required',
        ));

        $p = Product::find($id);
        $p->name = $request->name;
        $p->id_type = $request->id_type;
        $p->description = $request->description;
        $p->unit_price = $request->unit_price;
        $p->promotion_price = $request->promotion_price;
        $p->unit = $request->unit;
        $p->new = $request->new;

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $filename = time() . '.' . $image->getClientOriginalExtension();
            $location = public_path('source/image/product/' . $filename);
            Image::make($image)->save($location);
            $p->image = $filename;
        }
        $p->save();

        return redirect()->route('chitietsanpham', $p->id);
    }

    public function store(Request $request)
    {
        $this->validate($request, array(
            'name' => 'required|max:255',
            'id_type' => 'required',
            'unit_price' => 'required',
            'description' => 'required',
            'promotion_price' => 'required',
            'unit' => 'required',
            'new' => 'required',
        ));
        $p = new Product();
        $p->name = $request->name;
        $p->id_type = $request->id_type;
        $p->description = $request->description;
        $p->unit_price = $request->unit_price;
        $p->promotion_price = $request->promotion_price;
        $p->unit = $request->unit;
        $p->new = $request->new;


        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $filename = time() . '.' . $image->getClientOriginalExtension();
            $location = public_path('source/image/product/' . $filename);
            Image::make($image)->save($location);
            $p->image = $filename;
        }
        $p->save();

        return redirect()->route('chitietsanpham', $p->id);
    }


    public function editProduct($id)
    {
        $product = Product::find($id);
        return view('page.suasanpham', compact('product'));
    }

    public function destroy($id)
    {
        $product = Product::findOrFail($id);

        $product->delete();

        return redirect()->route('page.danhsachsanpham');
    }


    public function getListBill()
    {
        $bill = Bill::all();
        $bill_detail = BillDetail::all();
        return view('page.danhsachhoadon', compact('bill_detail', 'bill'));
    }


    public function getAddNewProduct()
    {
        $product = Product::all();
        return view('page.themsanpham', compact('product'));
    }

    public function getAdmin()
    {
        return view('page.admin');
    }

    public function getIndex()
    {
        $allProduct = Product::all();
        $slide = Slide::all();
        $new_product = Product::where('new', 1)->paginate(4);
        $sanpham_khuyenmai = Product::where('promotion_price', '<>', 0)->paginate(8);
        return view('page.trangchu', compact('slide', 'new_product', 'sanpham_khuyenmai', 'allProduct'));
    }

    public function getAllProduct()
    {
        $allProduct = Product::all();
        return view('page.danhsachsanpham', compact('allProduct'));
    }

    public function getLoaiSp($type)
    {
        $sp_theoloai = Product::where('id_type', $type)->get();
        $sp_khac = Product::where('id_type', '<>', $type)->paginate(3);
        $loai = ProductType::all();
        $loap_sp = ProductType::where('id', $type)->first();
        return view('page.loai_sanpham', compact('sp_theoloai', 'sp_khac', 'loai', 'loap_sp'));
    }

    public function getChitiet(Request $req)
    {
        $sanpham = Product::where('id', $req->id)->first();
        $sp_tuongtu = Product::where('id_type', $sanpham->id_type)->paginate(6);
        return view('page.chitiet_sanpham', compact('sanpham', 'sp_tuongtu'));
    }

    public function getLienHe()
    {
        return view('page.lienhe');
    }

    public function getGioiThieu()
    {
        return view('page.gioithieu');
    }

    public function getAddtoCart(Request $req, $id)
    {
        $product = Product::find($id);
        $oldCart = Session('cart') ? Session::get('cart') : null;
        $cart = new Cart($oldCart);
        $cart->add($product, $id);
        $req->session()->put('cart', $cart);
        return redirect()->back();
    }

    public function getDelItemCart($id)
    {
        $oldCart = Session::has('cart') ? Session::get('cart') : null;
        $cart = new Cart($oldCart);
        $cart->removeItem($id);
        if (count($cart->items) > 0) {
            Session::put('cart', $cart);
        } else {
            Session::forget('cart');
        }
        return redirect()->back();
    }

    public function getCheckout()
    {
        return view('page.dat_hang');
    }

    public function postCheckout(Request $req)
    {
        $cart = Session::get('cart');

        $customer = new Customer;
        $customer->name = $req->name;
        $customer->gender = $req->gender;
        $customer->email = $req->email;
        $customer->address = $req->address;
        $customer->phone_number = $req->phone;
        $customer->note = $req->notes;
        $customer->save();

        $bill = new Bill;
        $bill->id_customer = $customer->id;
        $bill->date_order = date('Y-m-d');
        $bill->total = $cart->totalPrice;
        $bill->payment = $req->payment_method;
        $bill->note = $req->notes;
        $bill->save();

        foreach ($cart->items as $key => $value) {
            $bill_detail = new BillDetail;
            $bill_detail->id_bill = $bill->id;
            $bill_detail->id_product = $key;
            $bill_detail->quantity = $value['qty'];
            $bill_detail->unit_price = ($value['price'] / $value['qty']);
            $bill_detail->save();
        }
        Session::forget('cart');
        return redirect()->route('page.billInfor', $bill->id)->with('thongbao', 'Đặt hàng thành công');

    }

    public function billInfor($id)
    {
        $bill = Bill::where('id', $id)->first();
        $bill_detail = BillDetail::where('id', $id)->first();
        return view('page.thongtindonhang', compact('bill', 'bill_detail'));
    }


    public function getLogin()
    {
        return view('page.dangnhap');
    }

    public function getSignin()
    {
        return view('page.dangki');
    }

    public function postSignin(Request $req)
    {
        $this->validate($req,
            [
                'email' => 'required|email|unique:users,email',
                'password' => 'required|min:6|max:20',
                'fullname' => 'required',
                're_password' => 'required|same:password'
            ],
            [
                'email.required' => 'Vui lòng nhập email',
                'email.email' => 'Không đúng định dạng email',
                'email.unique' => 'Email đã có người sử dụng',
                'password.required' => 'Vui lòng nhập mật khẩu',
                're_password.same' => 'Mật khẩu không giống nhau',
                'password.min' => 'Mật khẩu ít nhất 6 kí tự'
            ]);
        $user = new User();
        $user->full_name = $req->fullname;
        $user->email = $req->email;

      $user->password = Hash::make($req->password);
//        $user->password = $req->password;


        $user->phone = $req->phone;
        $user->address = $req->address;
        $user->save();
        return redirect()->back()->with('thanhcong', 'Tạo tài khoản thành công');
    }


    public function postLogout()
    {
        Auth::logout();
        return redirect()->route('trang-chu');
    }
}
