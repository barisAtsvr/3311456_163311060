import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'hava_durumu_search.dart';
import 'dart:convert';

class HavaDurumuHome extends StatefulWidget {
  const HavaDurumuHome({Key? key}) : super(key: key);

  @override
  State<HavaDurumuHome> createState() => _HavaDurumuHomeState();
}

class _HavaDurumuHomeState extends State<HavaDurumuHome> {
  String sehir = 'Konya';
  int? sicaklik;
  var locationData;
  var data;
  var arkaPlan = 'clear sky';
  var konum;
  Position? position;
  var locationDataLonLat;

  Future<void> getDevicePosition() async {
    //print('çağrıldı');
    try{position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.lowest);}
        catch(error){
          print('$error hatası!!! Konum Bilgisi Alınamadı');
        }
        finally{
          getDevicePosition();
        }
    //print(position);
  }
  Future<void>izinVer()async{
    // ignore: unused_local_variable
    LocationPermission permission = await Geolocator.requestPermission();
  }

  Future<void> getLocationData() async {
    locationData = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$locationDataLonLat&appid=8cbc8e33e57f4e5a0787c8ae2205ecb6'));

    //data = ((jsonDecode(locationData.body)['main']['temp']) - 272.15).round();
    setState(() {
      data = ((jsonDecode(locationData.body)['main']['temp']) - 272.15).round();
      arkaPlan = jsonDecode(locationData.body)['weather'][0]['description'];
    });
  }
  Future<void> getLocationDataSearch() async {
    locationData = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$sehir&appid=8cbc8e33e57f4e5a0787c8ae2205ecb6'));

    //data = ((jsonDecode(locationData.body)['main']['temp']) - 272.15).round();
    setState(() {
      data = ((jsonDecode(locationData.body)['main']['temp']) - 272.15).round();
      arkaPlan = jsonDecode(locationData.body)['weather'][0]['description'];
      locationDataLonLat=sehir;
    });
  }
  //konya lat 38.1667, lon 32.5
  Future<void> getLocationDataLong() async {
    konum = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=38.1667&lon=32.5&appid=8cbc8e33e57f4e5a0787c8ae2205ecb6'));
    locationDataLonLat = jsonDecode(konum.body)['name'];
  }

  void getDataFromAPI() async {
    await izinVer();
    //await getDevicePosition();
    await getLocationDataLong();
    await getLocationData();

  }
  void getDataFromAPIByCity() async {
    
    await getLocationDataSearch();

  }

  void initState() {
    getDataFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('images/$arkaPlan.jpg'))),
      child: data == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$data° C',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                      color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$locationDataLonLat',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () async {
                        sehir = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPage()));
                        getDataFromAPIByCity();
                        setState(() {
                          sehir = sehir;
                        });
                      },
                      color: Colors.white,
                    )
                  ],
                ),
              ],
            ),
    ));
  }
}
