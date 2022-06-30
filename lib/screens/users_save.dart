import 'package:fitnessaplication/colors.dart';
import 'package:fitnessaplication/companenets/main/tabBar.dart';
import 'package:fitnessaplication/models/car.dart';
import 'package:fitnessaplication/services/dbhelper.dart';
import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final dbHelper = DatabaseHelper.instance;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController milesController = TextEditingController();
  TextEditingController quaryController = TextEditingController();
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController milesUpdateController = TextEditingController();
  TextEditingController idDeleteController = TextEditingController();


  List<Car> cars = [];
  List<Car> carsByName = [];

  void _showMessageInScaffold(String message) {
    // ignore: deprecated_member_use
    _scaffoldkey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(data: ThemeData(primarySwatch: myPrimaryBlack),
      child: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Egzersiz Ekle"),
              bottom: TabBar(
                tabs: [
                  Tab(
                    //text: "Ekle",
                    icon: IconDekor(icon: Icons.add_box),
                  ),
                  Tab(
                    //text: "Bak",
                    icon: IconDekor(icon: Icons.remove_red_eye),

                  ),
                  Tab(
                    //text: "Ara",
                    icon: IconDekor(icon: Icons.search),
                    
                  ),
                  Tab(
                    //text: "Güncelle",
                    icon: IconDekor(icon: Icons.update_sharp),

                  ),
                  Tab(
                    //text: "Sil",
                    icon: IconDekor(icon: Icons.delete),

                  ),
                ],
              ),
            ),
            body: TabBarView(children: [
              Center(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Görev Adı'),
                        )),
                    Container(
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          controller: milesController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Set Sayısı'),
                        )),
                    ElevatedButton(
                      onPressed: () {
                        String name = nameController.text;
                        int miles = int.parse(milesController.text);
                        _insert(name, miles);
                      },
                      child: Text('Görev Ekle'),
                    ),
                  ],
                ),
              ),
              Container(
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: cars.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == cars.length) {
                      return ElevatedButton(
                          child: Text('Güncelle'),
                          onPressed: () {
                            setState(() {
                              _queryAll();
                            });
                          });
                    }
                    return Container(
                      height: 40,
                      child: Center(
                        child: Text(
                          '${cars[index].id}.Görev: ${cars[index].name} - ${cars[index].miles} Set',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Center(
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: quaryController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Görev Ara',
                      ),
                      onChanged: (text) {
                        if (text.length >= 2) {
                          setState(() {
                            _query(text);
                          });
                        } else {
                          setState(() {
                            carsByName.clear();
                          });
                        }
                      },
                    ),
                    height: 100,
                  ),
                  Expanded(
                    child: Container(
                      height: 300,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: carsByName.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 50,
                            margin: EdgeInsets.all(2),
                            child: Center(
                              child: Text(
                                '${carsByName[index].id}.Görev: ${carsByName[index].name} - ${carsByName[index].miles} Set',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ]),
              ),
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(20),
                          child: TextField(
                            controller: idUpdateController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Görev ID'),
                          )),
                      Container(
                          padding: EdgeInsets.all(20),
                          child: TextField(
                            controller: nameUpdateController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Görev Adı'),
                          )),
                      Container(
                          padding: EdgeInsets.all(20),
                          child: TextField(
                            controller: milesUpdateController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Set Sayısı'),
                          )),
                      ElevatedButton(
                        onPressed: () {
                          int id = int.parse(idUpdateController.text);
                          String name = nameUpdateController.text;
                          int miles = int.parse(milesUpdateController.text);
                          _update(id, name, miles);
                        },
                        child: Text('Güncelle'),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          controller: idDeleteController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Görev ID'),
                        )),
                    ElevatedButton(
                      onPressed: () {
                        int id = int.parse(idDeleteController.text);
                        _delete(id);
                      },
                      child: Text('Görev Sil'),
                    ),
                  ],
                ),
              ),
            ]),
          )),
    );
  }

  void _insert(String name, int miles) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnMiles: miles,
    };
    Car car = Car.fromMap(row);
    final id = await dbHelper.insert(car);
    _showMessageInScaffold('inserted row id : $id');
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    cars.clear();
    allRows?.forEach((row) => cars.add(Car.fromMap(row)));
    _showMessageInScaffold("Quary done");
    setState(() {});
  }

  void _query(name) async {
    final allRows = await dbHelper.queryRows(name);
    carsByName.clear();
    allRows?.forEach((row) => carsByName.add(Car.fromMap(row)));
  }

  void _update(int id, String name, int miles) async{
    Car car = Car(id, name, miles);
    final rowsAffected = await dbHelper.update(car);
    _showMessageInScaffold("update $rowsAffected row(s)");
  }
  
  void _delete(int id) async{
    final rowsDeleted=await dbHelper.delete(id);
    _showMessageInScaffold("deleted $rowsDeleted row(s) : rows $id");
  }
}
