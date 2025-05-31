import 'package:fe_petmaster/Components/pet_master_app_bar.dart';
import 'package:fe_petmaster/Components/pet_master_navigation_bar.dart';
import 'package:flutter/material.dart';

class PetsHome extends StatelessWidget {
  const PetsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PetMasterAppBar(),
      body: Container(),
      bottomNavigationBar: PetMasterNavigationBar(currentIndex: 0),
    );
  }
}
