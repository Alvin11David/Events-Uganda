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
          Positioned(
            // Adjust 'top' to place it below cake1.jpg
            top: screenHeight * 0.46, // Example value, tweak as needed
            left:
                (screenWidth - (screenWidth * (600 / 390))) /
                2, // Center horizontally
            child: Image.asset(
              'backgroundcolors/whitebg.png',
              width: screenWidth * (600 / 390),
              height: screenWidth * (600 / 390),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: screenHeight * 0.55,
            left: (screenWidth - (screenWidth * 0.25)) / 2,
            child: Row(
              children: [
                Container(
                  width: screenWidth * 0.06,
                  height: screenHeight * 0.010,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                SizedBox(width: screenWidth * 0.015),
                Container(
                  width: screenWidth * 0.1,
                  height: screenHeight * 0.015,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(width: screenWidth * 0.015),
                Container(
                  width: screenWidth * 0.06,
                  height: screenHeight * 0.010,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.58,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Everything in one\nApp',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.065,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Montserrat',
                )
              )
            )
          ),
          Positioned(
            top: screenHeight * 0.67,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Decoration, Catering,\nPhotography & Videography,\nCar hiring, Sound & Lighting\nservices in one app',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'PlayfairDisplay',
                )
              )
            )
          ),
        ],
      ),
    );
  }
}
