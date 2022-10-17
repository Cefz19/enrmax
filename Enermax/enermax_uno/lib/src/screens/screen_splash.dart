import 'package:ener_prueba/src/screens/screen_login_password.dart';
import 'package:flutter/material.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<ScreenSplash> {
  @override
  void initState() {
    var d = const Duration(seconds: 4);
    Future.delayed(
        d,
        () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return const ScreenLoginPassword();
              },
            ), (route) => false));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF6E86E7),
                  Color(0xE3005CA7),
                ],
              ),
            ),
            width: double.infinity,
            height: size.height * 1,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 200),
                  width: double.infinity,
                  child: const Image(
                    image: AssetImage('assest/imagenes/logo.png'),
                  ),
                ),
                const Text(
                  'Reparto Enermax',
                  style: TextStyle(
                    fontFamily: 'Barlow',
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(55.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
