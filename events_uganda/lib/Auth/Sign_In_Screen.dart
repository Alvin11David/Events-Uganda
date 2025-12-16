import 'package:events_uganda/Auth/Sign_Up_Screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _contactFocus = FocusNode();

  final bool obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    const accent = Color(0xFFCC471B);
    const peach = Color(0xFFF7CBB8);
    const socialBg = Color(0xFFF4D7C7);
    const lightGrad = Color(0xFFE8C7B6);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Gradient background (black → deep orange)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Color.fromARGB(255, 231, 9, 9)],
              ),
            ),
          ),
          // Orange glow overlay at top
          Positioned.fill(
            child: Align(
              alignment: const Alignment(0, -0.55),
              child: Container(
                width: screen.width * 1.3,
                height: screen.width * 1.0,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      const Color.fromARGB(255, 243, 67, 8).withOpacity(0.65),
                      Colors.transparent,
                    ],
                    radius: 0.65,
                  ),
                ),
              ),
            ),
          ),
          // Decorative vectors
          Positioned(
            top: screen.height * 0.20,
            left: screen.width * 0.10,
            child: Image.asset(
              'assets/vectors/signupvect.png',
              width: screen.width * 0.12,
              height: screen.width * 0.12,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: screen.height * 0.18,
            right: screen.width * 0.10,
            child: Image.asset(
              'assets/vectors/signupvect.png',
              width: screen.width * 0.12,
              height: screen.width * 0.12,
              fit: BoxFit.contain,
            ),
          ),
          // Logo ring
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
            child: Container(
              width: screen.width * 0.13,
              height: screen.width * 0.13,
              decoration: BoxDecoration(
                color: peach,
                borderRadius: BorderRadius.circular(16),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: screen.width * 0.065,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.of(context).maybePop(),
              ),
            ),
          ),
          // Heading
          Positioned(
            top: screen.height * 0.16,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "Let's get you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: screen.width * 0.08,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "signed in!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: screen.width * 0.08,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          // Form container
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
                    Text(
                      "Sign In",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: screen.width * 0.05,
                      ),
                    ),
                    SizedBox(height: screen.height * 0.006),
                    Text(
                      'Please enter the details to continue.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Abril Fatface',
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: screen.width * 0.035,
                      ),
                    ),
                    SizedBox(height: screen.height * 0.03),
                    _ResponsiveTextField(
                          controller: _emailController,
                          label: 'Email',
                          hint: 'Enter Your Email',
                          icon: Icons.mail,
                          focusNode: _emailFocus,
                          nextFocusNode: _passwordFocus,
                          textInputAction: TextInputAction.next,
                        ),
                    SizedBox(height: screen.height * 0.022),
                     _ResponsiveTextField(
                          controller: _passwordController,
                          label: 'Password',
                          hint: 'Enter Your Password',
                          icon: Icons.lock,
                          focusNode: _passwordFocus,
                          nextFocusNode: _contactFocus,
                          textInputAction: TextInputAction.next,
                        ),
                    SizedBox(height: screen.height * 0.016),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: screen.width * 0.02),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screen.width * 0.038,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screen.height * 0.028),
                    // Sign In button
                    SizedBox(
                      width: double.infinity,
                      height: screen.width * 0.12,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                           border: Border.all(
                              color: const Color(0xFFCB471B),
                              width: 1,
                            ),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [lightGrad, accent],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: accent.withOpacity(0.25),
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
                            // TODO: hook up sign-in
                          },
                          child: Text(
                            'Sign In',
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
                    SizedBox(height: screen.height * 0.028),
                    // Divider
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(color: Colors.grey, thickness: 0.8),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screen.width * 0.02,
                          ),
                          child: Text(
                            'Or Sign Up With',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: screen.width * 0.035,
                              fontFamily: 'Epunda Slab',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(color: Colors.grey, thickness: 0.8),
                        ),
                      ],
                    ),
                    SizedBox(height: screen.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _SocialBtn(
                          bg: socialBg,
                          asset: 'assets/vectors/google.png',
                          size: screen.width * 0.16,
                        ),
                        SizedBox(width: screen.width * 0.06),
                        _SocialBtn(
                          bg: socialBg,
                          asset: 'assets/vectors/apple.png',
                          size: screen.width * 0.16,
                        ),
                      ],
                    ),
                    SizedBox(height: screen.height * 0.025),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: accent,
                              fontSize: screen.width * 0.040,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screen.height * 0.015),
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

class _RoundedField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final TextInputAction textInputAction;
  final Color accent;
  final bool isPassword;

  const _RoundedField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    required this.focusNode,
    required this.nextFocusNode,
    required this.textInputAction,
    required this.accent,
    this.isPassword = false,
  });

  @override
  State<_RoundedField> createState() => _RoundedFieldState();
}

class _RoundedFieldState extends State<_RoundedField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: screen.width * 0.14,
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        obscureText: _obscure,
        style: TextStyle(
          fontSize: screen.width * 0.042,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: screen.width * 0.038,
            fontWeight: FontWeight.w700,
          ),
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.55),
            fontSize: screen.width * 0.040,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              widget.icon,
              color: Colors.white,
              size: screen.width * 0.055,
            ),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () => setState(() => _obscure = !_obscure),
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: widget.accent, width: 1.4),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: widget.accent, width: 2),
          ),
        ),
        onSubmitted: (_) =>
            FocusScope.of(context).requestFocus(widget.nextFocusNode),
      ),
    );
  }
}

class _SocialBtn extends StatelessWidget {
  final String asset;
  final Color bg;
  final double size;

  const _SocialBtn({required this.asset, required this.bg, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(size * 0.22),
      child: Image.asset(asset, fit: BoxFit.contain),
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
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    required this.focusNode,
    required this.nextFocusNode,
    required this.textInputAction,
    this.iconColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.8,
      height: screenWidth * 0.13,
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
          prefixIcon: Icon(
            icon,
            color: iconColor ?? const Color.fromARGB(255, 0, 0, 0),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: const Color(0xFFCB471B), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: const Color(0xFFCB471B), width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: const Color(0xFFCB471B), width: 1),
          ),
        ),
        onSubmitted: (_) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        },
      ),
    );
  }
}
