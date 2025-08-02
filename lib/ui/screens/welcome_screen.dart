import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travello/constants/color.dart';
import 'package:travello/routes/routes_screen.dart';
import 'package:travello/ui/widgets/button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: SingleChildScrollView(
          child: Hero(
            tag: 'screenforward',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/image/hello.svg',
                  height: 400.h,
                  width: double.infinity.w,
                ),
                Text(
                  'Discover Your \n Dream Job here',

                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: MyColor.bgcolor,
                    fontWeight: FontWeight.w500,
                    fontSize: 35.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Explore all the existing job roles based on your \ninterest and study major',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 80.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                      onPressed: () =>
                          Navigator.pushNamed(context, RoutesScreen.login),
                      btncolor: MyColor.bgcolor,
                      textcolor: Colors.white,
                      height: 60,
                      width: 160,
                      title: 'Login',
                    ),
                    SizedBox(width: 10.w),
                    Button(
                      onPressed: () =>
                          Navigator.pushNamed(context, RoutesScreen.signup),
                      btncolor: Colors.white,
                      textcolor: Colors.black,
                      height: 60,
                      width: 160,
                      title: 'Register',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
