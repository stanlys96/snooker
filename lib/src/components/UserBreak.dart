import 'package:flutter/material.dart';

class UserBreak extends StatefulWidget {
  String playerName;
  String points;
  List<String> balls;

  UserBreak({
    required this.playerName,
    required this.points,
    required this.balls,
  });

  @override
  State<UserBreak> createState() => _UserBreakState();
}

class _UserBreakState extends State<UserBreak> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        20.0,
      ),
      decoration: BoxDecoration(
        color: Color(
          0xFF1D251C,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            20.0,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.playerName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "25",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 25.0),
            child: Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 4.0,
              runSpacing: 4.0,
              children: [
                for (int i = 0; i < widget.balls.length; i++) ...[
                  Image.asset(
                    "images/${widget.balls[i]}.png",
                    width: 40.0,
                    height: 40.0,
                  )
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
