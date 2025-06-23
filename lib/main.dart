import 'package:fe_petmaster/app.dart';
import 'package:fe_petmaster/data/utils/session_data.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider(
      create: (context) => SessionData(registrationNumber: ""),
      child: const App(),
    ),
  );
}
