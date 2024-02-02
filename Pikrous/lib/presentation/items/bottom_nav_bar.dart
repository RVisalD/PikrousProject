// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:pikrous/presentation/pages/calendar_page.dart';
import 'package:pikrous/presentation/pages/home.dart';

import '../../helper/utils/colors.dart';

class BottomNavBar extends StatefulWidget {
  final int index;
  const BottomNavBar({Key? key, required this.index}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: widget.index == 1 ? const Color(0xfffeeeeee) : Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.home,
                    size: 40,
                  ),
                  color: primaryColor,
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: widget.index == 2 ? const Color(0xfffeeeeee) : Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CalendarPage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.calendar_month_rounded,
                    size: 40,
                  ),
                  color: primaryColor,
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: widget.index == 3 ? const Color(0xfffeeeeee) : Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.message,
                    size: 40,
                  ),
                  color: primaryColor,
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: widget.index == 4 ? const Color(0xfffeeeeee) : Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Image.asset(
                    'lib/assets/images/robot.png',
                    color: primaryColor,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: widget.index == 5 ? const Color(0xfffeeeeee) : Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.people_outline_sharp,
                    size: 40,
                  ),
                  color: primaryColor,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
