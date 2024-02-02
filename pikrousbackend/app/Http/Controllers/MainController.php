<?php

namespace App\Http\Controllers;

use App\Models\Doctor;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class MainController extends Controller
{
    public function alldoctor(){
        $doctor = Doctor::all();
        return response()->json([$doctor], 200);
    }
    public function createdoctor(Request $req){
        $doctor = DB::table('doctors')->insert([
            'name' => $req->input('name'),
            'expertise' => $req->input('expertise'),
            'description' => $req->input('description'),
            'experience_year' => $req->input('experience_year'),
            'email' => $req->input('email'),
            'password' => Hash::make($req->input('password')),
        ]);
        if ($doctor) {
            return response()->json(['Success'], 200);
        } else {
            return response()->json(['error' => 'Registration failed'], 400);
        }
    }
}
