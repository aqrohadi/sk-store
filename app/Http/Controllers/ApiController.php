<?php
 
namespace App\Http\Controllers;
 
use App\Invoice;
use App\Voucher;
use App\Facades\Cart;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
 
class ApiController extends Controller
{
    /**
     * API_KEY
     *
     * @var string
     */
    protected $API_KEY = 'ed981ac925dd1a6f0ad43cc24d069132'; 
 
    /**
     * getProvinces
     *
     * @return void
     */
    public function getProvinces()
    {
 
        $response = Http::withHeaders([
            'key' => $this->API_KEY
        ])->get('https://api.rajaongkir.com/starter/province');
 
        $provinces = $response['rajaongkir']['results'];
 
        return response()->json([
            'success' => true,
            'message' => 'Get All Provinces',
            'data'    => $provinces    
        ]);
    }
 
    /**
     * getCities
     *
     * @param  mixed $id
     * @return void
     */
    public function getCities(Request $request)
    {
 
        $response = Http::withHeaders([
            'key' => $this->API_KEY
        ])->get('https://api.rajaongkir.com/starter/city?&province='.$request->province.'');
 
        $cities = $response['rajaongkir']['results'];
 
        return response()->json([
            'success' => true,
            'message' => 'Get City By ID Provinces : '.$request->province,
            'data'    => $cities    
        ]);
    }
 
    /**
     * checkOngkir
     *
     * @param  mixed $request
     * @return void
     */
    public function getShipping(Request $request)
    {
        $response = Http::withHeaders([
            'key' => $this->API_KEY
        ])->post('https://api.rajaongkir.com/starter/cost', [
            'origin'            => 113,
            'destination'       => $request->destination,
            'weight'            => $request->weight,
            'courier'           => $request->courier
        ]);
 
        return $response['rajaongkir']['results'];
    }
 
    /**
     * check voucher
     */
    public function check_voucher(Request $request)
    {
        $voucher = Voucher::where('voucher', $request->voucher)->first();
        if($voucher) {
            return response()->json([
                'success'=> true,
                'data'   => $voucher,
            ], 200);
        } else {
            return response()->json([
                'success'=> false,
            ], 200);
        }
 
    }
 
    /**
     * checkout
     */
    public function checkout(Request $request)
    {
 
        //create invoice
 
        /**
         * algorithm create no invoice
         */
        $length = 10;
        $random = '';
        for ($i = 0; $i < $length; $i++) {
            $random .= rand(0, 1) ? rand(0, 9) : chr(rand(ord('a'), ord('z')));
        }
 
        $invoice = 'INVOICE-'.Str::upper($random);
 
        $data_invoice = Invoice::create([
            'invoice'       => $invoice,
            'customer_id'   => auth()->guard('customer')->user()->id,
            'courier'       => $request->courier,
            'service'       => $request->service,
            'cost_courier'  => $request->cost,
            'weight'        => $request->weight,
            'name'          => $request->name,
            'phone'         => $request->phone,
            'province'      => $request->province,
            'city'          => $request->city,
            'district'      => $request->district,
            'address'       => $request->address,
            'note'          => $request->note,
            'grand_total'   => $request->grand_total + rand(10,99),
            'status'        => 'menunggu pembayaran'
        ]);
 
        //insert product order
        foreach (Cart::get()['products'] as $cart) {
 
            $harga_set = $cart->price * $cart->discount / 100;
            $harga_diskon = $cart->price - $harga_set;
 
            $data_invoice->order()->create([
                'invoice'       => $invoice,
                'product_id'    => $cart->id,
                'product_name'  => $cart->title,
                'image'         => $cart->image,
                'unit'          => $cart->unit,
                'unit_weight'   => $cart->unit_weight,
                'price'         => $harga_diskon,
            ]);
 
        }
 
        //clear cart
        Cart::clear();
 
        return response()->json([
            'success'=> true,
            'data'   => $data_invoice,
        ], 201);
 
    }
 
}
 