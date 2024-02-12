import 'package:billiard/src/models/BSD.dart';
import 'package:billiard/src/models/BreaksData.dart';
import 'package:billiard/src/models/Settings.dart';
import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  int currentSelectedTabIndex = 0;
  List<String> playersList = [];
  List<String> historyPlayersList = [];
  int currentPlayerTurnIndex = 0;
  int currentPointBallIndex = 0;
  int currentBreaksId = 1;
  List<String> billiardBalls = [
    "Red Ball",
    "Blue Ball",
    "Yellow Ball",
    "Green Ball",
    "Brown Ball",
    "Pink Ball",
    "Black Ball"
  ];
  List<BreaksData> breaksList = [];

  List<String> currentBilliardBalls = [];

  List<BSD> bottomSheetData = [
    BSD(id: 1, icon: Icons.e_mobiledata, title: "Finish game"),
    BSD(id: 2, icon: Icons.fast_rewind, title: "Restart game"),
    BSD(id: 3, icon: Icons.remove, title: "Remove red from table"),
    BSD(id: 4, icon: Icons.details_sharp, title: "Breaks"),
  ];

  List<Settings> settingsData = [
    Settings(id: 1, icon: Icons.percent, title: "Licenses"),
    Settings(id: 2, icon: Icons.privacy_tip, title: "Privacy policy"),
    Settings(id: 3, icon: Icons.contact_emergency, title: "Contact"),
    Settings(id: 4, icon: Icons.rate_review, title: "Rate app"),
    Settings(
      id: 5,
      icon: Icons.verified,
      title: "App version",
      trailingTitle: "4.3.9",
    ),
    Settings(
      id: 6,
      icon: Icons.build,
      title: "Build number",
      trailingTitle: "2310041",
    ),
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

  void incrementPlayerTurnIndex() {
    currentPlayerTurnIndex++;
    notifyListeners();
  }

  void addCurrentBilliardData(String newBilliardData) {
    currentBilliardBalls.add(newBilliardData);
    notifyListeners();
  }
}
