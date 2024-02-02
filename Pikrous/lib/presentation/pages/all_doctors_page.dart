// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pikrous/helper/utils/colors.dart';
import 'package:pikrous/presentation/items/search_bar.dart';
import 'package:pikrous/presentation/pages/all_categories_page.dart';
import 'package:pikrous/presentation/pages/doctor_page.dart';
import 'package:pikrous/presentation/pages/doctors/view_all_doctor.dart';

import '../../api/endpoint/home_endpoint.dart';
import '../../helper/utils/constants.dart';
import '../../helper/utils/preference.dart';
import 'package:http/http.dart' as http;

class AllDoctors extends StatefulWidget {
  const AllDoctors({super.key});

  @override
  State<AllDoctors> createState() => _AllDoctorsState();
}

List<String> names = [];
dynamic userData;

class _AllDoctorsState extends State<AllDoctors> {
  @override
  void initState() {
    super.initState();
    userData = AppPreference.getUserData();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(apiLink + HomeEndPoint.alldoctor),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        setState(() {
          if (data.isNotEmpty && data[0] is List) {
            List<dynamic> doctors = data[0];

            names = doctors
                .map((item) => item['name'] ?? '')
                .cast<String>()
                .toList();
            expertise = doctors
                .map((item) => item['expertise'] ?? '')
                .cast<String>()
                .toList();
          } else {
            print('Invalid data structure: $data');
            names = [];
          }
        });

        print('Example field: $data');
      } else {
        print('Failed to load data. Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Category'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Row(
            children: [
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width / 2,
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const AllCategories())));
                    },
                    child: const Text(
                      'Problems',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: primaryColor, // choose your color
                      width: 2.0, // choose your width
                    ),
                  ),
                ),
                height: 40,
                width: MediaQuery.of(context).size.width / 2,
                child: const Center(
                  child: Text(
                    'Doctors',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SearchBarInput(label: 'Search Problems'),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const DoctorPage()),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      margin: EdgeInsets.only(top: index > 0 ? 20 : 0),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0XFFFEEEEEE), width: 2.0),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: 50,
                            height: 50,
                            child: Image.asset('lib/assets/images/me.png'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 30),
                            child: Text(
                              names[index],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
