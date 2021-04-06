import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  performTask();
}

void performTask() async {
  task1();
  String task2result = await task2();
  task3(task2result);
}

void task1() {
  String result = "task 1 data";
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String result;
  await Future.delayed(threeSeconds, () {
    result = "task 2 data";
    print('Task 2 complete');
  });
  return result;
}

void task3(String ttd) {
  String result = "task 3 data";
  print('Task 3 complete with $ttd');
}

String myMargin = 'abc';
double myMarginAsDouble;
// try {
// myMarginAsDouble = double.parse(myMargin);
// } catch (e) {
// //myMarginAsDouble = 30.0;
// print(e);
// }
// return Scaffold(
// body: Container(
// margin: EdgeInsets.all(myMarginAsDouble ?? 30.0),
// color: Colors.green,
// ),
// );
