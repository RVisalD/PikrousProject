import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pikrous/presentation/pages/auth/signup_page.dart';
import 'package:pikrous/presentation/pages/home.dart';
import '../../api/auth.dart';
import '../../helper/utils/colors.dart';
import '../../helper/utils/preference.dart';
import 'auth/edit_accountpage.dart';

class YourAccountPage extends StatefulWidget {
  const YourAccountPage({Key? key}) : super(key: key);

  @override
  State<YourAccountPage> createState() => _YourAccountPageState();
}

class _YourAccountPageState extends State<YourAccountPage> {
  dynamic userData;
  late int id;
  @override
  void initState() {
    super.initState();
    userData = AppPreference.getUserData();
    id = userData['id'];
  }

  @override
  Widget build(BuildContext context) {
    showDeleteDialog(context) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Delete Account'), // Use widget.title here
            content: const Text(
                "Are you sure you want to Delete Account? It will delete your account permanently!!"),
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
                  'Delete Account',
                  style: TextStyle(color: Colors.redAccent),
                ),
                onPressed: () {
                  Auth().deleteAccount(id, context);
                  AppPreference.clearSaveAccess();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpPage(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        title: const Text(
          'Account Setting',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset('lib/assets/images/me.png'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Displaying user's information
            if (userData != null && userData['name'] != null) ...[
              ListTile(
                title: const Text(
                  'Name:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${userData['name']}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const Divider(),
            ] else ...[
              const Text(
                'No data available',
                style: TextStyle(fontSize: 16),
              ),
            ],
            if (userData != null && userData['email'] != null) ...[
              ListTile(
                title: const Text(
                  'Email:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${userData['email']}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const Divider(),
            ] else ...[
              const Text(
                'No email available',
                style: TextStyle(fontSize: 16),
              ),
            ],
            if (userData != null && userData['phone_number'] != null) ...[
              ListTile(
                title: const Text(
                  'Phone:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${userData['phone_number']}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const Divider(),
            ] else ...[
              const Text(
                'No phone number available',
                style: TextStyle(fontSize: 16),
              ),
            ],
            const ListTile(
              title: Text(
                'Role:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'User',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const Spacer(),
            // Edit and Delete Profile buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfilePage(
                          userData: {},
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Edit Account',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDeleteDialog(context);
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Delete Account',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
