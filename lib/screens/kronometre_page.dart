import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:v3311456_163311060/companenets/main/kronometre_circle_button.dart';

class KronometrePage extends StatefulWidget {
  @override
  _KronometrePageState createState() => _KronometrePageState();
}

class _KronometrePageState extends State<KronometrePage> {
  List<String> list = [];
  bool isStart = false;
  String startStop = 'START';
  int saat = 0;
  int dakika = 0;
  int saniye = 0;
  int milisaniye = 0;
  Timer? _timer;
  void _start() {
    setState(() {
      isStart = !isStart;
      if (isStart) {
        startStop = 'STOP';
        const oneSec = const Duration(milliseconds: 1);
        _timer = new Timer.periodic(
          oneSec,
          (Timer timer) => setState(() {
            milisaniye++;
            if (milisaniye == 100) {
              saniye++;
              milisaniye = 0;
            }
            if (saniye == 60) {
              saniye = 0;
              dakika++;
            }
            if (dakika == 60) {
              dakika = 0;
              saat++;
            }
          }),
        );
      } else {
        startStop = 'START';
        _timer!.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$saat : $dakika : $saniye : $milisaniye",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 220,
                  child: Stack(children: [
                    Positioned(
                      top: 0,
                      left: 85,
                      child: MyCircleContainerButton(
                        onTap: () {
                          _start();
                        },
                        widht: 150,
                        height: 150,
                        size: 15,
                        text: startStop,
                      ),
                    ),
                    Positioned(
                        top: 105,
                        left: 5,
                        child: MyCircleContainerButton(
                          onTap: () {
                            setState(() {
                              saniye = 0;
                              milisaniye = 0;
                              dakika = 0;
                              saat = 0;
                            });
                          },
                          widht: 115,
                          height: 115,
                          text: 'Sıfır',
                          size: 15,
                        )),
                    Positioned(
                        top: 105,
                        left: 200,
                        child: MyCircleContainerButton(
                          onTap: () {
                            setState(() {
                              list.add("$saat : $dakika : $saniye : $milisaniye");
                            });
                          },
                          widht: 115,
                          height: 115,
                          text: 'Tur',
                          size: 15,
                        ))
                  ]),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: (Text(list[index])),
                          leading: Icon(Icons.alarm_sharp),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
