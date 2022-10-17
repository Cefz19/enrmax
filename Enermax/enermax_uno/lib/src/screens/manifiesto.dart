import 'package:ener_prueba/src/screens/paginas_screen.dart';
import 'package:flutter/material.dart';

class Manifiesto extends StatelessWidget {
  const Manifiesto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ScreenDrawer(),
      appBar: AppBar(
        title: const Text('Manifíesto'),
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
    );
  }
}
