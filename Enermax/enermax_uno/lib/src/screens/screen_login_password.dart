import 'package:ener_prueba/src/navbottom/button_green.dart';
import 'package:flutter/material.dart';

import '../navbottom/input_decoration.dart';

class ScreenLoginPassword extends StatelessWidget {
  const ScreenLoginPassword({Key? key}) : super(key: key);

  BuildContext get context => (context);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [cajaBicolor(size), iconoLogo(), loginForm()],
      ),
    ));
  }

  SingleChildScrollView loginForm() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 350),
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            //height: 340,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white38,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Column(
              children: [
                const Text('Bienvenido',
                    style: TextStyle(
                        fontFamily: 'Barlow',
                        fontSize: 25.0,
                        color: Colors.white)),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        decoration: InputDecorations.inputDecoration(
                            hintext: 'ejemplo@hotmail.com',
                            labeltext: 'Correo electroníco',
                            icono: const Icon(Icons.alternate_email_rounded)),
                        validator: (value) {
                          String pantter =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regExp = RegExp(pantter);
                          return regExp.hasMatch(value ?? '')
                              ? null
                              : 'El valor ingresado no es un correo';
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        autocorrect: false,
                        obscureText: true,
                        decoration: InputDecorations.inputDecoration(
                            hintext: '************',
                            labeltext: 'Contraseña',
                            icono: const Icon(Icons.lock_clock_outlined)),
                        validator: (value) {
                          return (value != null && value.length >= 6)
                              ? null
                              : 'La contraseña debe se mayor o igual a los 6 caracteres';
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ButtonGreen('Inicio')
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            'Crear una nueva cuenta',
            style: TextStyle(fontFamily: 'Barlow', fontSize: 18),
          )
        ],
      ),
    );
  }

  SafeArea iconoLogo() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 150),
        width: double.infinity,
        child: const Image(
          image: AssetImage('assest/imagenes/logo1.png'),
        ),
      ),
    );
  }

  Container cajaBicolor(Size size) {
    return Container(
      decoration: const BoxDecoration(
        // ignore: unnecessary_const
        gradient: const LinearGradient(
          colors: [
            Color(0xFF6E86E7),
            Color(0xE3005CA7),
          ],
        ),
      ),
      width: double.infinity,
      height: size.height * 1,
    );
  }
}
