import 'dart:ui';

import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();

}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  // Focus nodes for field navigation
  final FocusNode _fullNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final diameter = screenWidth * 0.9; // Responsive, nearly full width
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Top center image
          Positioned(
            top: MediaQuery.of(context).size.height * 0.0, // adjust as needed
            right:
                (MediaQuery.of(context).size.width +
                    MediaQuery.of(context).size.width * 1) /
                300,
            child: Image.asset(
              'assets/backgroundcolors/signupscreen.png',
              width:
                  MediaQuery.of(context).size.width * 1.08, // responsive width
              height:
                  MediaQuery.of(context).size.height * 0.9, // responsive height
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.04,
            left: MediaQuery.of(context).size.width * 0.04,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                color: const Color(0xFFCB9FE4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                  size: MediaQuery.of(context).size.width * 0.10,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.0,
            left:
                (MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width * 0.25) /
                2,
            child: Image.asset(
              'assets/vectors/logo.png',
              width: MediaQuery.of(context).size.width * 0.30,
              height: MediaQuery.of(context).size.width * 0.30,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left:
                (MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width * 0.15) /
                1,
            child: Image.asset(
              'assets/vectors/signupvect.png',
              width: MediaQuery.of(context).size.width * 0.10,
              height: MediaQuery.of(context).size.width * 0.10,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            right:
                (MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width * 0.15) /
                1,
            child: Image.asset(
              'assets/vectors/signupvect.png',
              width: MediaQuery.of(context).size.width * 0.10,
              height: MediaQuery.of(context).size.width * 0.10,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top:
                MediaQuery.of(context).size.height * 0.03 +
                MediaQuery.of(context).size.width * 0.22 +
                MediaQuery.of(context).size.height * 0.015,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Let's get you\n signed up!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: MediaQuery.of(context).size.width * 0.075,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Positioned(
            top:
                MediaQuery.of(context).size.height * 0.10 +
                MediaQuery.of(context).size.width * 0.22 +
                MediaQuery.of(context).size.height * 0.015 +
                MediaQuery.of(context).size.width * 0.13,
            left: MediaQuery.of(context).size.width * 0.04,
            right: MediaQuery.of(context).size.width * 0.04,
            bottom: 0,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.015,
                  left: 0,
                  right: 0,
                  bottom: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      'Please enter the details below to continue.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Abril Fatface',
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.035,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                    _ResponsiveTextField(
                      controller: _fullNameController,
                      label: 'Full Names',
                      hint: 'Enter Your Full Names',
                      icon: Icons.person,
                      focusNode: _fullNameFocus,
                      nextFocusNode: _emailFocus,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                    _ResponsiveTextField(
                      controller: _emailController,
                      label: 'Email',
                      hint: 'Enter Your Email',
                      icon: Icons.mail,
                      focusNode: _emailFocus,
                      nextFocusNode: _passwordFocus,
                      textInputAction: TextInputAction.next,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResponsiveTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final TextInputAction textInputAction;
  final Color? iconColor;
  final double? fontSize;


  const _ResponsiveTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    required this.focusNode,
    required this.nextFocusNode,
    required this.textInputAction,
    this.iconColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth *0.85,
      height: 40,
      child: TextField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      style: TextStyle(
        fontSize: fontSize ?? screenWidth * 0.045,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: iconColor ?? const Color.fromARGB(255, 0, 0, 0)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: const Color(0xFF8715C9), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: const Color(0xFF8715C9), width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: const Color(0xFF8715C9), width: 1),
        ),
      ),
      onSubmitted: (_) {
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
    ),
    );
  }
}
