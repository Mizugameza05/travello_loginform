import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatefulWidget {
  final int height;
  final int width;
  final String? title;
  final Color textcolor;
  final Color btncolor;
  final VoidCallback onPressed;

  const Button({
    super.key,
    required this.onPressed,
    required this.btncolor,
    required this.textcolor,
    required this.height,
    required this.width,
    required this.title,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          pressed = !pressed;
        });
        Future.delayed(Duration(milliseconds: 50), () {
          setState(() {
            pressed = false;
          });
        });
        widget.onPressed();
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        height: widget.height.toDouble().h,
        width: widget.width.toDouble().w,

        decoration: BoxDecoration(
          color: widget.btncolor,
          borderRadius: pressed
              ? BorderRadius.circular(100.r)
              : BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            widget.title!,
            style: GoogleFonts.poppins(
              color: widget.textcolor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
