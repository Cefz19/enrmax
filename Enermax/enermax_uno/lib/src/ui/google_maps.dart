// ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleTransito extends StatefulWidget {
  const GoogleTransito({Key? key}) : super(key: key);

  @override
  State<GoogleTransito> createState() => _GoogleTransitoState();
}

class _GoogleTransitoState extends State<GoogleTransito> {
  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGoolgePlex =
      CameraPosition(target: LatLng(21.1236, 101.68), zoom: 10.0);

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799, target: LatLng(21.1236, 101.68));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: _kGoolgePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Ruta'),
        icon: Icon(Icons.directions_transit_filled_rounded),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
