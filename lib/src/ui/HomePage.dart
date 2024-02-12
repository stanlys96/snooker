import 'package:billiard/src/components/HomeComponent.dart';
import 'package:billiard/src/components/SettingsComponent.dart';
import 'package:billiard/src/providers/TabProvider.dart';
import 'package:billiard/src/ui/AddPlayersPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(builder: (context, tabProvider, _) {
      return Scaffold(
        backgroundColor: const Color(0xFF1A1C19),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF1A1C19),
          title: Text(
            _selectedIndex == 0 ? "New game" : "More",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: _selectedIndex == 0 ? HomeComponent() : SettingsComponent(),
        floatingActionButton: _selectedIndex == 0
            ? Container(
                child: FittedBox(
                  child: FloatingActionButton.extended(
                    backgroundColor: Color(0xFF1E241C),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddPlayersPage(),
                        ),
                      );
                    },
                    label: Text(
                      "Add players",
                      style: TextStyle(
                        color: Color(
                          0xFF88DD8a,
                        ),
                      ),
                    ),
                    icon: Icon(
                      Icons.person_2,
                      color: Color(0xFF88DD8A),
                    ),
                  ),
                ),
              )
            : SizedBox(),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            enableFeedback: false,
            backgroundColor: Color(0xFF212A20),
            unselectedLabelStyle: TextStyle(
              color: Colors.white,
            ),
            selectedLabelStyle: TextStyle(
              color: Colors.black,
            ),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Container(
                  width: 75,
                  height: 30,
                  child: Icon(Icons.home),
                ),
                activeIcon: Container(
                  width: 75,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xFF3C4A38),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(Icons.home),
                ),
                label: 'Play',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 75,
                  height: 30,
                  child: Icon(Icons.business),
                ),
                activeIcon: Container(
                  width: 75,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xFF3C4A38),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(Icons.business),
                ),
                label: 'More',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            onTap: _onItemTapped,
          ),
        ),
      );
    });
  }
}
