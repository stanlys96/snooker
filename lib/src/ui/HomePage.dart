import 'package:billiard/src/components/BallTab.dart';
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
          backgroundColor: Color(0xFF1A1C19),
          title: Text(
            "New game",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'images/${tabProvider.currentSelectedTabIndex == 0 ? "6-ball" : tabProvider.currentSelectedTabIndex == 1 ? "10-ball" : "15-ball"}.png',
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    margin: EdgeInsets.only(
                      bottom: 100,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.1,
              child: Center(child: BallTab()),
            )
          ],
        ),
        floatingActionButton: Container(
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
        ),
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
