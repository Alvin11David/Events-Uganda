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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.0,
            right:
                (MediaQuery.of(context).size.width +
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
            left: screenWidth * 0.02,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/images/tent1.jpg',
                width: screenWidth * (120 / 390),
                height: screenHeight * (233 / 844),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.04,
            right: screenWidth * 0.02,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/images/catering.jpg',
                width: screenWidth * (120 / 390),
                height: screenHeight * (233 / 844),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            top: -screenHeight * 0.05,
            right: screenWidth * 0.345,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'images/couple.jpg',
                width: screenWidth * (120 / 390),
                height: screenHeight * (233 / 844),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top:
                screenHeight *
                0.25, // Adjust this value to place it just below couple.jpg
            right: screenWidth * 0.345,
            child: Container(
              width: screenWidth * (120 / 390),
              height: screenWidth * (120 / 390),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/vectors/logo.png',
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.width * 0.15,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.33,
            left: screenWidth * 0.02,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/images/photography.jpg',
                width: screenWidth * (120 / 390),
                height: screenHeight * (233 / 844),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.33,
            right: screenWidth * 0.02,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/images/carhire1.jpg',
                width: screenWidth * (120 / 390),
                height: screenHeight * (233 / 844),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.422,
            right: screenWidth * 0.345,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'images/cake1.jpg',
                width: screenWidth * (120 / 390),
                height: screenHeight * (233 / 844),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
