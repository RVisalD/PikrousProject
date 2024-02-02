import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pikrous/helper/utils/colors.dart';
import 'package:pikrous/helper/utils/preference.dart';
import 'package:pikrous/presentation/pages/auth/login_page.dart';
import 'package:pikrous/presentation/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference.init();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true
      ),
      home: AppPreference.getSaveAccess() != null
          ? const HomePage()
          : const LoginPage(),
    );
  }
}

