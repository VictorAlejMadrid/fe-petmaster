import 'package:fe_petmaster/Components/pet_master_app_bar.dart';
import 'package:fe_petmaster/Components/pet_master_navigation_bar.dart';
import 'package:fe_petmaster/data/utils/session_data.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  const Users({super.key, required this.sessionData});

  final SessionData sessionData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PetMasterAppBar(name: sessionData.name),
      body: Center(child: Text('Users Page')),
      bottomNavigationBar: PetMasterNavigationBar(currentIndex: 2),
    );
  }
}
