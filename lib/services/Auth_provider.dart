// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, file_names, overridden_fields

import 'package:flutter/material.dart';
import 'package:mo_time_tracker/services/Auth.dart';

class AuthProvider extends InheritedWidget {
  final Authbase auth;
  @override
  final Widget child;
  AuthProvider({required this.child, required this.auth}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static Authbase of(BuildContext context) {
    AuthProvider? provider =
        context.dependOnInheritedWidgetOfExactType<AuthProvider>();
    return provider!.auth;
  }
}
