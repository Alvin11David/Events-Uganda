import 'dart:async';
import 'package:events_uganda/Auth/Sign_Up_Screen.dart';
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
          left: screenWidth * 0.01,
          top: screenHeight * 0.39,
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
                    fontFamily: 'Poppins',
                    fontSize: screenWidth * 0.11,
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

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final List<Color> _colors = [
    const Color.fromARGB(255, 18, 180, 180),
    Colors.purpleAccent,
    Colors.orangeAccent,
    const Color.fromARGB(255, 208, 44, 98),
    const Color.fromARGB(255, 36, 192, 116),
    const Color.fromARGB(255, 28, 89, 194),
    Colors.yellowAccent,
    Colors.redAccent,
    Colors.tealAccent,
    Colors.indigoAccent,
  ];

  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _animations;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignUpScreen()),
      );
    });
    int totalSquares = 4 * 9; // 4 columns, 8 squares each
    _controllers = List.generate(
      totalSquares,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 700),
      ),
    );
    _animations = List.generate(
      totalSquares,
      (index) =>
          Tween<Offset>(begin: const Offset(0.8, 0), end: Offset.zero).animate(
            CurvedAnimation(
              parent: _controllers[index],
              curve: Curves.easeOutBack,
            ),
          ),
    );

    // Staggered animation
    for (int i = 0; i < totalSquares; i++) {
      Future.delayed(Duration(milliseconds: 120 * i), () {
        if (mounted) _controllers[i].forward();
      });
    }
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    int squareIndex = 0;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          DiagonalLogoText(),
          // Animated squares with staggered slide-in
          for (int i = 0; i < 4; i++)
            Positioned(
              right: (i * 100.0) - 80,
              top: -385,
              child: Transform.rotate(
                angle: -math.pi / 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int j = 0; j < 8; j++)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: SlideTransition(
                          position: _animations[squareIndex],
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: _colors[(i + j) % _colors.length],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Transform.rotate(
                                angle: math.pi / 4,
                                child: Container(
                                  width: screenWidth * 0.045,
                                  height: screenWidth * 0.045,
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                              Positioned(
                                top: 74,
                                left: 32,
                                bottom: -26,
                                child: Transform.rotate(
                                  angle: math.pi / 5,
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
                      )..let((_) => squareIndex++),
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
                    width: 420,
                    height: 420,
                    decoration: BoxDecoration(
                      color: const Color(0xFF31373A), // Hex color #31373A
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.42, // adjust as needed
                    top: screenHeight * 0.02, // adjust as needed
                    child: Transform.rotate(
                      angle: math.pi / 0.1,
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
                    top: screenHeight * 0.02, // adjust as needed
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
                bottom: MediaQuery.of(context).size.height * 0.035,
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
    super.key,
    this.duration = const Duration(seconds: 5),
  });

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

// Helper extension for incrementing squareIndex in a for loop
extension Let<T> on T {
  T let(void Function(T) op) {
    op(this);
    return this;
  }
}
