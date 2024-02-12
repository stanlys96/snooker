import 'package:billiard/src/components/UserBreak.dart';
import 'package:billiard/src/providers/TabProvider.dart';
import 'package:billiard/src/ui/GamePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreaksPage extends StatefulWidget {
  @override
  State<BreaksPage> createState() => _BreaksPageState();
}

class _BreaksPageState extends State<BreaksPage> {
  final ScrollController viewController = ScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    viewController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => viewController.jumpTo(
        viewController.position.maxScrollExtent,
      ),
    );
    ;
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
            "Breaks",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: SingleChildScrollView(
              controller: viewController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  for (int i = 0; i < tabProvider.breaksList.length; i++) ...[
                    UserBreak(
                        playerName: tabProvider.breaksList[i].name,
                        points: tabProvider.breaksList[i].points.toString(),
                        balls: tabProvider.breaksList[i].balls),
                    SizedBox(height: 20),
                  ],
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
