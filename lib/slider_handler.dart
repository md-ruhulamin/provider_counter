import 'package:flutter/material.dart';

class SliderHandler  extends ChangeNotifier{

  double _slider=0;
  double get slider=>_slider;
  void changeSlider(double newvalue)
  {
    _slider=newvalue;
    notifyListeners();

  }
 }