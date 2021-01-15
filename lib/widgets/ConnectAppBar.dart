import 'package:flutter/material.dart';
import 'package:connect/screens/pageviews/chats/widgets/user_circle.dart';
import 'package:connect/widgets/appbar.dart';

class ConnectAppBar extends StatelessWidget implements PreferredSizeWidget {
  final title;
  final List<Widget> actions;

  const ConnectAppBar({
    Key key,
    @required this.title,
    @required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leading: UserCircle(),
      title: (title is String)
          ? Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          : title,
      centerTitle: true,
      actions: actions,
    );
  }

  final Size preferredSize = const Size.fromHeight(kToolbarHeight + 10);
}
