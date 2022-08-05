// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> showExeptionAlertDialog(BuildContext context,
        {String? title, Exception? exception}) =>
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(title!),
              content: Text(_message(exception!)!),
              actions: [
                FlatButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Ok"))
              ]);
        });

String? _message(Exception exception) {
  if (exception is FirebaseException) {
    return exception.message!;
  }
  return exception.toString();
}
