import 'package:flutter/material.dart';

import 'package:enermax_uno/src/screens/screen_drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      body: Column(children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          child: const GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(21.1236, 101.68), zoom: 10.0),
            zoomGesturesEnabled: true,
          ),
        )
      ]),
    );
  }
}
