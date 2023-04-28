<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->post('/usuarios', ['uses' => 'Users\StoreUserController@store', 'as' => 'users.store']);
$router->post('/login', ['uses' => 'Users\LoginUserController@login', 'as' => 'login']);
$router->post('/logout', ['uses' => 'Users\LogoutUserController@logout', 'as' => 'logout']);

$router->group(['middleware' => 'auth'], function () use ($router) {
    $router->get('/hoteles', ['uses' => 'HotelesController@ObtenerHoteles']);
    //$router->get('/hoteles', ['uses' => 'HotelesController@ObtenerHoteles']);
    $router->get('/hotel/{id}', ['uses' => 'HotelesController@ObtenerHotelPorId']);
    $router->get('/hotelxciudad/{id}', ['uses' => 'HotelesController@ObtenerHotelesPorCiudad']);

    $router->post('/hotel', ['uses' => 'HotelesController@CrearHotel']);
    $router->delete('/hotel/{id}', ['uses' => 'HotelesController@EliminarHotel']);
    $router->post('/hotel/actualizar', ['uses' => 'HotelesController@ActualizarHotel']);

    $router->get('/ciudades', ['uses' => 'CiudadController@ObtenerCiudad']);
    $router->get('/ciudad/{id}', ['uses' => 'CiudadController@ObtenerCiudadPorId']);

    $router->post('/ciudad', ['uses' => 'CiudadController@CrearCiudad']);
    $router->delete('/ciudad/{id}', ['uses' => 'CiudadController@EliminarCiudad']);
});

$router->get('/', function () use ($router) {
    return $router->app->version();
});






