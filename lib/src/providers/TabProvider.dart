import 'package:flutter/material.dart';

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
