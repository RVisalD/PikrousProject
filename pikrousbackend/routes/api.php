<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\MainController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Auth API Route
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::delete('/deleteAccount/{id}', [AuthController::class, 'deleteAccount']);
Route::put('/editAccount/{id}', [AuthController::class, 'editAccount']);

// Main Page API Route
Route::get('/alldoctor', [MainController::class, 'alldoctor']);

Route::post('createdoctor', [MainController::class, 'createdoctor']);