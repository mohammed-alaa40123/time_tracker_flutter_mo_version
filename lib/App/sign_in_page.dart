// ignore_for_file: prefer_const_constructors, duplicate_ignore, deprecated_member_use, prefer_const_literals_to_create_immutables, avoid_print, use_key_in_widget_constructors, unused_element
import 'package:firebase_core/firebase_core.dart';
import 'package:mo_time_tracker/App/email_sign_in_page.dart';
import 'package:mo_time_tracker/CommonWidgets/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:mo_time_tracker/CommonWidgets/custom_raised_button.dart';
import 'package:provider/provider.dart';

import '../CommonWidgets/show_exeptions_alert_dialog.dart';
import '../services/Auth.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isLoading = false;

  void _showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseException &&
        exception.code == 'ERROR_ABORTED_BY_USER') {
      return;
    }
    showExeptionAlertDialog(context,
        title: "Sign in failed", exception: exception);
  }

  Future<void> _signInAnonomously(BuildContext context) async {
    try {
      setState(() => _isLoading = true);
      final auth = Provider.of<Authbase>(context, listen: false);

      await auth.signInAnonymously();
    } on Exception catch (e) {
      _showSignInError(context, e);
      print(e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      setState(() => _isLoading = true);

      final auth = Provider.of<Authbase>(context, listen: false);
      await auth.signInWithGoogle();
    } on Exception catch (e) {
      _showSignInError(context, e);
      print(e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      setState(() => _isLoading = true);

      final auth = Provider.of<Authbase>(context, listen: false);

      await auth.signInWithFacebook();
    } on FirebaseException catch (e) {
      _showSignInError(context, e);
      print(e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _signInWithEmail(BuildContext context, signIn) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (context) => EmailSignInPage(signIn),
      fullscreenDialog: true,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mo Tracker',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFFFAEBC),
            fontWeight: FontWeight.bold,
            fontFamily: "Splash",
          ),
        ),
        elevation: 4.0,
      ),
      body: _buildContent(context),
      backgroundColor: Color(0xFFffeef1),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: 170,
            ),
            _buildHeader(),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignInButton(
                  color: Color(0xFFFFAEBC),
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  onPressed: () =>
                      _isLoading ? null : _signInWithGoogle(context),
                  text: " Sign in with Google ",
                  asset: 'assets/images/google.png',
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            SignInButton(
              color: Color.fromARGB(255, 255, 255, 255),
              textColor: Colors.blueAccent,
              onPressed: () => _isLoading ? null : _signInWithFacebook(context),
              text: "Sign in with Facebook",
              asset: 'assets/images/facebookpng.png',
            ),
            SizedBox(
              height: 12,
            ),
            CustomRaisedButton(
                borderRadius: 15,
                width: 100,
                height: 20,
                color: Colors.blueAccent,
                onPressed: () =>
                    _isLoading ? null : _signInWithEmail(context, true),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Sign in with Email",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: "Forte",
                          fontStyle: FontStyle.normal,
                        )),
                    Icon(
                      Icons.email_rounded,
                      color: Color(0xFFFFAEBC),
                    )
                  ],
                )),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Or",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFFFAEBC),
                    fontFamily: "Splash",
                  ),
                ),
                InkWell(
                    onTap: () =>
                        _isLoading ? null : _signInWithEmail(context, false),
                    child: Text(
                      "    Create an account  ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF448AFF),
                          fontFamily: "Forte",
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            CustomRaisedButton(
                borderRadius: 15,
                width: 100,
                height: 20,
                color: Colors.blueAccent,
                onPressed: () => _signInAnonomously(context),
                child: Text("Go Anonymous",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: "Forte",
                      fontStyle: FontStyle.normal,
                    ))),
          ],
        ));
  }

  Widget _buildHeader() {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    {
      return Text(
        "Sign in",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            fontFamily: "Splash",
            color: Color(0xFFFFAEBC)),
      );
    }
  }
}
