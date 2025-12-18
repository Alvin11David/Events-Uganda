import 'package:events_uganda/Auth/Auth_Screen.dart';
import 'package:events_uganda/Intro/Onboarding_Screen1.dart';
import 'package:events_uganda/Intro/Onboarding_Screen2.dart';
import 'package:events_uganda/Intro/Onboarding_Screen3.dart';
import 'package:events_uganda/Other%20Screens/Splash_Screen.dart';
import 'package:events_uganda/Users/Customers/Customer_Home_Screen.dart';
import 'package:events_uganda/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Events Uganda',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );
  }
}

