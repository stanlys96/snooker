import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  int currentSelectedTabIndex = 0;

  void changeSelectedTab(int index) {
    currentSelectedTabIndex = index;
    notifyListeners();
  }
}
