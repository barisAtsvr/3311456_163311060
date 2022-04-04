import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:v3311456_163311060/companenets/main/button_hesapla.dart';
import 'package:v3311456_163311060/companenets/main/my_expansiontile.dart';
import 'package:v3311456_163311060/companenets/main/textfield_hesap.dart';
import 'dart:math';

class HesaplamalarPage extends StatefulWidget {
  @override
  _HesaplamalarPageState createState() => _HesaplamalarPageState();
}

class _HesaplamalarPageState extends State<HesaplamalarPage> {
  TextEditingController? idealKiloBoyContr = TextEditingController();
  TextEditingController? idealKiloAgirlikContr = TextEditingController();
  TextEditingController? yagOraniHesapBoy = TextEditingController();
  TextEditingController? yagOraniHesapBel = TextEditingController();
  TextEditingController? yagOraniHesapBoyun = TextEditingController();
  TextEditingController? kaloriHeesapKiloContrl = TextEditingController();
  TextEditingController? kaloriHesapYagContrl = TextEditingController();

  num? idealKiloBoy, idealKiloAgirlik, yagOraniBoy, yagOraniBel, yagOraniBoyun;
  num idealKiloSonuc = 0,
      yagOraniSonuc = 0,
      yagsizVucutAgirligi = 0,
      bmr = 0,
      kaloriIhtiyaci = 0;
  String kaloriHesapDurum = '';
  String durum = "";

  idealKiloHesapla() {
    setState(() {
      idealKiloBoy = num.parse(idealKiloBoyContr!.text);
      idealKiloBoy = idealKiloBoy! / 100;
      idealKiloAgirlik = num.parse(idealKiloAgirlikContr!.text);
      idealKiloSonuc = idealKiloAgirlik! ~/ (idealKiloBoy! * idealKiloBoy!);
      idealKiloSonuc < 0
          ? durum = 'Zayıf'
          : idealKiloSonuc < 25
              ? durum = 'İdeal'
              : idealKiloSonuc < 30
                  ? durum = 'Kilolu'
                  : durum = 'Obez';
    });
  }

  yagOraniHesapla() {
    setState(() {
      yagOraniSonuc = log(10);
    });
  }

  num? kaloriHesapKilo, kaloriHesapYagOrani;
  kaloriHesapla() {
    setState(() {
      kaloriHesapKilo = num.parse(kaloriHeesapKiloContrl!.text);
      kaloriHesapYagOrani = num.parse(kaloriHesapYagContrl!.text);
      yagsizVucutAgirligi =
          (kaloriHesapKilo! * (100 - kaloriHesapYagOrani!)) / 100;
      bmr = (370 + (21.6 * yagsizVucutAgirligi)).ceil();
      kaloriIhtiyaci = (num.parse(kaloriHesapDurum) * bmr).ceil();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyExpansionTile(
                text: 'İdeal Kilo Hesabı',
                widget: [
                  MyTextFieldHesap(
                    controller: idealKiloBoyContr,
                    text: 'Boy',
                    textTur: 'cm',
                    aralikMin: 140,
                    aralikMax: 240,
                    errorTextIcerik:
                        'Geçersiz boy, en az 140, en fazla 240 olmalı!',
                  ),
                  MyTextFieldHesap(
                    controller: idealKiloAgirlikContr,
                    text: 'Vücut Ağırlığı',
                    textTur: 'kg',
                    aralikMin: 30,
                    aralikMax: 250,
                    errorTextIcerik:
                        'Geçersiz vücut ağırlığı, en az 30, en fazla 250 olmalı!',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonHesapla(
                        function: () {
                          idealKiloHesapla();
                        },
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HesaplamalarText(
                            text: idealKiloSonuc.toString() == '0'
                                ? ''
                                : 'BMI\'ın :' + idealKiloSonuc.toString(),
                          ),
                          HesaplamalarText(
                            text:
                                durum == '' ? '' : 'Vücut Kategorin :' + durum,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              MyExpansionTile(
                text: 'Yağ Oranı Hesaplama',
                widget: [
                  MyTextFieldHesap(
                    text: 'Boy',
                    textTur: 'cm',
                    aralikMax: 240,
                    aralikMin: 140,
                    errorTextIcerik:
                        'Geçersiz boy, en az 140, en fazla 240 olmalı!',
                    controller: yagOraniHesapBoy,
                  ),
                  MyTextFieldHesap(
                    text: 'Boyun Çevresi',
                    textTur: '(en genis-cm)',
                    aralikMax: 70,
                    aralikMin: 20,
                    errorTextIcerik:
                        'Geçersiz değer, en az 20, en fazla 70 olmalı!',
                    controller: yagOraniHesapBoyun,
                  ),
                  MyTextFieldHesap(
                    text: 'Bel Çevresi',
                    textTur: '(en ince-cm)',
                    aralikMax: 250,
                    aralikMin: 30,
                    errorTextIcerik:
                        'Geçersiz değer, en az 30, en fazla 250 olmalı!',
                    controller: yagOraniHesapBel,
                  ),
                  Row(
                    children: [
                      //ButtonHesapla(function: kaloriHesapla(),),
                    ],
                  )
                ],
              ),
              MyExpansionTile(
                text: 'Günlük Kalori Hesaplama',
                widget: [
                  MyTextFieldHesap(
                    text: 'Kilonuz',
                    textTur: 'kg',
                    aralikMin: 10,
                    aralikMax: 300,
                    errorTextIcerik:
                        'Geçersiz kilo, en az 10, en fazla 300 olmalı!',
                    controller: kaloriHeesapKiloContrl,
                  ),
                  MyTextFieldHesap(
                    text: 'Yağ Oranı',
                    textTur: '(%)',
                    aralikMin: 5,
                    aralikMax: 50,
                    errorTextIcerik:
                        'Geçersiz oran, en az 5, en fazla 50 olmalı!',
                    controller: kaloriHesapYagContrl,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Aktivite Seviyenizi Seçiniz?'),
                  buildRadioListTile(title: 'Hareketsiz', value: '1.2'),
                  buildRadioListTile(title: 'Biraz Aktif', value: '1.375'),
                  buildRadioListTile(
                      title: 'Hareketsiz iş, Haftada 3-4 Gün Antrenman',
                      value: '1.55'),
                  buildRadioListTile(
                      title: 'Ortalama iş, Haftada 5-7 Gün Antrenman',
                      value: '1.725'),
                  buildRadioListTile(
                      title: 'Yoğun iş Profesyonel Seviyede Antrenman',
                      value: '1.9'),
                  ButtonHesapla(
                    function: () {
                      kaloriHesapla();
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HesaplamalarText(
                        text: bmr == 0
                            ? ''
                            : 'Bazal Metabolizma hızı :' + bmr.toString(),
                      ),
                      HesaplamalarText(
                        text: kaloriHesapDurum == ''
                            &&bmr==0?'': 'Günlük Kalori İhtiyacı :' +
                                kaloriIhtiyaci.toString(),
                      ),
                    ],
                  )
                ],
              ),
              MyExpansionTile(
                text: '1RM Hesaplama',
                widget: [],
              ),
            ],
          ),
        ),
      );

  RadioListTile<String> buildRadioListTile(
      {String value = '', String title = ''}) {
    return RadioListTile(
        title: Text(title),
        activeColor: Colors.black,
        value: value,
        groupValue: kaloriHesapDurum,
        onChanged: (value) {
          setState(() {
            kaloriHesapDurum = value.toString();
          });
        });
  }
}

class HesaplamalarText extends StatelessWidget {
  final String text;
  const HesaplamalarText({
    Key? key,
    this.text = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 15, color: Colors.black),
      textAlign: TextAlign.left,
    );
  }
}
