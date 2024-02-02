// ignore_for_file: library_private_types_in_public_api, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:pikrous/helper/utils/colors.dart';
import 'package:table_calendar/table_calendar.dart';

import '../items/bottom_nav_bar.dart';
import 'all_doctors_page.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  void initState() {
    super.initState();
  }

  String goDate = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Calendar',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TableCalendar(
                    availableCalendarFormats: const {
                      CalendarFormat.month: '',
                    },
                    calendarStyle: const CalendarStyle(
                      todayTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                      selectedTextStyle: TextStyle(
                        color: Colors.black,
                      ),
                      selectedDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor,
                      ),
                    ),
                    focusedDay: DateTime.now(),
                    firstDay: DateTime.now(),
                    lastDay: DateTime(2099, 12, 31),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {});
                    },
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Your Appointments: ',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0XFFFEEEEEE),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => const AllDoctors()),
                                  ),
                                );
                              },
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.63),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Book Appointment",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 120,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            bottom: 20,
            left: 20,
            child: BottomNavBar(
              index: 2,
            ),
          ),
        ],
      ),
    );
  }
}
