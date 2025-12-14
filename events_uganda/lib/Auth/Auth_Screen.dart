import 'dart:ui';
import 'package:events_uganda/Intro/Onboarding_Screen2.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
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
              'assets/backgroundcolors/authscreen.png',
              width: MediaQuery.of(context).size.width * 1.08,
              height: MediaQuery.of(context).size.height * 0.9,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: screenHeight * 0.020,
            left: screenWidth * 0.1,
            child: Transform.rotate(
              angle: 0.663, // -38 degrees in radians
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'images/brideandgroom.jpg',
                  width: screenWidth * (120 / 390),
                  height: screenHeight * (233 / 844),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.010,
            right: screenWidth * 0.02,
            child: Transform.rotate(
              angle: 0.663, // -38 degrees in radians
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'images/cake2.jpg',
                  width: screenWidth * (120 / 390),
                  height: screenHeight * (233 / 844),
                  fit: BoxFit.cover,
                ),
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
            top: screenHeight * 0.320,
            right: screenWidth * 0.05,
            child: Transform.rotate(
              angle: 0.663, // -38 degrees in radians
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'images/deco2.jpg',
                  width: screenWidth * (120 / 390),
                  height: screenHeight * (233 / 844),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.360,
            left: screenWidth * 0.03,
            child: Transform.rotate(
              angle: 0.663, // -38 degrees in radians
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'images/deco5.jpg',
                  width: screenWidth * (120 / 390),
                  height: screenHeight * (233 / 844),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left:
                (screenWidth - (screenWidth * (370 / 390))) /
                2, // Center horizontally
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                child: Container(
                  width: screenWidth * (370 / 390),
                  height: screenHeight * (390 / 844),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1.5,
                    ),
                  ),
                  // child: ... // Add your content here if needed
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
