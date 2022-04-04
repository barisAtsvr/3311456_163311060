import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCircleContainerButton extends StatelessWidget {
  final double? widht;
  final double? height;
  final double? size;
  final String? text;
  final VoidCallback? onTap;
  const MyCircleContainerButton({
    Key? key,
    this.widht,
    this.height,
    this.size,
    this.text, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap!,
      child: Center(
        child: Stack(
          children: [
            Center(
              child: Container(
                width: widht,
                height: height,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFEEB20F)),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: widht! - 40,
                  height: height! - 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Container(
                  width: widht! - 50,
                  height: height! - 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFEEB20F)),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Container(
                  width: widht! - 85,
                  height: height! - 85,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Center(
                      child: Text(
                        text!,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: size),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}