<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class LoginUserController extends Controller
{
    public function login(Request $request)
    {
        $user = User::whereEmail($request->email)->first();

        if(!$user || !Hash::check($request->password, $user->password))
        {
            return response()->json(
                [
                    'message' => 'Usuario o contraseña incorrectos'
                ]
            );
        }
        
        $user->api_token = Str::random(150);
        $user->save();

        return response()->json(
            [
                'message' => 'Usuario logueado exitosamente',
                'api_token' => $user->api_token
            ]
        );

    }
}