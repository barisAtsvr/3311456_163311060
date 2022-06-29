import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../companents/login/loginbutton.dart';
import '../companents/login/loginkayitgiris.dart';
import '../companents/login/textfield_mail.dart';
import '../services/auth.dart';

class SifremiUnuttum extends StatefulWidget {
  @override
  State<SifremiUnuttum> createState() => _SifremiUnuttumState();
}

class _SifremiUnuttumState extends State<SifremiUnuttum> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('ŞİFRE YENİLEME'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Merhaba, lütfen mailinizi kontrol ediniz.'),
                  Text('Linke tıklayarak şifrenizi yenileyiniz'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('ANLADIM'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    final _resetFormKey = GlobalKey<FormState>();

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
            child: Form(
              key: _resetFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black87,
                        border: Border.all(color: Colors.white)),

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
                    child: MyTextFieldMail(
                      controller: _emailController,
                    ),
                    margin: EdgeInsets.all(20),
                  ),
                  LoginButton(
                    text: 'Gönder',
                    textColor: Colors.white,
                    color: Colors.black87,
                    fonks: () async {
                      if (_resetFormKey.currentState!.validate()) {
                        await Provider.of<Auth>(context, listen: false)
                            .sendPasswordResetEmail(_emailController.text);
                        await _showMyDialog();
                        Navigator.pop(context);
                      }
                    },
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
