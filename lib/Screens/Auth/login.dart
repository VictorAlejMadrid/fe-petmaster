import 'package:fe_petmaster/Components/Auth/button.dart';
import 'package:fe_petmaster/Components/Auth/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFF0F3956)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/logo.svg",
                width: 175,
                height: 175,
              ),
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
              SizedBox(height: 32),
              Text(
                "LOGIN",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 28.0,
                ),
              ),
              SizedBox(height: 12.0),
              AuthInputText(
                label: "Matrícula",
                hint: "digite seu número de matrícula",
              ),
              SizedBox(height: 16.0),
              AuthInputText(label: "Senha", hint: "digite sua senha"),
              SizedBox(height: 8.0),
              Container(
                constraints: BoxConstraints.expand(height: 24.0),
                child: Text(
                  "Esqueci minha senha",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
              SizedBox(height: 24.0),
              AuthButton(text: "ENTRAR", onPressed: () {}),
              SizedBox(height: 8.0),
              Text(
                "Esqueci minha senha",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
