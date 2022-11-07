import 'package:flutter/material.dart';

import 'package:enermax_uno/src/screens/screen_drawer.dart';

import '../ui/google_maps.dart';

class Transito extends StatelessWidget {
  const Transito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const ScreenDrawer(),
        appBar: AppBar(
          title: const Text('Tránsito Mapas'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF6E86E7),
                  Color(0xE3005CA7),
                ],
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: const GoogleTransito());
  }
}
