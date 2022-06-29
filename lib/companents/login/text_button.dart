
import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final VoidCallback? fonks;
  final String? text;
  const MyTextButton({
    Key? key, this.fonks,this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: getColor(Colors.white, Colors.black54),
      ),
      onPressed: fonks,
      child: Text(
        text!,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        textAlign: TextAlign.end,
      ),
    );
  }
}

MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
  final getColor = (Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return colorPressed;
    } else {
      return color;
    }
  };
  return MaterialStateProperty.resolveWith(getColor);
}
