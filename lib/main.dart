import 'package:fe_petmaster/app.dart';
import 'package:fe_petmaster/data/service/auth_service.dart';
import 'package:fe_petmaster/data/utils/session_data.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => SessionData(registrationNumber: "", name: ""),
        ),
        Provider(create: (context) => AuthService(sessionData: context.read())),
      ],
      child: const App(),
    ),
  );
}
