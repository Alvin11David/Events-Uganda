import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive sizing for signupvect – maintains exact 67:91 aspect ratio
    final double vectBaseWidth = screenWidth * 0.18;
    final double vectWidth = vectBaseWidth;
    final double vectHeight = vectBaseWidth * (91 / 67);

    // Added padding from edges for the vectors
    final double edgePadding = screenWidth * 0.08; // Adjust this value to move them further in or out

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Full-screen gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Color(0xFF1BCC94), // #1BCC94
                ],
              ),
            ),
          ),

          // Logo
          Positioned(
            top: screenHeight * 0.0,
            left: (screenWidth - screenWidth * 0.25) / 2,
            child: Image.asset(
              'assets/vectors/logo.png',
              width: screenWidth * 0.30,
              height: screenWidth * 0.30,
              fit: BoxFit.contain,
            ),
          ),

          // Left decorative vector – moved away from left edge
          Positioned(
            top: screenHeight * 0.1,
            left: edgePadding, // Changed from complex calculation to simple padding
            child: Image.asset(
              'assets/vectors/signupvect.png',
              width: vectWidth,
              height: vectHeight,
              fit: BoxFit.contain,
            ),
          ),

          // Right decorative vector – moved away from right edge
          Positioned(
            top: screenHeight * 0.20,
            right: edgePadding, // Changed from complex calculation to simple padding
            child: Image.asset(
              'assets/vectors/signupvect.png',
              width: vectWidth,
              height: vectHeight,
              fit: BoxFit.contain,
            ),
          ),

          // Title text
          Positioned(
            top: screenHeight * 0.03 +
                screenWidth * 0.22 +
                screenHeight * 0.015,
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                "Let's get you\nsorted!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),

          // Main content on the right side
          SafeArea(
            child: Row(
              children: [
                // Left side - empty space
                const Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),

                // Right side - form area
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Content will be added here step by step
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}