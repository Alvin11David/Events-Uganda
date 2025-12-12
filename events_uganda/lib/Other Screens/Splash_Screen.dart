import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DiagonalLogoText extends StatelessWidget {
  const DiagonalLogoText({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final offset = 0.15 * screenHeight;

    return Stack(
      children: [
        Positioned(
          left: screenWidth * 0.0,
          top: screenHeight * 0.35,
          child: Transform.rotate(
            angle: 0.95,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/vectors/logo.png',
                  width: screenWidth * 0.18,
                  height: screenWidth * 0.18,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: screenWidth * 0.04),
                Text(
                  'Events Uganda',
                  style: TextStyle(
                    fontFamily: 'Abril Fatface',
                    fontSize: screenWidth * 0.1,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          DiagonalLogoText(),
          // Create 4 diagonal columns
          for (int i = 0; i < 4; i++)
            Positioned(
              right: (i * 100.0) - 80, // Position from right side
              top: -330, // Start higher up
              child: Transform.rotate(
                angle: -math.pi / 5, // Rotate 30 degrees
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Create 6 squares per column
                    for (int j = 0; j < 7; j++)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ), // Gap between squares
                        child: Stack(
                          clipBehavior:
                              Clip.none, // Allow heart to show outside the box
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
                              bottom:
                                  -26, // Position the heart in the gap below the square
                              child: Transform.rotate(
                                angle:
                                    math.pi /
                                    5, // Counter-rotate to keep the heart upright
                                child: Image.asset(
                                  'assets/vectors/heart.png',
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
            right:
                screenWidth *
                0.50, // Adjust to position partially off-screen if needed
            bottom: screenHeight * 0.00, // Adjust to position at the bottom
            child: Transform.rotate(
              angle: 55 * (math.pi / 180), // Convert 50 degrees to radians
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 470,
                    height: 470,
                    decoration: BoxDecoration(
                      color: const Color(0xFF31373A), // Hex color #31373A
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.42, // adjust as needed
                    top: screenHeight * 0.01, // adjust as needed
                    child: Transform.rotate(
                      angle: math.pi /0.1,
                      child: Image.asset(
                        'assets/vectors/diamondrings.png',
                        width: screenWidth * 0.32,
                        height: screenHeight * 0.16,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.72, // adjust as needed
                    top: screenHeight * 0.06, // adjust as needed
                    child: Transform.rotate(
                      angle: math.pi / 0.7,
                      child: Image.asset(
                        'assets/vectors/diamondrings1.png',
                        width: screenWidth * 0.36,
                        height: screenHeight * 0.19,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.99, // adjust as needed
                    top: screenHeight * 0.1, // adjust as needed
                    child: Transform.rotate(
                      angle: math.pi / 0.6,
                      child: Image.asset(
                        'assets/vectors/goldenring.png',
                        width: screenWidth * 0.55,
                        height: screenHeight * 0.25,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.04,
              ),
              child: BouncingDotsLoader(),
            ),
          ),
        ],
      ),
    );
  }
}

class BouncingDotsLoader extends StatefulWidget {
  final Duration duration;
  const BouncingDotsLoader({
    Key? key,
    this.duration = const Duration(seconds: 5),
  }) : super(key: key);

  @override
  _BouncingDotsLoaderState createState() => _BouncingDotsLoaderState();
}

class _BouncingDotsLoaderState extends State<BouncingDotsLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  static const int dotCount = 4;
  late Timer _timer;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        _progress += 50 / widget.duration.inMilliseconds;
        if (_progress >= 1.0) {
          _progress = 1.0;
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final baseDotSize = screenWidth * 0.04;
    final spacing = screenWidth * 0.03;

    // Animate color and size in the last 2 seconds
    final isFinishing = _progress > 0.6;
    final finishPercent = isFinishing ? (_progress - 0.6) / 0.4 : 0.0;

    return SizedBox(
      height: baseDotSize * 2 * (1 + finishPercent * 0.5),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(dotCount, (i) {
              final t = (_animation.value + i / dotCount) % 1.0;
              final bounce = (1 - (t - 0.5).abs() * 2).clamp(0.0, 1.0);
              final dotSize = baseDotSize * (1 + finishPercent * 0.5);
              final color = isFinishing
                  ? Color.lerp(Colors.white, Colors.green, finishPercent)!
                  : Colors.white;
              return Container(
                margin: EdgeInsets.symmetric(horizontal: spacing / 2),
                child: Transform.translate(
                  offset: Offset(0, -bounce * dotSize * 1.2),
                  child: Container(
                    width: dotSize,
                    height: dotSize,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: color.withOpacity(0.4),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
