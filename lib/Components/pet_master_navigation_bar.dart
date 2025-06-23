import 'package:flutter/material.dart';

class PetMasterNavigationBar extends StatelessWidget {
  const PetMasterNavigationBar({super.key, required this.currentIndex});

  final int currentIndex;

  void onItemTapped(int index, BuildContext context) {
    if (index == 0) {
      Navigator.pushNamed(context, '/home');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/products');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF564BD6)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          iconSize: 32,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          elevation: 8,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          backgroundColor: Color(0xFF564BD6),
          currentIndex: currentIndex,
          onTap: (index) {
            onItemTapped(index, context);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Pets'),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2),
              label: 'Produtos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Usuários',
            ),
          ],
        ),
      ),
    );
  }
}
