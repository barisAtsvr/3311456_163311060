import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessaplication/screens/login_page.dart';
import 'package:fitnessaplication/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../companenets/main/tabBar.dart';


// ignore: camel_case_types
class onBoardWidget extends StatefulWidget {
  const 
  onBoardWidget({Key? key}) : super(key: key);

  @override
  State<onBoardWidget> createState() => _onBoardWidgetState();
}

// ignore: camel_case_types
class _onBoardWidgetState extends State<onBoardWidget> {
  // ignore: prefer_final_fields
  //bool? _isLogged;

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison, no_leading_underscores_for_local_identifiers
    final _auth = Provider.of<Auth>(context, listen: false);
    return StreamBuilder<User?>(
      stream: _auth.authStatus(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return snapshot.data != null ?  TabBarMain() :  GirisYap();
        } else {
          return const SizedBox(
            height: 300,
            width: 300,
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
