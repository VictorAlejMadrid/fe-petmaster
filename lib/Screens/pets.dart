import 'package:fe_petmaster/Components/pet_master_app_bar.dart';
import 'package:fe_petmaster/Components/pet_master_navigation_bar.dart';
import 'package:fe_petmaster/data/utils/session_data.dart';
import 'package:flutter/material.dart';

class PetsHome extends StatelessWidget {
  const PetsHome({super.key, required this.sessionData});

  final SessionData sessionData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PetMasterAppBar(name: sessionData.name),
      body: Container(),
      bottomNavigationBar: PetMasterNavigationBar(currentIndex: 0),
    );
  }
}
