import 'package:fe_petmaster/Components/Auth/button.dart';
import 'package:fe_petmaster/Components/Auth/input.dart';
import 'package:fe_petmaster/Components/Auth/logo.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  final TextEditingController _registrationNumberController =
      TextEditingController();

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
              Logo(),
              SizedBox(height: 32),
              Text(
                "RESETAR SENHA",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 28.0,
                ),
              ),
              SizedBox(height: 12.0),
              AuthInputText(
                keyboardType: TextInputType.visiblePassword,
                label: "Matrícula",
                hint: "digite seu número de matrícula",
                controller: _registrationNumberController,
              ),
              SizedBox(height: 42.0),
              AuthButton(text: "RESETAR SENHA", onPressed: () {}),
              SizedBox(height: 8.0),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Voltar para o login",
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
