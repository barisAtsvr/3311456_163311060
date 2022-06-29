import 'package:fitnessaplication/colors.dart';
import 'package:fitnessaplication/screens/hava_durumu_home.dart';
import 'package:fitnessaplication/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:provider/provider.dart';

import '../../screens/antrenmanlarPage.dart';
import '../../screens/ayarlar_page.dart';
import '../../screens/egzersizler_page.dart';
import '../../screens/hesaplamalar_page.dart';
import '../../screens/kronometre_page.dart';

class TabBarMain extends StatefulWidget {
  @override
  _TabBarMainState createState() => _TabBarMainState();
}

class _TabBarMainState extends State<TabBarMain> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primarySwatch: myPrimaryBlack),
      child: DefaultTabController(
        length: 6,
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
                      icon: IconDekor(
                        icon: Icons.directions_run,
                      ),
                    ),
                    Tab(
                        text: 'Egzersizler',
                        icon: IconDekor(
                          icon: Icons.fitness_center,
                        )),
                    Tab(
                        text: 'Hesaplamalar',
                        icon: IconDekor(
                          icon: Icons.create,
                        )),
                    Tab(
                        text: 'Hava Durumu',
                        icon: IconDekor(
                          icon: Icons.wb_cloudy_rounded,
                        )),
                    Tab(
                        text: 'Kronometre',
                        icon: IconDekor(
                          icon: Icons.timer,
                        )),
                    Tab(
                        text: 'Ayarlar',
                        icon: IconDekor(
                          icon: Icons.settings,
                        )),
                  ],
                ),
                preferredSize: Size.fromHeight(30.0),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.add_alert),
                  onPressed: () async {
                    Provider.of<Auth>(context, listen: false).signOut();
                  },
                )
              ],
            ),
            body: TabBarView(
              children: [
                AntrenmanlarPage(),
                EgzersizlerPage(),
                HesaplamalarPage(),
                HavaDurumuHome(),
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
  const IconDekor({
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedIcon(
      icon!,
      size: 30.0,
      shadows: [BoxShadow(blurRadius: 20, color: Colors.white)],
    );
  }
}
