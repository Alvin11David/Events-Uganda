import 'package:flutter/material.dart';
import 'dart:math' as math;
class SplashScreen extends StatelessWidget {
  // List of attractive colors
  final List<Color> _colors = [
    Colors.cyanAccent,
    Colors.purpleAccent,
    Colors.orangeAccent,
    Colors.pinkAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.yellowAccent,
    Colors.redAccent,
    Colors.tealAccent,
    Colors.indigoAccent,
  ];

   SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Create 4 diagonal columns
          for (int i = 0; i < 4; i++)
            Positioned(
              right: (i * 100.0) - 80, // Position from right side
              top: -340, // Start higher up
              child: Transform.rotate(
                angle: -math.pi / 5, // Rotate 30 degrees
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Create 6 squares per column
                    for (int j = 0; j < 7; j++)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0), // Gap between squares
                        child: Stack(
                          clipBehavior: Clip.none, // Allow heart to show outside the box
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 80, // Reduced width
                              height: 80, // Reduced height
                              decoration: BoxDecoration(
                                // Cycle through colors based on position
                                color: _colors[(i + j) % _colors.length],
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Positioned(
                              top: 74,
                              left: 32,
                              bottom: -26, // Position the heart in the gap below the square
                              child: Transform.rotate(
                                angle: math.pi / 5, // Counter-rotate to keep the heart upright
                                child: Image.asset(
                                  'assets/images/heart.png',
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Positioned(
            left: -200, // Adjust to position partially off-screen if needed
            bottom: -60, // Adjust to position at the bottom
            child: Transform.rotate(
              angle: 55 * (math.pi / 180), // Convert 50 degrees to radians
              child: Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  color: const Color(0xFF31373A), // Hex color #31373A
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}