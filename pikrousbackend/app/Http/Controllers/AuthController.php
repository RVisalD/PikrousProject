<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function register(Request $req)
    {
        $user = DB::table('users')->insert([
            'name' => $req->input('name'),
            'phone_number' => $req->input('phone_number'),
            'email' => $req->input('email'),
            'password' => Hash::make($req->input('password')),
            'role' => 0,
        ]);
        if ($user) {
            return response()->json(['Success'], 200);
        } else {
            return response()->json(['error' => 'Registration failed'], 400);
        }
    }

    public function login(Request $req)
    {
        $user = User::where('email', $req->input('email'))->first();
        try {
            if ($user) {
                if (Hash::check($req->input('password'), $user->password)) {
                    return response()->json($user, 200);
                } else {
                    return response()->json('Wrong Credentials!!!', 400);
                }
            } else {
                return response()->json('Wrong Credentials!!!', 400);
            }
        } catch (\Exception $e) {
            return response()->json($e, 500);
        }
    }
    public function deleteAccount($id){
        $user = User::find($id)->delete();
        if($user){
            return response()->json(['Delete Successfully'], 200);
        }
        else{
            return response()->json(['Delete Fail'], 400);
        }
    }
    public function editAccount($id, Request $request){
        $user = User::find($id);
        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }
        $user->name = $request->input('name');
        $user->email = $request->input('email');
        $user->phone_number = $request->input('phone_number');
        $user->role = 0;

        $user->save();
        return response()->json(['message' => 'User updated successfully', 'user' => $user]);

    }
    
}
