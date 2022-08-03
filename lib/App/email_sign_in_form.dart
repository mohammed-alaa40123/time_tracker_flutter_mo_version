// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_print, non_constant_identifier_names, use_key_in_widget_constructors, prefer_final_fields, unused_field, use_build_context_synchronously, prefer_const_constructors_in_immutables, invalid_required_positional_param

import 'package:flutter/material.dart';
import 'package:mo_time_tracker/CommonWidgets/custom_raised_button.dart';
import 'package:mo_time_tracker/services/Auth.dart';

enum EmailSignInFOrmType { signIn, register }

class EmailSigninForm extends StatefulWidget {
  EmailSigninForm(@required this.auth);
  final Authbase auth;
  @override
  State<EmailSigninForm> createState() => _EmailSigninFormState();
}

class _EmailSigninFormState extends State<EmailSigninForm> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();

  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  EmailSignInFOrmType _fOrmType = EmailSignInFOrmType.signIn;
  String get _email => _emailTextEditingController.text;
  String get _password => _passwordTextEditingController.text;
  void _Submit() async {
    try {
      if (_fOrmType == EmailSignInFOrmType.signIn) {
        await widget.auth.signInWithEmailAndPassword(_email, _password);
      } else {
        await widget.auth.createAnAccountWithEmail(_email, _password);
      }
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    }
  }

  void _toggleFormType() {
    setState(() {
      _fOrmType = _fOrmType == EmailSignInFOrmType.signIn
          ? EmailSignInFOrmType.register
          : EmailSignInFOrmType.signIn;
    });
    _emailTextEditingController.clear();
    _passwordTextEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: _buildChildren(),
        ),
      ),
    ]);
  }

  bool _obscured = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  List<Widget> _buildChildren() {
    final primaryText = _fOrmType == EmailSignInFOrmType.signIn
        ? "Sign in "
        : "Create an account";
    final secondaryText = _fOrmType == EmailSignInFOrmType.signIn
        ? "Need an account? Register "
        : "Have an account? Sign in";

    return [
      _buildEmailTextField(),
      SizedBox(
        height: 8,
      ),
      _buildPasswordTextField(),
      SizedBox(
        height: 8,
      ),
      CustomRaisedButton(
        onPressed: _Submit,
        color: Colors.blueAccent,
        borderRadius: (5),
        child: Text(primaryText,
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      SizedBox(
        height: 8,
      ),
      FlatButton(onPressed: _toggleFormType, child: Text(secondaryText))
    ];
  }

  TextFormField _buildEmailTextField() {
    return TextFormField(
      controller: _emailTextEditingController,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email_rounded),
        floatingLabelBehavior:
            FloatingLabelBehavior.never, //Hides label on focus or if filled
        labelText: 'Email',
        hintText: 'text@test.com',
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  TextFormField _buildPasswordTextField() {
    return TextFormField(
      controller: _passwordTextEditingController,
      obscureText: _obscured,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock_open_rounded),
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
          child: InkWell(
            onTap: _toggleObscured,
            child: Icon(
              _obscured
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
              size: 24,
            ),
          ),
        ),
      ),
      textInputAction: TextInputAction.done,
    );
  }
}
