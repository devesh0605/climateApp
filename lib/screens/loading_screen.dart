import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getCLocation();
  }

  void getCLocation() async {
    try {
      //throwWith10(13);
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);
    } catch (e) {
      print(e);
    }
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
              color: Colors.blue,
              onPressed: () {
                //print('hello world');
                //getCLocation();
              },
              child: Text('Get Location'),
            ),
          ),
        ],
      ),
    );
  }
}
