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
          // ...other widgets (e.g., your blurred circle)
        ],
      ),
    );
  }
}
