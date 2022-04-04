import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextFieldMail extends StatefulWidget {
  @override
  _MyTextFieldMailState createState() => _MyTextFieldMailState();
}

class _MyTextFieldMailState extends State<MyTextFieldMail> {
  final emailController = TextEditingController();

  FocusNode? myFocusNode;

  void initState(){
    super.initState();
    myFocusNode=FocusNode();
  }
  void dispose(){
    myFocusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      //enableInteractiveSelection: false,
      autofocus: false,
      focusNode: myFocusNode,
      style: buildTextStyle(),
      controller: emailController,
      decoration: InputDecoration(
        fillColor: Colors.black87,
        filled: true,
        hintText: 'name@example.com',
        hintStyle: buildTextStyle(),
        labelText: 'Email',
        labelStyle: buildTextStyle(),
        prefixIcon: Icon(Icons.mail,color: Colors.white,),
        suffixIcon: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => emailController.clear(),
        ),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
    );
  }

  OutlineInputBorder buildOutlineInputBorder() => OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.white));
}

TextStyle buildTextStyle() =>
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
