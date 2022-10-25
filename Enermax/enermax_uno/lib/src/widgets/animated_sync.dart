import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimatedSync extends AnimatedWidget {
  VoidCallback callback;
  AnimatedSync(
      {Key? key, required Animation<dynamic> animation, required this.callback})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<dynamic>? animation = listenable as Animation<dynamic>?;
    return Transform.rotate(
      angle: animation!.value,
      child:
          IconButton(icon: const Icon(Icons.sync), onPressed: () => callback()),
    );
  }
}
