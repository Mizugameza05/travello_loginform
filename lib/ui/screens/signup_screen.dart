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

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _SignupScreenState extends State<SignupScreen> {
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
                    'Create Account',
                    style: GoogleFonts.poppins(
                      color: MyColor.bgcolor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Create an account so you can explore all the\nexisting jobs",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
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
                        SizedBox(height: 20.h),
                        UserInput(
                          hide: true,
                          hint: 'Confir your password',
                          label: 'Confirm Password',
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
                    title: 'Sign up',
                  ),
                  SizedBox(height: 20.h),
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      RoutesScreen.login,
                    ),
                    child: Text(
                      'Already have an account',
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
