import 'package:connect/widgets/ConnectAppBar.dart';
import 'package:flutter/material.dart';
import 'package:connect/screens/callscreens/pickup/pickup_layout.dart';
import 'package:connect/screens/pageviews/logs/widgets/floating_column.dart';
import 'package:connect/utils/universal_variables.dart';


import 'widgets/log_list_container.dart';

class LogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      scaffold: Scaffold(
        backgroundColor: UniversalVariables.blackColor,
        appBar: ConnectAppBar(
          title: "Calls",
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pushNamed(context, "/search_screen"),
            ),
          ],
        ),
        floatingActionButton: FloatingColumn(),
        body: Padding(
          padding: EdgeInsets.only(left: 15),
          child: LogListContainer(),
        ),
      ),
    );
  }
}
