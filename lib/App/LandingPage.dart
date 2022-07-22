// ignore_for_file: override_on_non_overriding_member, prefer_const_constructors, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mo_time_tracker/App/sign_in_page.dart';
import 'package:mo_time_tracker/App/HomePage.dart';
import 'package:mo_time_tracker/services/Auth.dart';

class LandingPage extends StatelessWidget {
  final Authbase auth;
  const LandingPage({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: auth.authStateChange(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            return SignInPage(
              auth: auth,
            );
          }
          return HomePage(
            auth: auth,
          );
        }
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
