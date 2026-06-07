import 'package:flutter/material.dart';
import 'package:live_scores/screens/auth/register_screen.dart';
import 'package:live_scores/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:live_scores/screens/splash_screen.dart';
import 'firebaseServices/firebase_options.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData(
           scaffoldBackgroundColor: Color(0xffFFFBBD),
      ),
      darkTheme: ThemeData(
          scaffoldBackgroundColor: Color(0xff321325),
      ),
      themeMode:ThemeMode.dark ,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

