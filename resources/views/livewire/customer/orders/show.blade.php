<div>
    {{-- A good traveler has no fixed plans and is not intent upon arriving. --}}
</div>
@section('title')
Detail Order &mdash; {{ $setting->site_title }}
@endsection

<div style="margin-top: -120px">
    <div class="container-fluid mb-lg-5 mt-4">
        <div class="row">
            <div class="col-md-3">
                <div class="card border-0 shadow rounded-lg mb-4">
                    <div class="card-body p-3">
                        <h6 class="font-weight-bold"><i class="fa fa-list-ul"></i> MAIN MENU</h6>
                        <hr>
                        @include('layouts.customer_menu')
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div class="card border-0 shadow rounded-lg">
                    <div class="card-body">
                        <h6 class="font-weight-bold"><i class="fa fa-shopping-cart"></i> MY ORDERS</h6>
                        <hr>
                        <table class="table table-bordered">
                            <tr>
                                <td style="width: 25%">
                                    NO. INVOICE
                                </td>
                                <td style="width: 1%">:</td>
                                <td>
                                    {{ $invoice->invoice }}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    NAMA LENGKAP
                                </td>
                                <td>:</td>
                                <td>
                                    {{ $invoice->name }}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    NO. TELP / WA
                                </td>
                                <td>:</td>
                                <td>
                                    {{ $invoice->phone }}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    KURIR / SERVICE / COST
                                </td>
                                <td>:</td>
                                <td>
                                    {{ strtoupper($invoice->courier) }} | {{ $invoice->service }} - {{ money_id($invoice->cost_courier) }}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    PROVINSI
                                </td>
                                <td>:</td>
                                <td>
                                    @php 
                                        // Mengirim permintaan ke API RajaOngkir untuk mendapatkan daftar provinsi
                                        $response = Http::withHeaders([
                                            'key' => env('RAJAONGKIR_API_KEY'),
                                        ])->get('https://api.rajaongkir.com/starter/province');  
                                
                                        // Cek apakah response berhasil (status code 200)
                                        if ($response->successful()) {
                                            // Mengubah response menjadi array
                                            $responseData = $response->json();
                                
                                            // Debug respons untuk melihat data yang diterima
                                            // dd($responseData);
                                
                                            // Cek apakah format data yang diharapkan ada
                                            if (isset($responseData['rajaongkir']['results'])) {
                                                $provinces = $responseData['rajaongkir']['results'];
                                
                                                // Mencari nama provinsi yang sesuai dengan province_id pada invoice
                                                $provinceName = '';
                                                foreach ($provinces as $province) {
                                                    if ($province['province_id'] == $invoice->province) {
                                                        $provinceName = $province['province'];
                                                        break;
                                                    }
                                                }
                                
                                                // Menampilkan nama provinsi
                                                echo $provinceName;
                                            } else {
                                                echo 'Data provinsi tidak ditemukan dalam respons.';
                                            }
                                        } else {
                                            echo 'Gagal mengambil data dari API RajaOngkir.';
                                        }
                                    @endphp
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    KOTA / KABUPATEN
                                </td>
                                <td>:</td>
                                <td>
                                    @php 
                                        // Mengirim permintaan ke API RajaOngkir untuk mendapatkan daftar kota/kabupaten
                                        $response = Http::withHeaders([
                                            'key' => env('RAJAONGKIR_API_KEY'),
                                        ])->get('https://api.rajaongkir.com/starter/city');  
                                
                                        // Cek apakah response berhasil (status code 200)
                                        if ($response->successful()) {
                                            // Mengubah response menjadi array
                                            $responseData = $response->json();
                                
                                            // Debug respons untuk melihat data yang diterima
                                            // dd($responseData);
                                
                                            // Cek apakah format data yang diharapkan ada
                                            if (isset($responseData['rajaongkir']['results'])) {
                                                $cities = $responseData['rajaongkir']['results'];
                                
                                                // Mencari nama kota/kabupaten yang sesuai dengan city_id pada invoice
                                                $cityName = '';
                                                foreach ($cities as $city) {
                                                    if ($city['city_id'] == $invoice->city) {
                                                        $cityName = $city['city_name'];
                                                        break;
                                                    }
                                                }
                                
                                                // Menampilkan nama kota/kabupaten
                                                echo $cityName;
                                            } else {
                                                echo 'Data kota/kabupaten tidak ditemukan dalam respons.';
                                            }
                                        } else {
                                            echo 'Gagal mengambil data dari API RajaOngkir.';
                                        }
                                    @endphp
                                </td>                                
                            </tr>
                            {{-- <tr>
                                <td>
                                    KECAMATAN
                                </td>
                                <td>:</td> --}}
                                {{-- <td>
                                    @php
                                        $response = Http::withHeaders([
                                            'accept' => 'application/json',
                                            'authorization' => env('RUANGAPI_KEY'),
                                            'content-type' => 'application/json',
                                        ])->get('https://ruangapi.com/api/v1/districts', [
                                            'city' => $invoice->city,
                                            'id'   => $invoice->district
                                        ]);

                                        echo $response['data']['results']['name'];

                                    @endphp
                                </td> --}}
                            {{-- </tr> --}}
                            <tr>
                                <td>
                                    ALAMAT LENGKAP
                                </td>
                                <td>:</td>
                                <td>
                                    {{ $invoice->address }}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    TOTAL PEMBELIAN
                                </td>
                                <td>:</td>
                                <td>
                                    {{ money_id($invoice->grand_total) }}
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="card mt-4 border-0 shadow rounded-lg">
                    <div class="card-body">
                        <h6 class="font-weight-bold"><i class="fa fa-shopping-cart"></i> DETAIL ORDER</h6>
                        <hr>

                        <table class="table"
                               style="border-style: solid !important;border-color: rgb(198, 206, 214) !important;">
                            <tbody>

                            @foreach ($invoice->order as $order)

                                @php
                                    $harga_set = $order->price * $order->discount / 100;
                                    $harga_diskon = $order->price - $harga_set;
                                @endphp

                                <tr style="background: #edf2f7;">
                                    <td class="b-none" width="15%">
                                        <div class="wrapper-image-cart">
                                            <img
                                                src="{{ Storage::url('public/products/').$order->image }}"
                                                style="width: 100%;border-radius: .5rem">
                                        </div>
                                    </td>
                                    <td class="b-none">
                                        <h5><b>{{ $order->product_name }}</b></h5>
                                        <table class="table-borderless" style="font-size: 14px">
                                            <tr>
                                                <td style="padding: .20rem">PRICE</td>
                                                <td style="padding: .20rem">:</td>
                                                <td style="padding: .20rem">{{ money_id($harga_diskon) }}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding: .20rem">QTY</td>
                                                <td style="padding: .20rem">:</td>
                                                <td style="padding: .20rem"><b>{{ $order->unit_weight }}
                                                        {{ $order->unit }}</b></td>
                                            </tr>
                                        </table>

                                    </td>
                                </tr>

                            @endforeach
                            </tbody>

                        </table>

                        <a href="{{ route('customer.orders.index') }}" class="btn btn-dark btn-md"><i class="fa fa-long-arrow-alt-left"></i>
                            KEMBALI</a>

                        @if ($invoice->status == "menunggu pembayaran")
                            <a href="{{ route('frontend.payment.index', $invoice->invoice) }}" class="btn btn-dark btn-md">KONFIRMASI PEMBAYARAN</a>
                        @endif

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
