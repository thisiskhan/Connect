import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect/widgets/ConnectAppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:connect/models/contact.dart';
import 'package:connect/provider/user_provider.dart';
import 'package:connect/resources/chat_methods.dart';
import 'package:connect/screens/callscreens/pickup/pickup_layout.dart';
import 'package:connect/screens/pageviews/chats/widgets/contact_view.dart';
import 'package:connect/screens/pageviews/chats/widgets/quiet_box.dart';
import 'package:connect/screens/pageviews/chats/widgets/user_circle.dart';
import 'package:connect/utils/universal_variables.dart';
import 'package:shimmer/shimmer.dart';


import 'widgets/new_chat_button.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      scaffold: Scaffold(
        backgroundColor: UniversalVariables.blackColor,
        appBar: ConnectAppBar(
           title: Shimmer.fromColors(
        baseColor: UniversalVariables.blackColor,
        highlightColor: Colors.white,
        child: Text("Connect"),
        period: Duration(seconds: 1),
      ),
          //title: UserCircle(),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/search_screen");
              },
            ),
            IconButton(
              icon: Icon(
                Icons.store,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
          ],
        ),
        floatingActionButton: NewChatButton(),
        body: ChatListContainer(),
      ),
    );
  }
}

class ChatListContainer extends StatelessWidget {
  final ChatMethods _chatMethods = ChatMethods();

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: _chatMethods.fetchContacts(
            userId: userProvider.getUser.uid,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var docList = snapshot.data.documents;

              if (docList.isEmpty) {
                return QuietBox(
                  heading: "This is where all the contacts are listed",
                  subtitle:
                      "Search for your friends and family to start calling or chatting with them",
                );
              }
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: docList.length,
                itemBuilder: (context, index) {
                  Contact contact = Contact.fromMap(docList[index].data);

                  return ContactView(contact);
                },
              );
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
