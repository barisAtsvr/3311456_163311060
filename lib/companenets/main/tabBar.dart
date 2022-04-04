import 'package:flutter/material.dart';
import 'package:v3311456_163311060/screens/antrenmanlarPage.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:v3311456_163311060/screens/ayarlar_page.dart';
import 'package:v3311456_163311060/screens/egzersizler_page.dart';
import 'package:v3311456_163311060/screens/hesaplamalar_page.dart';
import 'package:v3311456_163311060/screens/kronometre_page.dart';

class TabBarMain extends StatefulWidget {
  @override
  _TabBarMainState createState() => _TabBarMainState();
}

class _TabBarMainState extends State<TabBarMain> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.black,scaffoldBackgroundColor: Color(0xFFe8e8e8)),
      child: DefaultTabController(
        length: 5,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              bottom: PreferredSize(
                child: const TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.white,
                  labelColor: Color(0xFF8e8dcc),
                  indicatorColor: Color(0xFF8e8dcc),
                  tabs: [
                    Tab(
                      text: 'Antrenmanlar',
                      icon: IconDekor(icon: Icons.directions_run,),
                    ),
                    Tab(
                      text: 'Egzersizler',
                      icon: IconDekor(icon: Icons.fitness_center,)
                    ),
                    Tab(
                      text: 'Hesaplamalar',
                        icon: IconDekor(icon: Icons.create,)

                    ),

                    Tab(
                      text: 'Kronometre',
                        icon: IconDekor(icon: Icons.timer,)
                    ),
                    Tab(
                      text: 'Ayarlar',
                        icon: IconDekor(icon: Icons.settings,)
                    ),
                  ],
                ),
                preferredSize: Size.fromHeight(30.0),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(Icons.add_alert),
                )
              ],
            ),
            body: TabBarView(
              children: [
                AntrenmanlarPage(),
                EgzersizlerPage(),
                HesaplamalarPage(),
                KronometrePage(),
                AyarlarPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconDekor extends StatelessWidget {
  final IconData? icon;
  const IconDekor({this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedIcon(icon!,size: 30.0,shadows: [BoxShadow(blurRadius: 20,color: Colors.white)],);
  }
}
