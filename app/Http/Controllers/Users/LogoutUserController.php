<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class LogoutUserController extends Controller
{
    public function logout(Request $request)
    {
        $user = auth()->user();
        $user->api_token = null;
        $user->save();

        return response()->json(
            [
                'message' => 'Usuario ha cerrado sesion exitosamente'
            ]
        );
    }
}