import 'package:flutter/material.dart';

class CheckBoxts extends StatefulWidget {
  const CheckBoxts({Key? key}) : super(key: key);

  @override
  State<CheckBoxts> createState() => _CheckBoxtsState();
}

class _CheckBoxtsState extends State<CheckBoxts> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      Set<CheckBoxts> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      }.cast<CheckBoxts>();
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.green;
    }

    return Checkbox(
      checkColor: Colors.black,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
