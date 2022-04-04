

import 'package:flutter/material.dart';
import 'package:v3311456_163311060/companents/login/loginbutton.dart';
import 'package:v3311456_163311060/companents/login/loginkayitgiris.dart';
import 'package:v3311456_163311060/companents/login/text_button.dart';
import 'package:v3311456_163311060/companents/login/textfield_mail.dart';
import 'package:v3311456_163311060/companents/login/textfield_password.dart';

class GirisYap extends StatelessWidget {
  //final bool isPasswordVisible;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: LoginMyAppBar(
          appBarBack: "Kayıt Ol",
          appBarText: "GİRİŞ EKRANI",
        ),
        extendBodyBehindAppBar: false,
        body: LoginBackground(
          blur: ColorFilter.mode(
              Colors.black.withOpacity(0.6), BlendMode.dstATop),
          child: Theme(
            data: ThemeData(primaryColor: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      10,
                    ),
                    child: MyTextFieldMail(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      10,
                    ),
                    child: MyTextFieldPassword(),
                  ),
                  MyTextButton(fonks: (){Navigator.pushNamed(context, '/sifremiUnuttum');
                  },),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: LoginButton(
                      text: 'Giriş Yap',
                      color: Colors.black87,
                      textColor: Colors.white,
                      fonks: () {Navigator.pushNamed(context, '/tabBarMain');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
