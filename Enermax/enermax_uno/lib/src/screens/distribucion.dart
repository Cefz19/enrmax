import 'package:flutter/material.dart';

import '../widgets/animated_sync.dart';
import 'package:enermax_uno/src/screens/paginas_screen.dart';
import 'package:enermax_uno/src/widgets/tables_rows.dart';

class Distribucion extends StatefulWidget {
  const Distribucion({Key? key}) : super(key: key);

  @override
  State<Distribucion> createState() => _DistribucionState();
}

class _DistribucionState extends State<Distribucion>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation colorAnimatin;
  late Animation rotateAnimation;

  Future<bool> syncDatabaseFull() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    return Future.value(true);
  }

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 200));
    rotateAnimation =
        Tween<dynamic>(begin: 0.0, end: 360.0).animate(controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ScreenDrawer(),
      appBar: AppBar(
        title: const Text(
          'Distribucíon',
          style: TextStyle(
              fontFamily: 'Barlow', fontSize: 18.0, color: Colors.white),
        ),
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
        actions: <Widget>[
          AnimatedSync(
            animation: rotateAnimation,
            callback: () async {
              controller.forward();
              await syncDatabaseFull();
              controller.stop();
              controller.reset();
            },
          ),
        ],
        centerTitle: true,
      ),
      body: const TablesRows(),
    );
  }
}
