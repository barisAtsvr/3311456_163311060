import 'package:flutter/material.dart';

import '../companenets/main/ımage_button.dart';

class AntrenmanlarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            baslikText('Split Body Antrenman'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ImageButton(
                      text: 'Göğüs Triceps 1',
                      imageName: 'gogusarkakol1',
                    ),
                    ImageButton(
                        text: 'Sırt Biceps 1', imageName: 'sırtarkakol1'),
                    ImageButton(text: 'Bacak Shold 1', imageName: 'bacakomuz1'),
                    ImageButton(
                        text: 'Göğüs Triceps 2', imageName: 'gogusarkakol2'),
                    ImageButton(
                        text: 'Sırt Biceps 2', imageName: 'sırtarkakol2'),
                    ImageButton(text: 'Bacak Shold 2', imageName: 'bacakomuz2'),
                  ],
                ),
              ),
            ),
            baslikText('Full Body Antrenman'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ImageButton(text: '5X5', imageName: '5x5'),
                  ImageButton(text: '3X5', imageName: 'bench'),
                  ImageButton(text: 'Değişimli', imageName: 'row'),
                  ImageButton(text: 'Hipertrofi', imageName: 'overheadpress'),
                  ImageButton(text: 'Kuvvet Arttırıcı', imageName: 'dips'),
                ],
              ),
            ),
            baslikText(('Ev Antrenmanları')),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ImageButton(text: 'Gün 1', imageName: 'gün1'),
                  ImageButton(text: 'Gün 2', imageName: 'gün2'),
                  ImageButton(text: 'Gün 3', imageName: 'gün3'),
                ],
              ),
            ),
          ],
        ),
      );

  Container baslikText(String text) {
    return Container(
      width: 400,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          text,
          //textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
