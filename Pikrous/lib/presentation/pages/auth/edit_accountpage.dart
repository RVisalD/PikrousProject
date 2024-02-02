// // ignore_for_file: library_private_types_in_public_api

// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../api/endpoint/auth_endpoint.dart';
import '../../../helper/utils/colors.dart';
import '../../../helper/utils/constants.dart';
import '../../../helper/utils/preference.dart';
import '../your_account_page.dart';

class EditProfilePage extends StatefulWidget {
  final Map<String, dynamic> userData;

  const EditProfilePage({Key? key, required this.userData}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late Map<String, dynamic> userData;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? name;
  String? email;
  String? phoneNumber;
  late int id;

  @override
  void initState() {
    super.initState();
    userData = AppPreference.getUserData();
    name = userData['name'] ?? '';
    email = userData['email'] ?? '';
    phoneNumber = userData['phone_number'] ?? '';
    _nameController.text = name ?? '';
    _emailController.text = email ?? '';
    _phoneController.text = phoneNumber ?? '';
    id = userData['id'];
  }

  Future<void> _updateUserData() async {
    String newName = _nameController.text;
    String newEmail = _emailController.text;
    String newPhoneNumber = _phoneController.text;

    try {
      final response = await http.put(
        Uri.parse(apiLink + AuthEndPoint.editAccount(id)),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': newEmail,
          'name': newName,
          'phone_number': newPhoneNumber,
        }),
      );

      if (response.statusCode == 200) {
        print("User data updated in the database");
      } else {
        print("Failed to update user data: ${response.statusCode}");
      }
    } catch (error) {
      print("Error during update: $error");
    }

    // Update the local userData map
    userData['name'] = newName;
    userData['email'] = newEmail;
    userData['phone_number'] = newPhoneNumber;

    AppPreference.saveUserData(userData);

    setState(() {
      name = newName;
      email = newEmail;
      phoneNumber = newPhoneNumber;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const YourAccountPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            _updateUserData();
          },
        ),
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFieldTitle('Name'),
            const SizedBox(height: 10),
            _buildTextField(_nameController, name ?? ''),
            const SizedBox(height: 20),
            _buildFieldTitle('Email'),
            const SizedBox(height: 10),
            _buildTextField(_emailController, email ?? ''),
            const SizedBox(height: 20),
            _buildFieldTitle('Phonenumber'),
            const SizedBox(height: 10),
            _buildTextField(_phoneController, phoneNumber ?? ''),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _updateUserData();
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Save Changes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    controller.text = hintText; // Set initial text in the controller
    controller.selection = TextSelection.fromPosition(
      // Set cursor position to the end
      TextPosition(offset: controller.text.length),
    );
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          hintText = value;
        },
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
