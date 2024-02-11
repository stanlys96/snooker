import 'package:flutter/material.dart';

class BSD {
  int id;
  IconData icon;
  String title;

  BSD({required this.id, required this.icon, required this.title});
}

class TabProvider extends ChangeNotifier {
  int currentSelectedTabIndex = 0;
  List<String> playersList = [];
  List<String> historyPlayersList = [];
  int currentPlayerTurnIndex = 0;
  int currentPointBallIndex = 0;
  List<String> billiardBalls = [
    "Red Ball",
    "Blue Ball",
    "Yellow Ball",
    "Green Ball",
    "Brown Ball",
    "Pink Ball",
    "Black Ball"
  ];

  List<BSD> bottomSheetData = [
    BSD(id: 1, icon: Icons.e_mobiledata, title: "Finish game"),
    BSD(id: 2, icon: Icons.fast_rewind, title: "Restart game"),
    BSD(id: 3, icon: Icons.remove, title: "Remove red from table"),
    BSD(id: 4, icon: Icons.breakfast_dining, title: "Breaks"),
  ];

  void changeSelectedTab(int index) {
    currentSelectedTabIndex = index;
    notifyListeners();
  }

  void addPlayer(String newPlayer) {
    playersList.add(newPlayer);
    notifyListeners();
  }

  void deletePlayer(int index) {
    playersList.removeAt(index);
    notifyListeners();
  }

  void addHistoryPlayer(String newHistoryPlayer) {
    historyPlayersList.add(newHistoryPlayer);
    notifyListeners();
  }

  void deleteHistoryPlayer(int index) {
    historyPlayersList.removeAt(index);
    notifyListeners();
  }

  void setCurrentPlayerTurnIndex(int index) {
    currentPlayerTurnIndex = index;
    notifyListeners();
  }
}
