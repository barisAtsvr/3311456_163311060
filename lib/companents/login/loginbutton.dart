
import 'package:flutter/material.dart';

//import 'screens/login_page.dart';
class LoginButton extends StatelessWidget {
  final String? text;
  final VoidCallback? fonks;

  final Color? color;
  final Color? textColor;


  //final Function fonks;
  LoginButton({@required this.text,this.fonks,this.color,this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: fonks,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text!,
          style: TextStyle(
              fontSize: 20, color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(),
          ),
        ),
      ),
    );
  }
}