import 'package:fe_petmaster/routes.dart';
import 'package:fe_petmaster/screens/auth/first_acess.dart';
import 'package:fe_petmaster/screens/auth/login.dart';
import 'package:fe_petmaster/screens/auth/reset_password.dart';
import 'package:fe_petmaster/screens/pets.dart';
import 'package:fe_petmaster/screens/products.dart';
import 'package:fe_petmaster/screens/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.resetPassword: (context) => ResetPassword(),
        Routes.firstAccess: (context) => FirstAcess(authService: context.read()),

        Routes.home: (context) => PetsHome(sessionData: context.read(),),
        Routes.products: (context) => Products(sessionData: context.read()),
        Routes.users: (context) => Users(sessionData: context.read()),
      },
      home: Login(authService: context.read()),
    );
  }
}
