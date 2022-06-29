import 'package:fitnessaplication/colors.dart';
import 'package:fitnessaplication/companents/login/loginbutton.dart';
import 'package:fitnessaplication/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../companents/login/loginkayitgiris.dart';
import '../companents/login/text_button.dart';
import '../companents/login/textfield_mail.dart';
import '../companents/login/textfield_password.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GirisYap extends StatefulWidget {
  @override
  State<GirisYap> createState() => _GirisYapState();
}

class _GirisYapState extends State<GirisYap> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

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

  Future<void> _signInAnonymously() async {
    setState(() {
      _isLoading = true;
    });
    final user =
        await Provider.of<Auth>(context, listen: false).signInAnonymously();
    setState(() {
      _isLoading = false;
    });
    // ignore: avoid_print
    print(user?.uid);
  }

  //final bool isPasswordVisible;
  @override
  Widget build(BuildContext context) {
    GlobalKey globalKey = GlobalKey();
    final _signInFormKey = GlobalKey<FormState>();
    return SafeArea(
      key: globalKey,
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
            data: ThemeData(primaryColor: myPrimaryWhite),
            child: SingleChildScrollView(
              child: Form(
                key: _signInFormKey,
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
                      child: MyTextFieldMail(
                        controller: _emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(
                        10,
                      ),
                      child: MyTextFieldPassword(
                        validator: ((value) {
                          if (value!.length < 6) {
                            return 'Şifreniz En Az 6 Karakterden Oluşmalıdır';
                          } else {
                            return null;
                          }
                        }),
                        controller: _passwordController,
                      ),
                    ),
                    MyTextButton(
                      fonks: _isLoading ? null : _signInAnonymously,
                      text: 'Misafir Girişi',
                    ),
                    MyTextButton(
                      fonks: () {
                        Navigator.pushNamed(context, '/sifremiUnuttum');
                      },
                      text: 'Şifremi Unuttum >',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: LoginButton(
                        text: 'Giriş Yap',
                        color: Colors.black87,
                        textColor: Colors.white,
                        fonks: () async {
                          try {
                            if (_signInFormKey.currentState!.validate()) {
                              final user = await Provider.of<Auth>(context,
                                      listen: false)
                                  .sigInWithEmailPassword(_emailController.text,
                                      _passwordController.text);
                              if (!user!.emailVerified) {
                                await _showMyDialog();
                                await Provider.of<Auth>(context, listen: false)
                                    .signOut();
                              }
                            }
                          } catch (e) {
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
                          //Navigator.pushNamed(context, '/tabBarMain');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
