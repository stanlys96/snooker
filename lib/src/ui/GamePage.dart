import 'package:billiard/src/components/BallTab.dart';
import 'package:billiard/src/providers/TabProvider.dart';
import 'package:billiard/src/ui/AddPlayersPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(builder: (context, tabProvider, _) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF1A1C19),
          body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.46,
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.only(
                    bottom: 10,
                    top: 20,
                  ),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Color(
                            0xFF1D251C,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12.5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                tabProvider.currentPlayerTurnIndex == index
                                    ? Row(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            color: Color(0xFF81DC81),
                                            size: 12,
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                        ],
                                      )
                                    : SizedBox(),
                                Text(
                                  tabProvider.playersList[index],
                                  style: TextStyle(
                                    color: Color(0xFF81DC81),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "49",
                              style: TextStyle(
                                color: Color(0xFF81DC81),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 10);
                    },
                    itemCount: tabProvider.playersList.length,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Break",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        "49",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            child: Image.asset(
                              "images/${tabProvider.billiardBalls[index]}.png",
                            ),
                          ),
                          Text(
                            "15",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                    itemCount: tabProvider.billiardBalls.length,
                    separatorBuilder: (context, separatorIndex) {
                      return SizedBox(
                        width: 5.0,
                      );
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Points Remaining",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        "10",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    alignment: WrapAlignment.center,
                    children: [
                      for (int i = 0;
                          i < tabProvider.billiardBalls.length;
                          i++) ...[
                        InkWell(
                          onTap: () {},
                          child: Opacity(
                            opacity: tabProvider.currentPointBallIndex == i
                                ? 1
                                : 0.3,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  "images/${tabProvider.billiardBalls[i]}.png",
                                  width: 80,
                                  height: 80,
                                ),
                                Text(
                                  "15",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.undo,
                          color: Color(
                            0xFFC3C5BE,
                          ),
                          size: 30.0,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(
                            0xFF1D251C,
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "NEW FRAME",
                          style: TextStyle(
                            color: Color(
                              0xFF85D47E,
                            ),
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(
                            0xFF1D251C,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "FINISH GAME",
                          style: TextStyle(
                            color: Color(
                              0xFF85D47E,
                            ),
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.chalet,
                          color: Color(
                            0xFFC3C5BE,
                          ),
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
