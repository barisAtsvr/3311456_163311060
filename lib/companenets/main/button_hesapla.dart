
import 'package:flutter/material.dart';

class ButtonHesapla extends StatelessWidget {
  final VoidCallback? function;

  const ButtonHesapla({Key? key,  this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child: Icon(
        Icons.send,
        color: Colors.black,
      ),
      style: ElevatedButton.styleFrom(primary: Color(0xFFE0E0FB)),
    );
  }
}
