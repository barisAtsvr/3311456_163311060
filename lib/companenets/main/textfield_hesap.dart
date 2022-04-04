import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MyTextFieldHesap extends StatefulWidget {
  final String? text;
  final double? aralikMin;
  final double? aralikMax;
  final String? errorTextIcerik;
  final String? textTur;
  final TextEditingController? controller;
  const MyTextFieldHesap(
      {Key? key,
      this.text,
      this.textTur,
      this.aralikMin,
      this.aralikMax,
      this.errorTextIcerik, this.controller})
      : super(key: key);

  @override
  _MyTextFieldHesapState createState() => _MyTextFieldHesapState();
}

class _MyTextFieldHesapState extends State<MyTextFieldHesap> {

  String girilenMetin = '';
  String? errorText;
  bool? hesapla;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
            errorText: errorText,
            fillColor: Colors.white,
            filled: true,
            labelText: widget.text,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.textTur!,
                style: TextStyle(
                  color: Color(0xFF494949),
                ),
              ),
            )),
        onChanged: (value) {
          setState(() {
            girilenMetin = value;
            if (int.parse(girilenMetin) < widget.aralikMin! ||
                double.parse(girilenMetin) > (widget.aralikMax!)) {
              errorText = widget.errorTextIcerik;
            } else {
              errorText = '';

            }
          });
        },
        // ignore: deprecated_member_use
        inputFormatters: [
          // ignore: deprecated_member_use
          FilteringTextInputFormatter.allow(RegExp(r"^\d+\.?\d{0,2}")),
        ],
      ),
    );
  }
}
