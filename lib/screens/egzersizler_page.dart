import 'package:flutter/material.dart';

import '../companenets/main/egzersiz_buyuk_resim.dart';
import '../companenets/main/egzersiz_kucuk_resim.dart';

class EgzersizlerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          //padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  KuucukContainerResim(imageName: 'egogus.jpg',),
                  BuyukContainerResim(imageName: 'eomuz.JPG',),
                  KuucukContainerResim(imageName: 'earkakol.JPG',),
                  BuyukContainerResim(imageName: 'ebacak.JPG',),
                  KuucukContainerResim(imageName: 'ekisisel.JPG',),
                  SizedBox(height: 10,),

                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BuyukContainerResim(imageName: 'esırt.JPG',),
                  KuucukContainerResim(imageName: 'ebiceps.JPG',),
                  BuyukContainerResim(imageName: 'ekarinkasi.JPG',),
                  KuucukContainerResim(imageName: 'ekardiyo.JPG',),
                  Container(height: 140,),
                  SizedBox(height: 10,),
                ],
              )
            ],
          ),
        ),
      );
}




