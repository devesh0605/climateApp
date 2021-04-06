main() {
  String myString = '5';
  try {
    double myStringAsDouble = double.parse(myString);
    print(myStringAsDouble + 5);
  } catch (e) {
    print(e);
  }
}
