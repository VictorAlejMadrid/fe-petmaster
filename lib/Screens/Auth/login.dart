import 'package:dio/dio.dart';
import 'package:fe_petmaster/Components/Auth/button.dart';
import 'package:fe_petmaster/Components/Auth/input.dart';
import 'package:fe_petmaster/Components/Auth/logo.dart';
import 'package:fe_petmaster/data/service/auth_service.dart';
import 'package:fe_petmaster/routes.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.authService});

  final AuthService authService;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  final _registrationNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleLogin() async {
    setState(() => _isLoading = true);

    final data = await widget.authService.signInWithRegistrationAndPassword(
      _registrationNumberController.text,
      _passwordController.text,
    );

    if (data is DioException) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    if (data["data"]["firstAccess"] == true) {
      Navigator.pushNamed(context, Routes.firstAccess);
    } else {
      Navigator.pushNamed(context, Routes.home);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(color: Color(0xFF0F3956)),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 32.0),
                    Logo(),
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
                      keyboardType: TextInputType.number,
                      label: "Matrícula",
                      hint: "digite seu número de matrícula",
                      controller: _registrationNumberController,
                    ),
                    SizedBox(height: 16.0),
                    AuthInputText(
                      keyboardType: TextInputType.visiblePassword,
                      label: "Senha",
                      hint: "digite sua senha",
                      controller: _passwordController,
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      constraints: BoxConstraints.expand(height: 24.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/resetPassword");
                        },
                        child: Text(
                          "Esqueci minha senha",
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    AuthButton(
                      text: "ENTRAR",
                      onPressed: () => _handleLogin(),
                      isLoading: _isLoading,
                    ),
                    SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, "/register"),
                      child: Text(
                        "Não tenho conta",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 60.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
