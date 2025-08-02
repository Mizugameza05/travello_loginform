import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travello/routes/routes_screen.dart';
import 'package:travello/ui/screens/home_screen.dart';
import 'package:travello/ui/screens/login_screen.dart';
import 'package:travello/ui/screens/signup_screen.dart';
import 'package:travello/ui/screens/splash_screen.dart';
import 'package:travello/ui/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // Base size used in UI design (width, height)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesScreen.splash,
          routes: {
            RoutesScreen.splash: (context) => SplashScreen(),
            RoutesScreen.welcome: (context) => WelcomeScreen(),
            RoutesScreen.home: (context) => HomeScreen(),
            RoutesScreen.login: (context) => LoginScreen(),
            RoutesScreen.signup: (context) => SignupScreen(),
          },
        );
      },
    );
  }
}
