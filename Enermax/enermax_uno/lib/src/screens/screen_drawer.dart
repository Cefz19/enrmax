import 'package:flutter/material.dart';

class ScreenDrawer extends StatelessWidget {
  const ScreenDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF75ACEB),
                  Color(0xE0458EB8),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0)),
                image: DecorationImage(
                  image: AssetImage('assets/imagenes/logo.png'),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
            const _ListTitleWiidget(
              icon: Icons.error_outline,
              text: "Home",
            ),
            const _ListTitleWiidget(
              icon: Icons.sync,
              text: "Sincronizar",
            ),
            const _ListTitleWiidget(
              icon: Icons.logout,
              text: "Cerrar sesion",
            ),
          ],
        ),
      ),
    );
  }
}

class _ListTitleWiidget extends StatelessWidget {
  final String text;
  final IconData icon;

  const _ListTitleWiidget({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        text,
        style: const TextStyle(
            fontFamily: 'Barlow', fontSize: 16.0, color: Colors.black),
      ),
    );
  }
}
