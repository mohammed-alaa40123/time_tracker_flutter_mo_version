// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_print, non_constant_identifier_names, use_key_in_widget_constructors, prefer_final_fields, unused_field, use_build_context_synchronously, prefer_const_constructors_in_immutables, invalid_required_positional_param, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:mo_time_tracker/App/validators.dart';
import 'package:mo_time_tracker/CommonWidgets/custom_raised_button.dart';
import '../services/Auth_provider.dart';

enum EmailSignInFOrmType { signIn, register }

class EmailSigninForm extends StatefulWidget with EmailAndPasswordValidator {
  late final signInn;
  EmailSigninForm(this.signInn);
  @override
  State<EmailSigninForm> createState() => _EmailSigninFormState();
}

class _EmailSigninFormState extends State<EmailSigninForm> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();

  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  EmailSignInFOrmType _fOrmType = EmailSignInFOrmType.signIn;
  String get _email => _emailTextEditingController.text;
  String get _password => _passwordTextEditingController.text;
  bool _Submitted = false;
  bool _isLoading = false;
  void _Submit() async {
    setState(() {
      _Submitted = true;
      _isLoading = true;
    });
    try {
      final auth = AuthProvider.of(context);
      await Future.delayed(Duration(milliseconds: 500));
      if (_fOrmType == EmailSignInFOrmType.signIn) {
        await auth.signInWithEmailAndPassword(_email, _password);
      } else {
        await auth.createAnAccountWithEmail(_email, _password);
      }
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: widget.signInn
                  ? Text("Sign in failed")
                  : Text("Create an Account failed"),
              content: Text(e.toString()),
              actions: [
                FlatButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Ok"))
              ],
            );
          });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _toggleFormType() {
    setState(() {
      _Submitted = false;
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
    final primaryText =
        (_fOrmType == EmailSignInFOrmType.signIn && widget.signInn)
            ? "Sign in "
            : "Create an account";
    final secondaryText =
        (_fOrmType == EmailSignInFOrmType.signIn && widget.signInn)
            ? "Need an account? Register "
            : "Have an account? Sign in";
    bool submitEnabeled = widget.emailValidator.isValid(_email) &&
        widget.passwordlValidator.isValid(_password) &&
        !_isLoading;
    return [
      _buildEmailTextField(),
      SizedBox(
        height: 8,
      ),
      _buildPasswordTextField(),
      SizedBox(
        height: 8,
      ),
      _buildSignInButton(primaryText),
      SizedBox(
        height: 8,
      ),
      FlatButton(onPressed: _toggleFormType, child: Text(secondaryText))
    ];
  }

  CustomRaisedButton _buildSignInButton(String primaryText) {
    return CustomRaisedButton(
      onPressed: _Submit,
      color: widget.passwordlValidator.isValid(_password)
          ? Colors.blueAccent
          : Colors.blueGrey,
      borderRadius: (5),
      child: Text(primaryText,
          style: TextStyle(
            color: Colors.black,
          )),
    );
  }

  TextFormField _buildEmailTextField() {
    bool showErrorText = _Submitted && !widget.emailValidator.isValid(_email);
    return TextFormField(
      controller: _emailTextEditingController,
      focusNode: _emailFocusNode,
      onChanged: (email) => _updateState(),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email_rounded),
        floatingLabelBehavior:
            FloatingLabelBehavior.never, //Hides label on focus or if filled
        labelText: 'Email',
        errorText: (showErrorText) ? widget.invalidEmailErrorDiscription : null,
        enabled: _isLoading == false,
        hintText: 'text@test.com',
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onEditingComplete: _OnEdiitingComplete,
    );
  }

  late bool showErrorText;
  TextFormField _buildPasswordTextField() {
    showErrorText = _Submitted && !widget.passwordlValidator.isValid(_password);
    return TextFormField(
      focusNode: _passwordFocusNode,
      controller: _passwordTextEditingController,
      obscureText: !_obscured,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (password) => _updateState(),
      decoration: InputDecoration(
        enabled: _isLoading == false,
        errorText:
            (showErrorText) ? widget.invalidPasswordErrorDiscription : null,
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
      onEditingComplete: _Submit,
    );
  }

  void _OnEdiitingComplete() {
    FocusNode newFocus = widget.emailValidator.isValid(_email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _updateState() {
    setState(() {});
  }
}
