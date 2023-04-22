<?php

namespace App\Http\Controllers;

use App\Models\Ciudad;
use Illuminate\Http\Request;

class CiudadController extends Controller
{
    public function ObtenerCiudad()
    {
        return Ciudad::all();
    }

    public function ObtenerCiudadPorId($id)
    {
        return Ciudad::where('id', $id)->get();
    }

    public function CrearCiudad(Request $request)
    {
        return Ciudad::create([
            'nombre_ciudad' => $request->nombre_ciudad,
        ]);
    }

    public function EliminarCiudad($id)
    {
        return Ciudad::where('id', $id)->delete();
    }
}
