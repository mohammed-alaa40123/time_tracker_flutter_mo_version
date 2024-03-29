// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mo_time_tracker/CommonWidgets/custom_raised_button.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton(
      {required String text,
      required Color color,
      required Color textColor,
      required VoidCallback onPressed,
      asset,
      Text? child})
      : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(text,
                  textWidthBasis: TextWidthBasis.longestLine,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontFamily: "Forte",
                    fontStyle: FontStyle.normal,
                  )),
              SizedBox(
                height: 30,
                width: 70,
                child: Image.asset(asset!),
              ),
            ],
          ),
          color: color,
          borderRadius: 15,
          height: 30,
          onPressed: onPressed,
        );
}
