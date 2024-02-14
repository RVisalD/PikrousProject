import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pikrous/api/endpoint/doctor_endpoint.dart';
import 'package:pikrous/helper/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:pikrous/presentation/pages/admin/edit_doctor.dart';

import '../../../api/endpoint/home_endpoint.dart';
import '../../../helper/utils/constants.dart';
import '../../../helper/utils/preference.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ViewALlDoctors extends StatefulWidget {
  const ViewALlDoctors({super.key});

  @override
  State<ViewALlDoctors> createState() => _ViewALlDoctorsState();
}

List<String> names = [];
List<String> passwords = [];
List<String> experienceYears = [];
List<String> emails = [];
List<String> descriptions = [];
List<int> ids = [];
List<String> expertise = [];
dynamic userData;

class _ViewALlDoctorsState extends State<ViewALlDoctors> {
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
            ids = doctors.map((item) => item['id'] ?? '').cast<int>().toList();
            names = doctors
                .map((item) => item['name'] ?? '')
                .cast<String>()
                .toList();
            passwords = doctors
                .map((item) => item['password'] ?? '')
                .cast<String>()
                .toList();
            emails = doctors
                .map((item) => item['email'] ?? '')
                .cast<String>()
                .toList();
            experienceYears = doctors
                .map((item) => item['experience_year'] ?? '')
                .cast<String>()
                .toList();
            descriptions = doctors
                .map((item) => item['expertise'] ?? '')
                .cast<String>()
                .toList();
            expertise = doctors
                .map((item) => item['expertise'] ?? '')
                .cast<String>()
                .toList();
          } else {
            print('Invalid data structure: $data');
            names = [];
            expertise = [];
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

  deleteAccount(int id, context) async {
    final response = await http.delete(
      Uri.parse(apiLink + DoctorEndPoint.deletedoctor(id)),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, int>{
        'id': id,
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ViewALlDoctors()),
      );
      log('Correct!!!');
    } else {
      log('incorrect');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('All Doctors'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: index > 0 ? 10 : 0,
                      ),
                      Slidable(
                        direction: Axis.horizontal,
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          extentRatio: 0.32,
                          children: [
                            SlidableAction(
                              backgroundColor:
                                  const Color.fromARGB(255, 138, 47, 154),
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              onPressed: (context) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditDoctor(
                                              id: ids[index], name: names[index], email: emails[index], password: passwords[index],descrption: descriptions[index],experienceYear: experienceYears[index],expertise: expertise[index],
                                            )));
                              },
                            ),
                            SlidableAction(
                              backgroundColor: const Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              onPressed: (context) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Delete Doctor"),
                                      content: const Text(
                                          "Are you sure you want to delete this doctor?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          child: const Text("Cancel"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // Call the deleteAccount function
                                            deleteAccount(ids[index], context);
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          child: const Text("Delete"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        child: Container(
                          color: const Color(0XFFFEEEEEE),
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 20),
                                    child: Image.asset(
                                      'lib/assets/images/me.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          child: Text(
                                            names[index],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(expertise[index]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
