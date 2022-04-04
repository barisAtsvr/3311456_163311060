import 'package:flutter/material.dart';

class MyExpansionTile extends StatelessWidget {
  final List<Widget>? widget;
  final String? text;
  const MyExpansionTile({
    Key? key,
    this.widget,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ExpansionTile(
        title: Text(
          text!,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFE0E0FB),
        //collapsedBackgroundColor: Color(0xFFE0E0FB),
        children: widget!,
      ),
    );
  }
}