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

    // Responsive sizing for forgotpasswordvect – maintains exact 67:91 aspect ratio
    final double vectBaseWidth = screenWidth * 0.18;
    final double vectWidth = vectBaseWidth;
    final double vectHeight = vectBaseWidth * (91 / 67);

    // Padding from edges for vectors
    final double edgePadding = screenWidth * 0.08;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Full-screen gradient background (black → teal → black blend at bottom)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Color(0xFF1BCC94),
                  Colors.black,
                ],
                stops: [0.0, 0.6, 1.0],
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

          // Left decorative vector
          Positioned(
            top: screenHeight * 0.1,
            left: edgePadding,
            child: Image.asset(
              'assets/vectors/forgotpasswordvect.png',
              width: vectWidth,
              height: vectHeight,
              fit: BoxFit.contain,
            ),
          ),

          // Right decorative vector
          Positioned(
            top: screenHeight * 0.20,
            right: edgePadding,
            child: Image.asset(
              'assets/vectors/forgotpasswordvect.png',
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

          // White container at the bottom
          Positioned(
            top: screenHeight * 0.15 +
                screenWidth * 0.22 +
                screenHeight * 0.015 +
                screenWidth * 0.13,
            left: screenWidth * 0.03,
            right: screenWidth * 0.03,
            bottom: 0,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.hardEdge, // Prevents overflow beyond container borders
                children: [
                  // Top-left forgot password stone – placed inside, hugging the rounded corner
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset(
                      'assets/vectors/forgotpasswordstone.png',
                      width: screenWidth * 0.35,
                      height: screenWidth * 0.35,
                      fit: BoxFit.cover, // Covers the corner area cleanly
                    ),
                  ),

                  // Bottom-right forgot password stone – placed inside, hugging the bottom-right
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/vectors/forgotpasswordstone.png',
                      width: screenWidth * 0.40,
                      height: screenWidth * 0.40,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Scrollable content area (on top of stones)
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.015,
                      left: 0,
                      right: 0,
                      bottom: 0,
                    ),
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: screenHeight * 1.2,
                        ),
                        child: const Column(
                          children: [
                            // Form content will be added here step by step
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Main content on the right side (kept but now covered by white container)
          SafeArea(
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
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