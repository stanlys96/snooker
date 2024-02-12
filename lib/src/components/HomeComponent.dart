import 'package:billiard/src/components/BallTab.dart';
import 'package:billiard/src/providers/TabProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeComponent extends StatefulWidget {
  @override
  State<HomeComponent> createState() => _HomeComponentState();
}

class _HomeComponentState extends State<HomeComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(builder: (context, tabProvider, _) {
      return Stack(
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
      );
    });
  }
}
