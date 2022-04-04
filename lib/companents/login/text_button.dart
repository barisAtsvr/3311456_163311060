
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyTextButton extends StatelessWidget {
  final VoidCallback? fonks;
  const MyTextButton({
    Key? key, this.fonks
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: getColor(Colors.white, Colors.black54),
      ),
      onPressed: fonks,
      child: Text(
        'Şifremi Unuttum >',
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
