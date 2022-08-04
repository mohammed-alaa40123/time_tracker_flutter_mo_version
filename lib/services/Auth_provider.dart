// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:mo_time_tracker/services/Auth.dart';

class AuthProvider extends InheritedWidget {
  final Authbase auth;

  AuthProvider(this.auth, {required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
