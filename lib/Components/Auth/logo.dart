import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset("assets/images/logo.svg", width: 175, height: 175),
        SizedBox(height: 16.0),
        Text(
          "PetMaster",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: "LeckerliOne",
            fontSize: 28.0,
          ),
        ),
      ],
    );
  }
}
