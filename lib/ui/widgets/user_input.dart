import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInput extends StatefulWidget {
  final String? hint;
  final String? label;
  final bool hide;
  const UserInput({super.key, required this.hide, this.hint, this.label});

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '${widget.label ?? 'This field'} cannot be empty';
            }
            if (widget.hide) {
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
            } else {
              if (value.length < 3) {
                return 'Username must be at least 3 characters';
              }
            }

            return null;
          },

          obscureText: widget.hide ? true : false,
          decoration: InputDecoration(
            hintText: widget.hint!,
            hintStyle: TextStyle(color: Color(0xff626262)),
            labelText: widget.label!,
            filled: true,
            fillColor: Color(0xffF1F4FF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: Colors.blueGrey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: Colors.blueGrey),
            ),
          ),
        ),
      ],
    );
  }
}
