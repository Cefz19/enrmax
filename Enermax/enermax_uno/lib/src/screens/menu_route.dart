import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:enermax_uno/src/screens/paginas_screen.dart';

class MenuRoute extends StatefulWidget {
  const MenuRoute({Key? key}) : super(key: key);

  @override
  State<MenuRoute> createState() => _MenuRouteState();
}

class _MenuRouteState extends State<MenuRoute> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final screen = [const Disribucion(), const Manifiesto(), const Transito()];
  @override
  Widget build(BuildContext context) {
    final items = [
      const Icon(Icons.local_shipping),
      const Icon(Icons.bookmark_add_sharp),
      const Icon(Icons.map)
    ];
    return Scaffold(
      body: screen[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.black)),
        child: CurvedNavigationBar(
          key: navigationKey,
          height: 35.0,
          color: const Color(0xE10364B4),
          buttonBackgroundColor: Colors.greenAccent,
          backgroundColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 400),
          index: index,
          items: items,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
