import 'package:firebase_core/firebase_core.dart';
import 'package:fitnessaplication/screens/hava_durumu_home.dart';
import 'package:fitnessaplication/screens/login_page.dart';
import 'package:fitnessaplication/screens/sifremi_unuttumPage.dart';
import 'package:fitnessaplication/screens/splash_page.dart';
import 'package:fitnessaplication/services/auth.dart';
import 'package:fitnessaplication/widgets/on_board_stream.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'companenets/main/tabBar.dart';
import 'screens/homePage.dart';
import 'screens/signUp_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<Auth>(create: (context)=>Auth(),child: MaterialApp(
      //home: Login(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=>Splash(),
        '/homepage':(context)=>HomePage(),
        '/on_board':(context)=>onBoardWidget(),
        '/girisyap':(context)=>GirisYap(),
        '/kayitOl':(context)=>KayitOl(),
        '/sifremiUnuttum':(context)=>SifremiUnuttum(),
        '/tabBarMain':(context)=>TabBarMain(),
        'havaDurumuHome':(context)=>HavaDurumuHome(),
      }
    ),);
  }
}
