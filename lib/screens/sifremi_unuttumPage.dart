import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'file:///C:/androidStudioProject/v3311456_163311060/lib/companents/login/loginbutton.dart';
import 'file:///C:/androidStudioProject/v3311456_163311060/lib/companents/login/loginkayitgiris.dart';
import 'file:///C:/androidStudioProject/v3311456_163311060/lib/companents/login/textfield_mail.dart';

class SifremiUnuttum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: LoginMyAppBar(
          appBarBack: 'Giris Yap',
          appBarText: 'Şifremi Unuttum',
        ),
        body: LoginBackground(
          blur: ColorFilter.mode(
              Colors.black.withOpacity(0.6), BlendMode.dstATop),
          child: Theme(
            data: ThemeData(primaryColor: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black87,border: Border.all(color: Colors.white)),


                  //color: Colors.black87,
                  child: Text(
                    'Şifre yenileme linki, e-posta adresinize gönderilecektir.',
                    style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: MyTextFieldMail(),
                  margin: EdgeInsets.all(20),
                ),
                LoginButton(
                  text: 'Gönder',
                  textColor: Colors.white,
                  color: Colors.black87,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
