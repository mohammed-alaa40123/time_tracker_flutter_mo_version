// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    required this.child,
    required this.color,
    this.height = 50,
    this.width = 50,
    required this.borderRadius,
    required this.onPressed,
  });
  final Color color;
  final Widget child;
  final double borderRadius;
  final double height;
  final double width;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 50,
            width: 250,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius))),
              color: color,
              onPressed: onPressed,
              child: child,
            )),
      ],
    );
  }
}
