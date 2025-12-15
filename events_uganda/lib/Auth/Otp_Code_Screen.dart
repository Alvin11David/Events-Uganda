import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Otp_Code_Screen extends StatefulWidget {
  const Otp_Code_Screen({super.key});

  @override
  State<Otp_Code_Screen> createState() => _Otp_Code_Screen();
}

class _Otp_Code_Screen extends State<Otp_Code_Screen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Top center image
          Positioned(
            top: 0,
            right: (screenWidth + screenWidth * 1) / 300,
            child: Image.asset(
              'assets/backgroundcolors/otpcodescreen.png',
              width: screenWidth * 1.08,
              height: screenHeight * 0.9,
              fit: BoxFit.contain,
            ),
          ),
          
          // Back button
          Positioned(
            top: screenHeight * 0.04,
            left: screenWidth * 0.04,
            child: Container(
              width: screenWidth * 0.15,
              height: screenWidth * 0.15,
              decoration: BoxDecoration(
                color: const Color(0xFF825E34),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                  size: screenWidth * 0.10,
                ),
              ),
            ),
          ),
          
          // Logo at top center
          Positioned(
            top: 0,
            left: (screenWidth - screenWidth * 0.30) / 2,
            child: Image.asset(
              'assets/vectors/logo.png',
              width: screenWidth * 0.30,
              height: screenWidth * 0.30,
              fit: BoxFit.contain,
            ),
          ),
          
          // Decorative vector - right side
          Positioned(
            top: screenHeight * 0.2,
            left: (screenWidth - screenWidth * 0.25) / 1,
            child: Image.asset(
              'assets/vectors/otpcodevect.png',
              width: screenWidth * 0.18,
              height: screenWidth * 0.18,
              fit: BoxFit.contain,
            ),
          ),
          
          // Decorative vector - left side
          Positioned(
            top: screenHeight * 0.15,
            right: (screenWidth - screenWidth * 0.23) / 1,
            child: Image.asset(
              'assets/vectors/otpcodevect.png',
              width: screenWidth * 0.18,
              height: screenWidth * 0.18,
              fit: BoxFit.contain,
            ),
          ),
          
          // Main heading text
          Positioned(
            top: screenHeight * 0.03 + screenWidth * 0.22 + screenHeight * 0.015,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Let's get you\nsorted!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: screenWidth * 0.075,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          
          // White container with form
          Positioned(
            top: screenHeight * 0.10 + screenWidth * 0.22 + screenHeight * 0.015 + screenWidth * 0.13,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            bottom: 0,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Email icon positioned at the top center
                  Positioned(
                    top: -screenWidth * 0.12,
                    left: (screenWidth * 0.92 - screenWidth * 0.24) / 2,
                    child: Container(
                      width: screenWidth * 0.24,
                      height: screenWidth * 0.24,
                      decoration: BoxDecoration(
                        color: Color(0xFF825E34),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                          size: screenWidth * 0.13,
                        ),
                      ),
                    ),
                  ),
                  
                  // Content
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.06,
                      left: screenWidth * 0.04,
                      right: screenWidth * 0.04,
                      bottom: 0,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Verify Your Email",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: screenWidth * 0.06,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: screenWidth * 0.035,
                                ),
                                children: [
                                  TextSpan(text: 'Please enter the 4 digit code we sent to '),
                                  TextSpan(
                                    text: 'emailaddress@gmail.com',
                                    style: TextStyle(
                                      color: Color(0xFF825E34),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          _OtpPinFields(
                            onCompleted: (code) {
                              debugPrint('OTP entered: $code');
                            },
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          SizedBox(
                            width: screenWidth * 0.8,
                            child: Column(
                              children: [
                                // Resend button
                                SizedBox(
                                  width: double.infinity,
                                  height: screenWidth * 0.13,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(color: Color(0xFF825E34), width: 1.2),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                      backgroundColor: Colors.white,
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: screenWidth * 0.08,
                                          height: screenWidth * 0.08,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Color(0xFF825E34), width: 1.0),
                                          ),
                                          child: Icon(Icons.replay, color: Color(0xFF825E34), size: screenWidth * 0.05),
                                        ),
                                        SizedBox(width: 12),
                                        Text(
                                          'Resend',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w800,
                                            fontSize: screenWidth * 0.045,
                                            fontFamily: 'Montserrat',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: screenWidth * 0.04),
                                
                                // Verify button
                                SizedBox(
                                  width: double.infinity,
                                  height: screenWidth * 0.13,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Verify action
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [Color(0xFFB8915A), Color(0xFF825E34)],
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Verify',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: screenWidth * 0.045,
                                            fontFamily: 'Montserrat',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account? ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth * 0.038,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Handle sign in tap
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Color(0xFF825E34),
                                    fontSize: screenWidth * 0.040,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OtpPinFields extends StatefulWidget {
  final void Function(String)? onCompleted;
  const _OtpPinFields({this.onCompleted});

  @override
  State<_OtpPinFields> createState() => _OtpPinFieldsState();
}

class _OtpPinFieldsState extends State<_OtpPinFields> {
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.length == 1) {
      if (index < 3) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        FocusScope.of(context).unfocus();
        final code = _controllers.map((c) => c.text).join();
        if (widget.onCompleted != null) widget.onCompleted!(code);
      }
    } else if (value.isEmpty) {
      if (index > 0) {
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (i) {
        final hasValue = _controllers[i].text.isNotEmpty;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: SizedBox(
            width: width * 0.15,
            height: width * 0.15,
            child: TextField(
              controller: _controllers[i],
              focusNode: _focusNodes[i],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(1)
              ],
              style: TextStyle(
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                counterText: '',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: hasValue ? Color(0xFF825E34) : Colors.grey.shade300,
                    width: hasValue ? 1.5 : 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF825E34), width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: (val) => _onChanged(i, val),
            ),
          ),
        );
      }),
    );
  }
}