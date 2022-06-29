import 'package:flutter/material.dart';
import '../companents/login/loginbutton.dart';
import '../companents/login/loginkayitgiris.dart';

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
                          Navigator.pushNamed(context, '/on_board');
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
