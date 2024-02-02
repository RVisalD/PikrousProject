import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pikrous/api/endpoint/auth_endpoint.dart';
import 'package:pikrous/helper/utils/constants.dart';
import 'package:pikrous/helper/utils/preference.dart';
import 'package:pikrous/presentation/pages/auth/login_page.dart';
import 'package:pikrous/presentation/pages/home.dart';

class Auth {
  register(String name, String phonenumber, String email, String password,
      context) async {
    final response = await http.post(
      Uri.parse(apiLink + AuthEndPoint.register),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'phone_number': phonenumber,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    } else {
      log('Something Wrong!!!');
    }
  }

  login(String email, String password, context) async {
    final response = await http.post(
      Uri.parse(apiLink + AuthEndPoint.login),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      log('Correct!!!');

      Navigator.of(context, rootNavigator: true).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
      log(response.body);
      AppPreference.saveAccess('Login');
      final userData = jsonDecode(response.body);
      AppPreference.saveUserData(userData);
    } else if (response.statusCode != 200) {
      log('Wrong!!!');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Wrong Credentials'),
            content: const Text('Please input the correct credentials'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  deleteAccount(int id, context) async {
    final response = await http.delete(
      Uri.parse(apiLink + AuthEndPoint.deleteAccount(id)),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, int>{
        'id': id,
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      log('Correct!!!');
    } else {
      log('incorrect');
    }
  }
}
