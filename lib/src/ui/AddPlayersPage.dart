import 'package:billiard/src/providers/TabProvider.dart';
import 'package:billiard/src/ui/GamePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPlayersPage extends StatefulWidget {
  @override
  State<AddPlayersPage> createState() => _AddPlayersPageState();
}

class _AddPlayersPageState extends State<AddPlayersPage> {
  final TextEditingController playerController = TextEditingController();
  final ScrollController listViewController = ScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(builder: (context, tabProvider, _) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xFF1A1C19),
        appBar: AppBar(
          backgroundColor: Color(0xFF1A1C19),
          automaticallyImplyLeading: true,
          surfaceTintColor: Color(0xFF8BD087),
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
          reverse: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 15,
                ),
                margin: EdgeInsets.only(
                  bottom: 20,
                ),
                height: MediaQuery.of(context).size.height * 0.62 -
                    MediaQuery.of(context).viewInsets.bottom,
                child: ListView.separated(
                  controller: listViewController,
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
                          tabProvider.playersList[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            tabProvider.addHistoryPlayer(
                                tabProvider.playersList[index]);
                            tabProvider.deletePlayer(index);
                          },
                          child: Icon(
                            Icons.delete_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  itemCount: tabProvider.playersList.length,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            itemBuilder: (context, historyIndex) => InkWell(
                              onTap: () {
                                tabProvider.addPlayer(tabProvider
                                    .historyPlayersList[historyIndex]);
                                tabProvider.deleteHistoryPlayer(historyIndex);
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
                                      tabProvider
                                          .historyPlayersList[historyIndex],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    InkWell(
                                      onTap: () {
                                        tabProvider
                                            .deleteHistoryPlayer(historyIndex);
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
                            itemCount: tabProvider.historyPlayersList.length,
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
                                    onChanged: (text) {
                                      setState(() {});
                                    },
                                    controller: playerController,
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
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 25.0,
                              ),
                              backgroundColor: //     color: Color(
                                  Color(
                                tabProvider.playersList.isNotEmpty ||
                                        playerController.text.isNotEmpty
                                    ? 0xFF1D251C
                                    : 0xFF333532,
                              ),
                            ),
                            onPressed: () {
                              if (tabProvider.playersList.isNotEmpty &&
                                  playerController.text.trim().isEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GamePage(),
                                  ),
                                );
                              }
                              if (playerController.text.trim().isEmpty) return;
                              if (playerController.text.isNotEmpty) {
                                tabProvider.addPlayer(playerController.text);
                                playerController.text = "";
                                listViewController.jumpTo(listViewController
                                    .position.maxScrollExtent);
                              }
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  playerController.text.isEmpty
                                      ? Icons.play_arrow
                                      : Icons.person_2,
                                  color: Color(
                                    tabProvider.playersList.isNotEmpty ||
                                            playerController.text.isNotEmpty
                                        ? 0xFF8BD087
                                        : 0xFF707170,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  playerController.text.isNotEmpty
                                      ? 'Add player'
                                      : 'Start Game',
                                  style: TextStyle(
                                    color: Color(
                                      tabProvider.playersList.isNotEmpty ||
                                              playerController.text.isNotEmpty
                                          ? 0xFF8BD087
                                          : 0xFF707170,
                                    ),
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
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
