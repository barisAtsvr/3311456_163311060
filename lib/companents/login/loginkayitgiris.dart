import 'dart:ui';

import 'package:flutter/material.dart';
class LoginMyAppBar extends StatefulWidget implements PreferredSizeWidget{
  const LoginMyAppBar({
    Key? key,
    @required this.appBarBack,
    @required this.appBarText,
  }) : super(key: key);

  final String? appBarBack;
  final String? appBarText;

  @override
  _LoginMyAppBarState createState() => _LoginMyAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);
}

class _LoginMyAppBarState extends State<LoginMyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 130,
      leading: ElevatedButton.icon(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_left_sharp,color: Colors.white,),
        label: Text(widget.appBarBack!,style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
        style: ElevatedButton.styleFrom(
            elevation: 0, primary: Colors.transparent),
      ),
      centerTitle: true,
      backgroundColor: Colors.black,
      elevation: 0,
      title: Text(
        widget.appBarText!,
        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
      ),
    );
  }
}

class LoginBackground extends StatelessWidget {
  final Widget? child;
  final ColorFilter? blur;
  const LoginBackground({this.child, this.blur});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        //color: WColor.WGR_BLUE,
        image: DecorationImage(
          colorFilter: blur,
          image: AssetImage('images/loginarkaplan.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}