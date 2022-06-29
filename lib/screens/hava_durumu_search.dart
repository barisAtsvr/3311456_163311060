import 'package:fitnessaplication/colors.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final myController = TextEditingController();
  // ignore: unused_element
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("HATA"),
          content: Text("Geçersiz Bir Şehir Girdiniz"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: Text("Kapat"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('images/search.jpg'))),
      child: Theme(
        data: ThemeData(primarySwatch: myPrimaryBlack),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                      hintText: 'Şehir Seçiniz',
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                  style: TextStyle(fontSize: 30, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    myController.text.isEmpty
                        ? myController.text = 'konya'
                        : Navigator.pop(context, myController.text);
                    print(myController.text);
                  },
                  child: Text('Şehri Seç')),
            ],
          )),
        ),
      ),
    ));
  }
}
