import 'package:flutter/cupertino.dart';

class BuyukContainerResim extends StatelessWidget {
  final String? imageName;
  const BuyukContainerResim({this.imageName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15,),
        Container(
          //padding: EdgeInsets.only(right: 5,left: 5),
          width: 140,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
                image: AssetImage('images/$imageName'),
                fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}