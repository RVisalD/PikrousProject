// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pikrous/helper/utils/preference.dart';
import 'package:pikrous/presentation/pages/auth/login_page.dart';
import 'package:pikrous/presentation/pages/doctors/become_doctor.dart';
import 'package:pikrous/presentation/pages/your_account_page.dart';

import '../../helper/utils/colors.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({super.key});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

showLogoutDialog(context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Logout'), // Use widget.title here
        content: const Text("Are you sure you want to logout?"),
        actions: [
          CupertinoDialogAction(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.blueAccent),
            ),
            onPressed: () {
              AppPreference.clearSaveAccess();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        ],
      );
    },
  );
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const YourAccountPage()));
          },
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: primaryColor.withOpacity(0.63),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Your Account')
              ],
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
                    builder: (context) => const BecomeDoctors()));
          },
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.userDoctor,
                  size: 18,
                  color: primaryColor.withOpacity(0.63),
                ),
                const SizedBox(
                  width: 28,
                ),
                const Text('Become a Doctor')
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                Icon(
                  Icons.language,
                  color: primaryColor.withOpacity(0.63),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Change Language')
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  color: primaryColor.withOpacity(0.63),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Setting')
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(left: 4),
            height: 50,
            child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.gift,
                  size: 18,
                  color: primaryColor.withOpacity(0.63),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Rewards')
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                Icon(
                  Icons.history,
                  color: primaryColor.withOpacity(0.63),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('History')
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                Icon(
                  Icons.credit_card,
                  color: primaryColor.withOpacity(0.63),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Payment Method')
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                Icon(
                  Icons.delete,
                  color: primaryColor.withOpacity(0.63),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Delete Account')
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            AppPreference.clearSaveAccess();
            AppPreference.clearUserData();
            showLogoutDialog(context);
          },
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0XFFF808080), width: 2.0),
              ),
            ),
            height: 50,
            child: Row(
              children: [
                Icon(
                  Icons.logout,
                  color: primaryColor.withOpacity(0.63),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Logout')
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
