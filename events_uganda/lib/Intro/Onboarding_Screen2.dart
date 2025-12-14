import 'dart:ui';
import 'package:flutter/material.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold (
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.0,
            right:  (MediaQuery.of(context).size.width +
                    MediaQuery.of(context).size.width * 1) /
                300,
            child: Image.asset(
              'assets/backgroundcolors/onboardingscreen2.png',
              width: MediaQuery.of(context).size.width * 1.08,
              height: MediaQuery.of(context).size.height * 0.9,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: screenHeight * 0.04,
            left: screenWidth * 0.04,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/images/tent1.jpg',
                width: screenWidth * (122/390),
                height: screenHeight * (233/844),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ]
      )
    );
  }
}