import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '882b25a01a571baf4c8374e63d8455b5';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    String urlu =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url: urlu);
    var weatherData = await networkHelper.getData();
    //print(weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
    // int condition = weatherData['weather'][0]['id'];
    //
    // double temperature = weatherData['main']['temp'];
    //
    // String cityName = weatherData['name'];
    // print(cityName);
    // print(condition);
    // print(temperature);
  }

  // void throwWith10(int n) {
  //   if (n > 10) {
  //     throw 'n should be greater than 10';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
