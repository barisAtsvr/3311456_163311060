import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v3311456_163311060/companents/login/loginbutton.dart';
import 'package:v3311456_163311060/companents/login/loginkayitgiris.dart';
import 'package:v3311456_163311060/companents/login/my_textfield.dart';
import 'package:v3311456_163311060/companents/login/textfield_mail.dart';
import 'package:v3311456_163311060/companents/login/textfield_password.dart';

class KayitOl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: LoginMyAppBar(
          appBarText: 'KAYIT EKRANI',
          appBarBack: 'Giriş Yap',
        ),
        body: LoginBackground(
          blur: ColorFilter.mode(
              Colors.black.withOpacity(0.6), BlendMode.dstATop),
          child: Theme(
            data: ThemeData(primaryColor: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  buildContainer(
                    child: MyTextFieldMail(),
                  ),
                  buildContainer(child: MyTextFieldPassword()),
                  buildContainer(
                    child: MyTextFieldPassword(
                      hinttext: '****',
                      labeltext: 'Şifre Tekrarı',
                    ),
                  ),
                  buildContainer(child: MyTextField(labeltext: 'Ad',)),
                  buildContainer(child: MyTextField(labeltext: 'Soyad',)),
                  buildContainer(child: MyTextField(labeltext: 'Telefon',)),
                  buildContainer(child: MyTextField(labeltext: 'Cinsiyet',)),
                  LoginButton(text: 'Kayıt Ol',color: Colors.black87,textColor: Colors.white,fonks: (){},),
                  SizedBox(height: 10,)
                ],
              ),
            ),
          ),
        ),
        extendBodyBehindAppBar: false,
      ),
    );
  }

  Container buildContainer({Widget? child,double horizontal=40}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontal, vertical: 7),
      width: double.infinity,
      child: child,
    );
  }
}
