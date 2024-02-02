// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:pikrous/presentation/pages/payment_successful_page.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../helper/utils/colors.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

int index = 1;

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: const Color(0xffffdbff7),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Payment'),
        ),
        body: Container(
          color: const Color(0xffffdbff7),
          child: Column(
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xffffdbff7),
                child: const Center(
                  child: Text(
                    '\$15.00',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                height: MediaQuery.of(context).size.height - 240,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Appointment Payment Method',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                index = 1;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: 50,
                              decoration: BoxDecoration(
                                color: index == 1
                                    ? primaryColor
                                    : const Color(0xfffeeeeee),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  'Credit Card',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                index = 2;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: 50,
                              decoration: BoxDecoration(
                                color: index == 2
                                    ? primaryColor
                                    : const Color(0xfffeeeee),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  'KH QR',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      index == 1
                          ? Column(
                              children: [
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text('Card Number'),
                                      Text(
                                        ' *',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  padding: const EdgeInsets.only(left: 20),
                                  decoration: BoxDecoration(
                                      color: const Color(0xfffeeeeee),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Enter your card number',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2.5,
                                      child: const Row(
                                        children: [
                                          Text('Expiry Date'),
                                          Text(
                                            ' *',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2.5,
                                      child: const Row(
                                        children: [
                                          Text('CVV'),
                                          Text(
                                            ' *',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2.5,
                                      height: 50,
                                      padding: const EdgeInsets.only(left: 20),
                                      decoration: BoxDecoration(
                                          color: const Color(0xfffeeeeee),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Enter Expiry Date',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2.5,
                                      height: 50,
                                      padding: const EdgeInsets.only(left: 20),
                                      decoration: BoxDecoration(
                                          color: const Color(0xfffeeeeee),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Enter CVV',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text('Name'),
                                      Text(
                                        ' *',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  padding: const EdgeInsets.only(left: 20),
                                  decoration: BoxDecoration(
                                      color: const Color(0xfffeeeeee),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Enter your name',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) =>
                                            const PaymentSuccessfulPage()),
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
                                        'Pay Now',
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
                            )
                          : Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: QrImageView(
                                    data: 'Payment by QR Code',
                                    size: 250,
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
