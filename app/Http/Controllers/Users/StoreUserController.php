<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;
use App\Models\User;
//use GuzzleHttp\Psr7\Request;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class StoreUserController extends Controller
{
    public function store(Request $request)
    {
        User::create(
            [
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password)
            ]
        );

        return response()->json(
            [
                'message' => 'Usuario creado exitosamente'
            ]            
        );

    }
}