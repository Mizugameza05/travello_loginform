import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconLogo extends StatefulWidget {
  final IconData logo;
  const IconLogo({super.key, required this.logo});

  @override
  State<IconLogo> createState() => _IconLogoState();
}

class _IconLogoState extends State<IconLogo> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          pressed = !pressed;
        });
        Future.delayed(Duration(milliseconds: 100), () {
          setState(() {
            pressed = false;
          });
        });
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        height: 44.h,
        width: 60.w,
        decoration: BoxDecoration(
          color: Color(0xffECECEC),
          borderRadius: pressed
              ? BorderRadius.circular(100.r)
              : BorderRadius.circular(12.r),
        ),
        child: Center(child: FaIcon(widget.logo)),
      ),
    );
  }
}
