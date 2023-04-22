<?php

namespace App\Http\Controllers;

use App\Models\Hoteles;
use Illuminate\Http\Request;

class HotelesController extends Controller
{
    public function ObtenerHoteles()
    {
        return Hoteles::all();
    }

    public function ObtenerHotelPorId($id)
    {
        return Hoteles::where('id', $id)->get();
    }

    public function ObtenerHotelesPorCiudad($id)
    {
        return Hoteles::where('id_ciudad', $id)->get();
    }

    public function CrearHotel(Request $request)
    {
        return Hoteles::create([
            'nombre_hotel' => $request->nombre_hotel,
            'direccion_hotel' => $request->direccion_hotel,
            'id_ciudad' => $request->id_ciudad,
        ]);

    }

    public function EliminarHotel($id)
    {
        return Hoteles::where('id', $id)->delete();
    }

    public function ActualizarHotel(Request $request)
    {
        return Hoteles::where('id', $request->id)->update([
            'nombre_hotel' => $request->nombre_hotel,
            'direccion_hotel' => $request->direccion_hotel,
            'id_ciudad' => $request->id_ciudad,
        ]);
    }

}
