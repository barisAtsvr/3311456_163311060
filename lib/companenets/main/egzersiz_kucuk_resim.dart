import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KuucukContainerResim extends StatelessWidget {
  final String? imageName;
  final VoidCallback? onTap;
  const KuucukContainerResim({this.imageName,
    Key? key, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15,),
        GestureDetector(
          onTap: onTap,
          child: Container(
            //padding: EdgeInsets.only(right: 5,left: 5),
            width: 140,
            height: 125,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                  image: AssetImage('images/$imageName'),
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    );
  }
}