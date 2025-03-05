import 'package:flutter/material.dart';

class CounterHandler extends ChangeNotifier {
  int count = 0;
  int get counter => count;
  void setcounter(int value) {
    count = value;
      notifyListeners();
  }

  void incremnet(){
    count++;
    notifyListeners();
  }
   void reset() {
    count = 0;
    notifyListeners();
  }
}
