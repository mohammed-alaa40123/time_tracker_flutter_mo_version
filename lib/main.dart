import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mo_time_tracker/App/LandingPage.dart';
import 'package:mo_time_tracker/services/Auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mo Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LandingPage(
          auth: Auth(),
        ));
  }
}
