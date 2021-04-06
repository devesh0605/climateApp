import 'package:clima/services/networking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '882b25a01a571baf4c8374e63d8455b5';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  String data = 'demo';

  @override
  void initState() {
    super.initState();
    //getLocationData();
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
    data = (weatherData).toString();
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            // ignore: deprecated_member_use
            child: RaisedButton(
              color: Colors.red,
              onPressed: () {
                setState(() {
                  getLocationData();
                });
              },
              child: Text('Get Location'),
            ),
          ),
          Center(
            child: Text(data),
          )
        ],
      ),
    );
  }
}
