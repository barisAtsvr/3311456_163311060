import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextFieldPassword extends StatefulWidget {
  final String? hinttext;
  final String? labeltext;
  const MyTextFieldPassword ({ Key? key, this.hinttext,this.labeltext='Şifre'}): super(key: key);

  @override
  _MyTextFieldPasswordState createState() => _MyTextFieldPasswordState();
}

class _MyTextFieldPasswordState extends State<MyTextFieldPassword> {


  final emailController = TextEditingController();
  bool isPasswordVisible = true;

  FocusNode? myFocusNode;

  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  void dispose() {
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
        hintText: widget.hinttext,
        hintStyle: buildTextStyle(),
        labelText: widget.labeltext,
        labelStyle: buildTextStyle(),
        suffixIcon: IconButton(
          icon: isPasswordVisible
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
          onPressed: () =>
              setState(() => isPasswordVisible = !isPasswordVisible),
        ),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
      ),
      obscureText: isPasswordVisible,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
    );
  }

  OutlineInputBorder buildOutlineInputBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.white));
}

TextStyle buildTextStyle() =>
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
