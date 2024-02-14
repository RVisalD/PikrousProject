import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pikrous/api/endpoint/doctor_endpoint.dart';
import 'package:pikrous/presentation/pages/doctors/view_all_doctor.dart';

import '../../../helper/utils/colors.dart';
import 'package:http/http.dart' as http;

import '../../../helper/utils/constants.dart';

class EditDoctor extends StatefulWidget {
  final int id;
  final String name;
  final String email;
  final String password;
  final String descrption;
  final String experienceYear;
  final String expertise;
  const EditDoctor({
    Key? key,
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.descrption,
    required this.experienceYear,
    required this.expertise,
  }) : super(key: key);

  @override
  State<EditDoctor> createState() => _EditDoctorState();
}

final TextEditingController _expertiseController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _yearExperienceController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _descriptionController = TextEditingController();
final TextEditingController _nameController = TextEditingController();

bool showPassword = true;

class _EditDoctorState extends State<EditDoctor> {
  updatedoctor() async {
    final response = await http.put(
      Uri.parse(apiLink + DoctorEndPoint.editdoctor(widget.id)),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': _emailController.text,
        'name': _nameController.text,
        'password': _passwordController.text,
        'description': _descriptionController.text,
        'experience_year': _yearExperienceController.text,
        'expertise': _expertiseController.text
      }),
    );

    if (response.statusCode == 200) {
      print("User data updated in the database");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ViewALlDoctors()));
    } else {
      print("Failed to update user data: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      // Set initial values to the controllers
      _nameController.text = widget.name;
      _emailController.text = widget.email;
      _expertiseController.text = widget.expertise;
      _descriptionController.text = widget.descrption;
      _yearExperienceController.text = widget.experienceYear;
      _passwordController.text = widget.password;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Create a Doctor Account',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
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
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: widget.name,
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '*** This Name will be the real and full name of the doctor ***',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
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
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: widget.email,
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '*** This Email is used for doctor to login ***',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
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
              child: TextField(
                controller: _expertiseController,
                decoration:  InputDecoration(
                  hintText: widget.expertise,
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '*** What does the doctor specializes in? ***',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
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
              child: TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: widget.descrption,
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '*** Give the doctorsome description. ***',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
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
              child: TextField(
                controller: _yearExperienceController,
                decoration: InputDecoration(
                  hintText: widget.experienceYear,
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '*** Give the doctor some description. ***',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
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
              child: TextField(
                controller: _passwordController,
                obscureText: showPassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off),
                  ),
                  hintText: 'Enter the new password for the doctor',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '*** This password is used to for the doctor to login. ***',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (_nameController.text.isEmpty ||
                    _emailController.text.isEmpty ||
                    _passwordController.text.isEmpty ||
                    _expertiseController.text.isEmpty ||
                    _yearExperienceController.text.isEmpty ||
                    _descriptionController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('All fields must be filled in.')),
                  );
                  return;
                }
                setState(() {
                  updatedoctor();
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0XFFF7D8BB7),
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
                child: const Center(
                  child: Text(
                    'Save Changes',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
