import 'package:billiard/src/providers/TabProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsComponent extends StatefulWidget {
  @override
  State<SettingsComponent> createState() => _SettingsComponentState();
}

class _SettingsComponentState extends State<SettingsComponent> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(builder: (context, tabProvider, _) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "PREFERENCES",
              style: TextStyle(
                color: Color(
                  0xFF88DD8a,
                ),
                fontSize: 16.0,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 15.0),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 5.0,
              ),
              decoration: BoxDecoration(
                color: Color(
                  0xFF1E241C,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    15.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Dark mode",
                    style: TextStyle(
                      color: Color(
                        0xFFDEE2DD,
                      ),
                      fontSize: 18.0,
                    ),
                  ),
                  Switch(
                      value: light,
                      onChanged: (bool value) {
                        setState(() {
                          light = value;
                        });
                      })
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              "OTHER",
              style: TextStyle(
                color: Color(
                  0xFF88DD8a,
                ),
                fontSize: 16.0,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 15.0),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 5.0,
              ),
              decoration: BoxDecoration(
                color: Color(
                  0xFF1E241C,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    15.0,
                  ),
                ),
              ),
              child: Column(
                children: [
                  for (int i = 0; i < tabProvider.settingsData.length; i++) ...[
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        tabProvider.settingsData[i].icon,
                        color: Color(
                          0xFFDEE2DD,
                        ),
                      ),
                      title: Text(
                        tabProvider.settingsData[i].title,
                        style: TextStyle(
                          color: Color(
                            0xFFDEE2DD,
                          ),
                          fontSize: 18.0,
                        ),
                      ),
                      trailing: Text(
                        tabProvider.settingsData[i].trailingTitle ?? "",
                        style: TextStyle(
                          color: Color(
                            0xFFDEE2DD,
                          ),
                        ),
                      ),
                    )
                  ],
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
