import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';

class AyarlarPage extends StatefulWidget {
  @override
  _AyarlarPageState createState() => _AyarlarPageState();
}

class _AyarlarPageState extends State<AyarlarPage> {
  String val = '';
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              baslikText('Cinsiyet:'),
              buildRadiolistTile('Erkek'),
              buildRadiolistTile('Kadın'),
              baslikText('Seviye:'),
              buildRadiolistTile('Acemi'),
              buildRadiolistTile('Orta'),
              buildRadiolistTile('İleri'),
              Center(
                child: FloatingActionButton(
                  onPressed: () async {
                    Provider.of<Auth>(context, listen: false).signOut();
                    // ignore: avoid_print
                    print('Logout Tıklandı');
                  },
                  backgroundColor: Color(0xFFE0E0FB),
                  child: Text('Çıkış',style: TextStyle(color: Colors.black87),),
                  elevation: 5.0,
                ),
              )
            ],
          ),
        ),
      );

  Text baslikText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Padding buildRadiolistTile(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Color(0xFFE0E0FB), borderRadius: BorderRadius.circular(15)),
        child: RadioListTile(
          title: Text(text),
          activeColor: Colors.black,
          value: '',
          groupValue: val,
          onChanged: (value) {
            setState(() {
              value = val.toString();
            });
          },
          //subtitle: Text('hello'),
        ),
      ),
    );
  }
}
