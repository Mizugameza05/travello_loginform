import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travello/constants/color.dart';
import 'package:travello/routes/routes_screen.dart';
import 'package:travello/ui/widgets/button.dart';
import 'package:travello/ui/widgets/icon_logo.dart';
import 'package:travello/ui/widgets/user_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    'Login here',
                    style: GoogleFonts.poppins(
                      color: MyColor.bgcolor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Welcome back you’ve \nbeen missed!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 70.h),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        UserInput(
                          hint: 'Enter your email',
                          label: "Email",
                          hide: false,
                        ),
                        SizedBox(height: 20.h),
                        UserInput(
                          hide: true,
                          hint: 'Enter your password',
                          label: 'Password',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                        context,
                        RoutesScreen.forgot,
                      ),
                      child: Text(
                        'Forgot your password?',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.poppins(
                          color: MyColor.bgcolor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Button(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(
                          context,
                          RoutesScreen.home,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please fix the errors in the form'),
                          ),
                        );
                      }
                    },

                    btncolor: MyColor.bgcolor,
                    textcolor: Colors.white,
                    height: 60,
                    width: 357,
                    title: 'Sign in',
                  ),
                  SizedBox(height: 20.h),
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      RoutesScreen.signup,
                    ),
                    child: Text(
                      'Create new account',
                      style: GoogleFonts.poppins(
                        color: Color(0xff494949),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    'Or continue with',
                    style: GoogleFonts.poppins(
                      color: MyColor.bgcolor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconLogo(logo: FontAwesomeIcons.google),
                      SizedBox(width: 7.w),
                      IconLogo(logo: FontAwesomeIcons.facebook),
                      SizedBox(width: 7.w),
                      IconLogo(logo: FontAwesomeIcons.apple),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
