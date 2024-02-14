<?php

namespace App\Http\Controllers;

use App\Models\Doctor;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class MainController extends Controller
{
    public function alldoctor()
    {
        $doctor = Doctor::all();
        return response()->json([$doctor], 200);
    }
    public function createdoctor(Request $req)
    {
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
    public function deletedoctor($id)
    {
        $user = Doctor::find($id)->delete();
        if ($user) {
            return response()->json(['Delete Successfully'], 200);
        } else {
            return response()->json(['Delete Fail'], 400);
        }
        return response()->json([$id]);
    }
    public function editdoctor($id, Request $req)
    {
        $user = Doctor::find($id);
        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }
        $user->name = $req->input('name');
        $user->expertise = $req->input('expertise');
        $user->description = $req->input('description');
        $user->experience_year = $req->input('experience_year');
        $user->email = $req->input('email');
        $user->password = Hash::make($req->input('password'));

        $user->save();
        return response()->json(['message' => 'User updated successfully', 'user' => $user]);
    }
}
