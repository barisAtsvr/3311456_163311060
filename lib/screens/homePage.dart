import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'file:///C:/androidStudioProject/v3311456_163311060/lib/companents/login/loginkayitgiris.dart';
import '../companents/login/loginbutton.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            '',
          ),
        ),
        extendBodyBehindAppBar: true,
          body: LoginBackground(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LoginButton(
                        color: Colors.white70,
                        textColor: Colors.black,
                        text: 'GİRİŞ YAP',
                        fonks: () {
                          Navigator.pushNamed(context, '/girisyap');
                        },
                      ),
                      LoginButton(
                        textColor: Colors.black,
                        text: 'KAYIT OL',
                        fonks: () {
                          Navigator.pushNamed(context, '/kayitOl');
                        },
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
