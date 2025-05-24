import 'package:flutter/material.dart';

class AuthInputText extends StatelessWidget {
  const AuthInputText({super.key, required this.label, required this.hint});

  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(bottom: 4.0),
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        AuthTextField(hint: hint),
      ],
    );
  }
}

class AuthTextField extends StatelessWidget {
  const AuthTextField({super.key, required this.hint});

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0x1AD9D9D9)),
      child: TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        cursorWidth: 1.0,
        decoration: InputDecoration(
          hintText: hint,
          counterStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
