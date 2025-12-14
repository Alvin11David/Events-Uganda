import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    const teal = Color(0xFF00D4AA);
    const lightTeal = Color(0xFFB3F0E5);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Gradient background (black → dark teal)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Color(0xFF0A2C2A)],
              ),
            ),
          ),
          
          // Teal glow overlay at top
          Positioned.fill(
            child: Align(
              alignment: const Alignment(0, -0.55),
              child: Container(
                width: screen.width * 1.3,
                height: screen.width * 1.0,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      teal.withOpacity(0.65),
                      Colors.transparent
                    ],
                    radius: 0.65,
                  ),
                ),
              ),
            ),
          ),
          
          // Decorative stones - left side
          Positioned(
            top: screen.height * 0.20,
            left: screen.width * 0.10,
            child: Image.asset(
              'assets/vectors/forgotpasswordstone.png',
              width: screen.width * 0.12,
              height: screen.width * 0.12,
              fit: BoxFit.contain,
            ),
          ),
          
          // Decorative stones - right side
          Positioned(
            top: screen.height * 0.18,
            right: screen.width * 0.10,
            child: Image.asset(
              'assets/vectors/forgotpasswordstone.png',
              width: screen.width * 0.12,
              height: screen.width * 0.12,
              fit: BoxFit.contain,
            ),
          ),
          
          // Logo ring at top
          Positioned(
            top: screen.height * 0.03,
            left: (screen.width - screen.width * 0.30) / 2,
            child: Image.asset(
              'assets/vectors/logo.png',
              width: screen.width * 0.30,
              height: screen.width * 0.30,
              fit: BoxFit.contain,
            ),
          ),
          
          // Back button
          Positioned(
            top: screen.height * 0.05,
            left: screen.width * 0.05,
            child: Material(
              color: lightTeal,
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => Navigator.of(context).maybePop(),
                child: Container(
                  width: screen.width * 0.13,
                  height: screen.width * 0.13,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: screen.width * 0.065,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          
          // Heading "Let's get you sorted!"
          Positioned(
            top: screen.height * 0.16,
            left: 0,
            right: 0,
            child: Text(
              "Let's get you\nsorted!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: screen.width * 0.08,
                fontWeight: FontWeight.w800,
                height: 1.2,
              ),
            ),
          ),
          
          // White form container
          Positioned(
            top: screen.height * 0.30,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: screen.width * 0.08,
                vertical: screen.height * 0.03,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Mail icon circle
                    Container(
                      width: screen.width * 0.18,
                      height: screen.width * 0.18,
                      decoration: BoxDecoration(
                        color: teal,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: teal.withOpacity(0.25),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.mail_rounded,
                        color: Colors.black,
                        size: screen.width * 0.10,
                      ),
                    ),
                    SizedBox(height: screen.height * 0.025),
                    
                    // Title
                    Text(
                      "Forgot Your Password?",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: screen.width * 0.048,
                      ),
                    ),
                    SizedBox(height: screen.height * 0.015),
                    
                    // Subtitle
                    Text(
                      'Please enter your email address below\nto receive an OTP code.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        fontSize: screen.width * 0.036,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: screen.height * 0.035),
                    
                    // Email input field
                    _RoundedField(
                      controller: _emailController,
                      label: 'Email',
                      hint: 'Enter Your Email Address',
                      icon: Icons.person_rounded,
                      focusNode: _emailFocus,
                      textInputAction: TextInputAction.done,
                      accent: teal,
                    ),
                    SizedBox(height: screen.height * 0.04),
                    
                    // Submit button
                    SizedBox(
                      width: double.infinity,
                      height: screen.width * 0.12,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [lightTeal, teal],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: teal.withOpacity(0.25),
                              blurRadius: 10,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            // Validate email
                            if (_emailController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please enter your email address'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }
                            
                            if (!_emailController.text.contains('@')) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please enter a valid email address'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }
                            
                            // TODO: Send OTP to email
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('OTP sent to ${_emailController.text}'),
                                backgroundColor: teal,
                              ),
                            );
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screen.width * 0.045,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screen.height * 0.08),
                    
                    // Sign in link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screen.width * 0.037,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // TODO: Navigate to sign in screen
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: teal,
                              fontSize: screen.width * 0.040,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screen.height * 0.02),
                  ],
                ),
              ),
            ),
          ),
          
          // Decorative stone - bottom left
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/vectors/forgotpasswordstone.png',
              width: screen.width * 0.35,
              height: screen.width * 0.35,
              fit: BoxFit.contain,
            ),
          ),
          
          // Decorative stone - bottom right
          Positioned(
            bottom: screen.height * 0.15,
            right: 0,
            child: Image.asset(
              'assets/vectors/forgotpasswordstone.png',
              width: screen.width * 0.30,
              height: screen.width * 0.30,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

class _RoundedField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final Color accent;

  const _RoundedField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    required this.focusNode,
    required this.textInputAction,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label above the field
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: screen.width * 0.038,
              fontWeight: FontWeight.w700,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        
        // Text field
        SizedBox(
          height: screen.width * 0.14,
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            textInputAction: textInputAction,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              fontSize: screen.width * 0.042,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat',
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.40),
                fontSize: screen.width * 0.038,
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
              ),
              prefixIcon: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: screen.width * 0.055,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(color: accent, width: 1.4),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(color: accent, width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}