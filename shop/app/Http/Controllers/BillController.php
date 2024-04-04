<?php

namespace App\Http\Controllers;
use App\Bill;

class BillController extends Controller
{
    public function deleteBill($id)
    {
        $bill = Bill::findOrFail($id);

        $bill->delete();

        return redirect()->route('page.danhsachhoadon');
    }
}
