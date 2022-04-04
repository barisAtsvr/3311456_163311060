import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final Widget? icon;
  final String? hinttext;
  final String? labeltext;
  const MyTextField ({ Key? key, this.icon,this.hinttext,this.labeltext}): super(key: key);


  // ignore: empty_constructor_bodies
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}


class _MyTextFieldState extends State<MyTextField> {

  //final Widget color;
  final controller = TextEditingController();

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
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.black87,
        filled: true,
        hintText: widget.hinttext,
        hintStyle: buildTextStyle(),
        labelText: widget.labeltext,
        labelStyle: buildTextStyle(),
        prefixIcon: widget.icon,
        suffixIcon: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => controller.clear(),
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
