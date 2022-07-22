import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mo_time_tracker/App/sign_in_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mo Tracker',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const SignInPage());
  }
}
