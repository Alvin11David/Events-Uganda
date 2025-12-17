import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen>
    with SingleTickerProviderStateMixin {
  final FocusNode _searchFocus = FocusNode();
  bool _isSearchFocused = false;
  Timer? _countdownTimer;
  Duration _remaining = const Duration(hours: 0, minutes: 0, seconds: 0);

  @override
  void initState() {
    super.initState();
    _startCountdown();
    _searchFocus.addListener(() {
      setState(() {
        _isSearchFocused = _searchFocus.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _searchFocus.dispose();
    super.dispose();
  }

  void _startCountdown() {
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() {
        if (_remaining.inSeconds > 0) {
          _remaining -= const Duration(seconds: 1);
        } else {
          _countdownTimer?.cancel();
        }
      });
    });
  }

  String _fmt(int v) => v.toString().padLeft(2, '0');

  String get countdownText {
    final hours = _remaining.inHours.remainder(24);
    final mins = _remaining.inMinutes.remainder(60);
    final secs = _remaining.inSeconds.remainder(60);
    return '${_fmt(hours)}:${_fmt(mins)}:${_fmt(secs)}';
  }

  Widget _buildPromoCard(
    double screenWidth,
    double screenHeight,
    double promoHeight, {
    String imagePath = 'assets/images/nobgcar.png',
    String mainText = 'GET YOUR SPECIAL CAR BOOKING\n',
    String prefixText = 'UP TO ',
    String percentageText = '30%',
  }) {
    final cardWidth = screenWidth * 0.82;
    return SizedBox(
      width: cardWidth,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: promoHeight,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 12,
                  spreadRadius: 2,
                  offset: const Offset(2, 7),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Montserrat',
                            ),
                            children: [
                              TextSpan(text: mainText),
                              TextSpan(text: prefixText),
                              TextSpan(
                                text: percentageText,
                                style: TextStyle(
                                  color: const Color(0xFFB47A25),
                                  fontSize: screenWidth * 0.06,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'Time Left',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.036,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Abril Fatface',
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.007),
                        Row(
                          children: [
                            Text(
                              countdownText,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 210, 141, 38),
                                fontSize: screenWidth * 0.033,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Montserrat',
                                letterSpacing: 1.2,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.028,
                                vertical: screenHeight * 0.006,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFB47A25),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'BOOK NOW',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.026,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.0),
                  Image.asset(
                    'assets/backgroundcolors/booking.png',
                    width: screenWidth * 0.30,
                    height: screenWidth * 0.30,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -screenWidth * 0.02,
            right: -screenWidth * 0.04,
            child: Image.asset(
              imagePath,
              width: screenWidth * 0.35,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final promoTop =
        screenHeight * 0.15 + screenWidth * 0.12 + screenHeight * 0.02;
    final promoHeight = screenWidth * 0.46;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.0,
              bottom: MediaQuery.of(context).size.height * 0.0,
              right:
                  (MediaQuery.of(context).size.width +
                      MediaQuery.of(context).size.width * 1) /
                  300,
              child: Image.asset(
                'assets/backgroundcolors/normalscreen.png',
                width: MediaQuery.of(context).size.width * 1.08,
                height: MediaQuery.of(context).size.height * 0.9,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: screenHeight * 0.03,
              left: screenWidth * 0.04,
              child: Container(
                width: screenWidth * 0.128,
                height: screenWidth * 0.128,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 7),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.menu_open,
                    color: Colors.black,
                    size: screenWidth * 0.07,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.03,
              right: screenWidth * 0.2,
              child: Container(
                width: screenWidth * 0.128,
                height: screenWidth * 0.128,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 7),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: screenWidth * 0.07,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.03,
              right: screenWidth * 0.04,
              child: Container(
                width: screenWidth * 0.128,
                height: screenWidth * 0.128,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 7),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.notifications_none_rounded,
                    color: Colors.black,
                    size: screenWidth * 0.07,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.122,
              right: screenWidth * 0.04,
              child: Container(
                width: screenWidth * 0.128,
                height: screenWidth * 0.128,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(2, 7),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.tune_rounded,
                    color: Colors.black,
                    size: screenWidth * 0.07,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.13,
              left: screenWidth * 0.04,
              right: screenWidth * 0.2,
              child: Container(
                height: screenWidth * 0.12,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: _isSearchFocused
                        ? const Color(0xFFCC471B)
                        : Colors.transparent,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 12,
                      spreadRadius: 2,
                      offset: const Offset(2, 7),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.04),
                      child: Icon(
                        Icons.search,
                        color: Colors.black.withOpacity(0.5),
                        size: screenWidth * 0.06,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Expanded(
                      child: TextField(
                        focusNode: _searchFocus,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.04,
                          fontFamily: 'Montserrat',
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search for services, vendors',
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: screenWidth * 0.035,
                            fontFamily: 'Montserrat',
                          ),
                          border: InputBorder.none,
                          isDense: true, // Add this
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 0,
                          ), // Change to vertical: 0
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: promoTop,
              left: 0,
              right: 0,
              child: SizedBox(
                height: promoHeight + screenWidth * 0.10,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: Row(
                    children: List.generate(3, (index) {
                      final isLast = index == 2;
                      final images = [
                        'assets/images/nobgcar.png',
                        'assets/images/nobgcake.png',
                        'assets/images/bgcake1.png',
                      ];
                      final promoData = [
                        {
                          'main': 'GET YOUR SPECIAL CAR BOOKING\n',
                          'prefix': 'UP TO ',
                          'percent': '30%',
                        },
                        {
                          'main': 'GET YOUR INTRODUCTION CAKE\n',
                          'prefix': 'SAVE ',
                          'percent': '25%',
                        },
                        {
                          'main': 'LUXURY CAKES AVAILABLE\n',
                          'prefix': 'GET ',
                          'percent': '40%',
                        },
                      ];
                      return Padding(
                        padding: EdgeInsets.only(
                          right: isLast ? 0 : screenWidth * 0.04,
                        ),
                        child: _buildPromoCard(
                          screenWidth,
                          screenHeight,
                          promoHeight,
                          imagePath: images[index],
                          mainText: promoData[index]['main'] as String,
                          prefixText: promoData[index]['prefix'] as String,
                          percentageText: promoData[index]['percent'] as String,
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
