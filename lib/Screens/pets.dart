import 'dart:convert';

import 'package:fe_petmaster/Components/Card/PetProfileCard.dart';
import 'package:fe_petmaster/Components/pet_master_app_bar.dart';
import 'package:fe_petmaster/Components/pet_master_navigation_bar.dart';
import 'package:fe_petmaster/routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PetsHome extends StatefulWidget {
  const PetsHome({super.key});

  @override
  State<PetsHome> createState() => _PetsHomeState();
}

class _PetsHomeState extends State<PetsHome> {
  List<Map<String, dynamic>> pets = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPets();
  }

  Future<void> fetchPets() async {
    try {
      final response = await http.get(
        Uri.parse(Routes.pets),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          pets = data.map<Map<String, dynamic>>((pet) => {
            'name': pet['name'],
            'ageInYears': pet['age'],
            'weightInKg': pet['weigth'],
            'gender': pet['gender'] == 'male' ? PetGender.male : PetGender.female,
            'breed': pet['breed'],
            'numIcons': pet['porte'],
          }).toList();
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        // Handle error
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PetMasterAppBar(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: pets.length,
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemBuilder: (context, index) {
                final pet = pets[index];
                return PetProfileCard(
                  imageUrl: pet['imageUrl'],
                  name: pet['name'],
                  ageInYears: pet['ageInYears'],
                  weightInKg: pet['weightInKg'],
                  gender: pet['gender'],
                  breed: pet['breed'],
                  description: pet['description'],
                  numIcons: pet['numIcons'],
                );
              },
            ),
      bottomNavigationBar: PetMasterNavigationBar(currentIndex: 0),
    );
  }
}
