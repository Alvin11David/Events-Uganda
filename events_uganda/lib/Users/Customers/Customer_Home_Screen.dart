import 'dart:ui';
import 'package:events_uganda/Auth/Sign_In_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen>
    with SingleTickerProviderStateMixin {
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
            top: screenHeight * 0.04,
            left: screenWidth * 0.04,
            child: Container(
              width: screenWidth * 0.128,
              height: screenWidth * 0.128,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0,7),
                    )      
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.menu_open,
                  color: Colors.black,
                  size: screenWidth * 0.07,
                ),
              ),
            )
          ),
          Positioned(
            top: screenHeight * 0.04,
            right: screenWidth * 0.04,
            child: Container(
              width: screenWidth * 0.128,
              height: screenWidth * 0.128,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0,7),
                    )      
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.black,
                  size: screenWidth * 0.07,
                ),
              ),
            )
          ),
        ],
        ),
      ),
    );
  }
}
