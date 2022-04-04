import 'package:flutter/material.dart';
import 'package:v3311456_163311060/companenets/main/tabBar.dart';

import 'package:v3311456_163311060/screens/login_page.dart';
import 'package:v3311456_163311060/screens/sifremi_unuttumPage.dart';
import 'package:v3311456_163311060/screens/splash_page.dart';
import 'screens/homePage.dart';
import 'screens/signUp_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Login(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=>Splash(),
        '/homepage':(context)=>HomePage(),
        '/girisyap':(context)=>GirisYap(),
        '/kayitOl':(context)=>KayitOl(),
        '/sifremiUnuttum':(context)=>SifremiUnuttum(),
        '/tabBarMain':(context)=>TabBarMain(),

      }
    );
  }
}
