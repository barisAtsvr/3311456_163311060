import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String? text;
  final String? imageName;
  const ImageButton({
    @required this.text,
    @required this.imageName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 7,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              //margin: EdgeInsets.only(right: 10),
              height: 80,
              width: 115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/$imageName-700.png'),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Color(0xFFE0E0FB),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))),
              width: 115,
              height: 35,
              child: Center(
                child: Text(
                  text!,
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 7,),
      ],
    );
  }
}
