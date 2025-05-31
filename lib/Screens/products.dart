import 'package:fe_petmaster/Components/pet_master_app_bar.dart';
import 'package:fe_petmaster/Components/pet_master_navigation_bar.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PetMasterAppBar(),
      body: Center(child: Text('Products Page')),
      bottomNavigationBar: PetMasterNavigationBar(currentIndex: 1),
    );
  }
}
