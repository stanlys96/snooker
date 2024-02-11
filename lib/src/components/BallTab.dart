import 'package:billiard/src/providers/TabProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BallTab extends StatefulWidget {
  const BallTab({
    super.key,
  });

  @override
  State<BallTab> createState() => _BallTabState();
}

class _BallTabState extends State<BallTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(builder: (context, tabProvider, _) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  tabProvider.changeSelectedTab(0);
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: tabProvider.currentSelectedTabIndex == 0
                        ? Color(0xFF263423)
                        : null,
                    border: Border.all(
                      color: Color(0xFF2F302F),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '6',
                      style: TextStyle(
                        color: Color(0xFF70D36F),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  tabProvider.changeSelectedTab(1);
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: tabProvider.currentSelectedTabIndex == 1
                        ? Color(0xFF263423)
                        : null,
                    border: Border.all(
                      color: Color(0xFF2F302F),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '10',
                      style: TextStyle(
                        color: Color(0xFF70D36F),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  tabProvider.changeSelectedTab(2);
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: tabProvider.currentSelectedTabIndex == 2
                        ? Color(0xFF263423)
                        : null,
                    border: Border.all(
                      color: Color(0xFF2F302F),
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '15',
                      style: TextStyle(
                        color: Color(0xFF70D36F),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
