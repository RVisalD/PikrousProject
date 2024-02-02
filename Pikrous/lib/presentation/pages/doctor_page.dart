// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:pikrous/helper/utils/colors.dart';
import 'package:pikrous/presentation/pages/payment_page.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

List<String> day = ['2', '3', '4', '5', '6'];
List<String> date = ['Mon', 'Tues', 'Wed', 'Thurs', 'Fri'];
List<String> time1 = ['9:00 AM', '10:00AM', '11:00 AM', '12:00 PM'];
List<String> time2 = ['1:00 PM', '2:00 PM', '3:00 PM', '4:00 PM'];

class _DoctorPageState extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons
                .arrow_back, 
          ),
          onPressed: () {
            Navigator.pop(
                context);
          },
        ),
        title: const Text('Appointment'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Stack(
                    children: [
                      Image.asset(
                        'lib/assets/images/me.png',
                        width: 100,
                        height: 100,
                      ),
                      const Positioned(
                        right: 0,
                        top: 0,
                        child: Icon(
                          Icons.circle,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'Lysa Sorkeo',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  'Menstruation Specialist',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    const Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width / 3.8,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              '50 +',
                              style: TextStyle(fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Center(
                            child: Text(
                              'Patients',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width / 3.8,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              '8 +',
                              style: TextStyle(fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Center(
                            child: Text(
                              'Exp. Year',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width / 3.8,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              '100 +',
                              style: TextStyle(fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Center(
                            child: Text(
                              'Reviews',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'About Doctor',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Dr. Lysa Sorkeo is the top breast cancer specialist in Toul Kork Medical Center. She is availabe for private consultation',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Schedule',
                          style: TextStyle(fontSize: 20),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {}, child: const Text('July >')),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            5,
                            (index) => Container(
                              width: MediaQuery.of(context).size.width / 6.5,
                              height: 70,
                              margin: EdgeInsets.only(left: index > 0 ? 15 : 0),
                              decoration: BoxDecoration(
                                color: index == 2 ? primaryColor : Colors.white,
                                border: Border.all(
                                    color: index == 2
                                        ? primaryColor
                                        : const Color(0XFFFEEEEEE),
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Center vertically
                                children: [
                                  Center(
                                    child: Text(
                                      day[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: index == 2
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      date[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: index == 2
                                              ? Colors.white
                                              : Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Visit Hours',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      child: Column(
                        children: [
                          Row(
                            children: List.generate(
                              4,
                              (index) => Expanded(
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 8.5,
                                    height: 50,
                                    margin: EdgeInsets.only(
                                        left: index > 0 ? 15 : 0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: const Color(0XFFFEEEEEE),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        time1[index],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(
                              height: 20), // Adjusted spacing between rows
                          Row(
                            children: List.generate(
                              4,
                              (index) => Expanded(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 8.5,
                                  height: 50,
                                  margin:
                                      EdgeInsets.only(left: index > 0 ? 15 : 0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: const Color(0XFFFEEEEEE),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      time2[index],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                            builder: ((context) => const PaymentPage()),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        height: 70,
                        child: const Center(
                          child: Text(
                            'Book Appointment',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
