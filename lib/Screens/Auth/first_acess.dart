import 'package:dio/dio.dart';
import 'package:fe_petmaster/Components/Auth/button.dart';
import 'package:fe_petmaster/Components/Auth/input.dart';
import 'package:fe_petmaster/Components/Auth/logo.dart';
import 'package:fe_petmaster/data/service/auth_service.dart';
import 'package:fe_petmaster/data/utils/session_data.dart';
import 'package:fe_petmaster/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstAcess extends StatefulWidget {
  FirstAcess({super.key});

  @override
  State<FirstAcess> createState() => _FirstAcessState();
}

class _FirstAcessState extends State<FirstAcess> {
  final TextEditingController _registrationNumberController =
      TextEditingController();

  final TextEditingController _newPasswordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isLoading = false;

  void _handleFirstAccess(AuthService authService) async {
    setState(() => _isLoading = true);

    final data = await authService.signInFirstAccess(
      _registrationNumberController.text,
      _newPasswordController.text,
    );

    if (data is DioException) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil(Routes.home, (route) => false);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sessionData = Provider.of<SessionData>(context);
    final authService = AuthService(sessionData: sessionData);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: const Color(0xFF0F3956)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Logo(),
                Text(
                  "PRIMEIRO ACESSO",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 28.0,
                  ),
                ),
                SizedBox(height: 12.0),
                AuthInputText(
                  label: 'Matrícula',
                  hint: 'digite seu número de matrícula',
                  controller: _registrationNumberController,
                ),
                SizedBox(height: 16.0),
                AuthInputText(
                  label: 'Nova senha',
                  hint: 'digite sua nova senha',
                  controller: _newPasswordController,
                ),
                SizedBox(height: 16.0),
                AuthInputText(
                  label: 'Confirmar Senha',
                  hint: 'digite novamente sua senha',
                  controller: _confirmPasswordController,
                ),
                SizedBox(height: 40.0),
                AuthButton(
                  text: 'ATUALIZAR SENHA',
                  onPressed: () {
                    if (_newPasswordController.text !=
                        _confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "As senhas não coincidem!",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    _handleFirstAccess(authService);
                  },
                  isLoading: _isLoading,
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    _handleFirstAccess(authService);
                  },
                  child: Text(
                    "Voltar para o login",
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
