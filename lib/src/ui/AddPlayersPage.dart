import 'package:billiard/src/components/BallTab.dart';
import 'package:billiard/src/providers/TabProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPlayersPage extends StatefulWidget {
  @override
  State<AddPlayersPage> createState() => _AddPlayersPageState();
}

class _AddPlayersPageState extends State<AddPlayersPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(builder: (context, tabProvider, _) {
      return Scaffold(
        backgroundColor: const Color(0xFF1A1C19),
        appBar: AppBar(
          backgroundColor: Color(0xFF1A1C19),
          automaticallyImplyLeading: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(
            "Players",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.68,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hey baby',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            print("OI");
                          },
                          child: Icon(
                            Icons.delete_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  itemCount: 5,
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                    ),
                    // margin: EdgeInsets.only(bottom: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 10,
                              );
                            },
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                print("HEY");
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Hey baby',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    InkWell(
                                      onTap: () {
                                        print("OI");
                                      },
                                      child: Icon(
                                        Icons.delete_sharp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            itemCount: 5,
                          ),
                        ),
                        Container(
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                ),
                                margin: EdgeInsets.only(
                                  right: 10,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: TextField(
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Player name",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            child: Container(
                              margin: EdgeInsets.only(
                                bottom: 20,
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Color(
                                  0xFF1D251C,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: Color(0xFF8BD087),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Start Game',
                                    style: TextStyle(
                                      color: Color(0xFF8BD087),
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
