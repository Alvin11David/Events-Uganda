import 'dart:ui';

import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final diameter = screenWidth * 0.9; // Responsive, nearly full width
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Top center image
          Positioned(
            top: MediaQuery.of(context).size.height * 0.0, // adjust as needed
            right:
                (MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width * 0.5) /
                60,
            child: Image.asset(
              'assets/backgroundcolors/signupscreen.png',
              width:
                  MediaQuery.of(context).size.width * 1.18, // responsive width
              height:
                  MediaQuery.of(context).size.height *
                  0.9, // responsive height
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.04,
            left: MediaQuery.of(context).size.width * 0.04,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                color: const Color(0xFFCB9FE4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                  size: MediaQuery.of(context).size.width * 0.10,
                )
              )
            )
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.04,
            left: (MediaQuery.of(context).size.width - MediaQuery.of(context).size.width * 0.25) / 2,
            child: Image.asset(
              'assets/vectors/logo.png',
              width: MediaQuery.of(context).size.width * 0.30,
              height: MediaQuery.of(context).size.width * 0.30,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.07 + MediaQuery.of(context).size.width * 0.22 + MediaQuery.of(context).size.height * 0.015,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Let's get you\n signed up!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: MediaQuery.of(context).size.width * 0.075,
                  fontWeight: FontWeight.bold,
                ),
              )
            )
          )
        ],
      ),
    );
  }
}
