import 'package:fitnessaplication/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../companents/login/loginbutton.dart';
import '../companents/login/loginkayitgiris.dart';
import '../companents/login/my_textfield.dart';
import '../companents/login/textfield_mail.dart';
import '../companents/login/textfield_password.dart';

// ignore: must_be_immutable
class KayitOl extends StatefulWidget {
  @override
  State<KayitOl> createState() => _KayitOlState();
}

class _KayitOlState extends State<KayitOl> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Onay Gerekiyor'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Merhaba, lütfen mailinizi kontrol ediniz.'),
                  Text('Onay linkini kontrol edip tekrar giriş yapmalısınız'),
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

    final _registerFormKey = GlobalKey<FormState>();
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
              child: Form(
                key: _registerFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildContainer(
                      child: MyTextFieldMail(
                        controller: _emailController,
                      ),
                    ),
                    buildContainer(
                      child: MyTextFieldPassword(
                        controller: _passwordController,
                        validator: ((value) {
                          if (value!.length < 6) {
                            return 'Şifreniz En Az 6 Karakterden Oluşmalıdır';
                          } else {
                            return null;
                          }
                        }),
                      ),
                    ),
                    buildContainer(
                      child: MyTextFieldPassword(
                        hinttext: '',
                        labeltext: 'Şifre Tekrarı',
                        controller: _passwordConfirmController,
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return 'Şifreler Uyuşmuyor';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    buildContainer(
                        child: MyTextField(
                      labeltext: 'Ad',
                    )),
                    buildContainer(
                        child: MyTextField(
                      labeltext: 'Soyad',
                    )),
                    buildContainer(
                        child: MyTextField(
                      labeltext: 'Telefon',
                    )),
                    buildContainer(
                        child: MyTextField(
                      labeltext: 'Cinsiyet',
                    )),
                    LoginButton(
                      text: 'Kayıt Ol',
                      color: Colors.black87,
                      textColor: Colors.white,
                      fonks: () async {
                        try{
                          if (_registerFormKey.currentState!.validate()) {
                          final user =
                              await Provider.of<Auth>(context, listen: false)
                                  .createUserWithEmailAndPassword(
                                      _emailController.text,
                                      _passwordController.text);
                          if (!user!.emailVerified) {
                            await user.sendEmailVerification();
                          }
                          await _showMyDialog();
                          await Provider.of<Auth>(context, listen: false)
                              .signOut();

                          setState(() {
                            //Navigator.pushNamed(context, '/girisyap');
                          });
                        }
                        }
                         catch(e){
                          Fluttertoast.showToast(
                              msg: 'Tekrar Deneyiniz!',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.black87,
                              textColor: Colors.white,
                              fontSize: 15,
                            );
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        extendBodyBehindAppBar: false,
      ),
    );
  }

  Container buildContainer({Widget? child, double horizontal = 40}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontal, vertical: 7),
      width: double.infinity,
      child: child,
    );
  }
}
