import 'package:flutter/foundation.dart';

class MyCounter with ChangeNotifier, DiagnosticableTreeMixin {
  int _counter = 0;

  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // list all the properties of your class here.
    // See the documentation of debugFillProperties for more information.
    properties.add(IntProperty('AAA counter', _counter));
  }

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }
}
