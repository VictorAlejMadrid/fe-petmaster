import 'package:flutter/material.dart';

class PetMasterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PetMasterAppBar({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF564BD6),
      title: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bem vindo,',
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
            Text(
              name,
              style: TextStyle(
                fontFamily: "LeckerliOne",
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout_rounded),
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
      ],
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
