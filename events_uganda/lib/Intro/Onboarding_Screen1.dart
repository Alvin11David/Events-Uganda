import 'dart:ui';
import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
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
              'assets/backgroundcolors/onboardingscreen1.png',
              width: MediaQuery.of(context).size.width * 1.08,
              height: MediaQuery.of(context).size.height * 0.9,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            // Adjust 'top' to place it below cake1.jpg
            top: screenHeight * 0.52, // Example value, tweak as needed
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
            top: screenHeight * 0.60,
            left: (screenWidth - (screenWidth * 0.25)) / 2,
            child: Row(
              children: [
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
            top: screenHeight * 0.63,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Your Dream Starts\nHere',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.065,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.725,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'So let\'\s get you the special\ncompany to make your\nparty and ideas come to\nlife',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'PlayfairDisplay',
                ),
              ),
            ),
          ),
          Positioned(
            // Adjust 'top' to place it below cake1.jpg
            top: screenHeight * 0.62, // Example value, tweak as needed
            left: -screenWidth * 0.09,
            child: Image.asset(
              'vectors/onboardingscreen1vect.png',
              width: screenWidth * (118 / 390),
              height: screenWidth * (140 / 390),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            // Adjust 'top' to place it below cake1.jpg
            top: screenHeight * 0.82, // Example value, tweak as needed
            right: -screenWidth * 0.06,
            child: Image.asset(
              'vectors/onboardingscreen1vect.png',
              width: screenWidth * (118 / 390),
              height: screenWidth * (140 / 390),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: screenWidth * 0.15, // Add margin from left
            right: screenWidth * 0.15,
            bottom:
                screenHeight *
                0.05, // Adjust as needed for spacing from the bottom
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF7EED27), Colors.black],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.26, 0.8],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.018,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/vectors/heart.png',
                        width: screenWidth * 0.07, // Responsive width
                        height: screenWidth * 0.07,
                      ),
                      Expanded(
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.06,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // keyboard_double_arrow_right icon on the far right
                      Icon(
                        Icons.keyboard_double_arrow_right,
                        color: Colors.white,
                        size: screenWidth * 0.09,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Place this inside your widget tree (e.g., in the body of your Scaffold)
          Stack(
            alignment: Alignment.topCenter,
            children: [
              // 4th card (bottom)
              Positioned(
                top: screenHeight * 0.04,
                child: Transform.rotate(
                  angle: 0,
                  child: _buildCard(
                    'assets/images/bdgal4.jpg',
                    screenWidth,
                    screenHeight,
                    0.92,
                    0.34,
                  ),
                ),
              ),
              // 3rd card
              Positioned(
                top: screenHeight * 0.06,
                child: Transform.rotate(
                  angle: -0.035,
                  child: _buildCard(
                    'assets/images/introduction.jpg',
                    screenWidth,
                    screenHeight,
                    0.92,
                    0.36,
                  ),
                ),
              ),
              // 2nd card
              Positioned(
                top: screenHeight * 0.1,
                child: Transform.rotate(
                  angle: -0.056,
                  child: _buildCard(
                    'assets/images/introductionbride.jpg',
                    screenWidth,
                    screenHeight,
                    0.92,
                    0.38,
                  ),
                ),
              ),
              // 1st card (top)
              Positioned(
                top: screenHeight * 0.15,
                child: Transform.rotate(
                  angle: -0.088,
                  child: _buildCard(
                    'assets/images/women.jpg',
                    screenWidth,
                    screenHeight,
                    0.92,
                    0.40,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    String imagePath,
    double screenWidth,
    double screenHeight,
    double widthFactor,
    double? heightFactor,
  ) {
    return Container(
      width: screenWidth * widthFactor,
      height: screenHeight * (heightFactor ?? 0.25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}
