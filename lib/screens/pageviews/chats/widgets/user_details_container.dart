import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:connect/enum/user_state.dart';
import 'package:connect/models/user.dart';
import 'package:connect/provider/user_provider.dart';
import 'package:connect/resources/auth_methods.dart';
import 'package:connect/screens/chatscreens/widgets/cached_image.dart';
import 'package:connect/screens/login_screen.dart';
import 'package:connect/widgets/appbar.dart';

import 'shimmering_logo.dart';

class UserDetailsContainer extends StatelessWidget {
  final AuthMethods authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    signOut() async {
      final bool isLoggedOut = await AuthMethods().signOut();
      if (isLoggedOut) {
        // set userState to offline as the user logs out'
        authMethods.setUserState(
          userId: userProvider.getUser.uid,
          userState: UserState.Offline,
        );

        // move the user to login screen
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false,
        );
      }
    }

    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        children: <Widget>[
          CustomAppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.maybePop(context),
            ),
            centerTitle: true,
            title: Text("Profile"),
            //title: ShimmeringLogo(),
            actions: <Widget>[
              FlatButton(
                onPressed: () => signOut(),
                child: Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              )
            ],
          ),
          UserDetailsBody(),
          Divider(),
          GestureDetector(
            onTap: () {
              EditProfile();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  SizedBox(width: 35),
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              EditProfile();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  SizedBox(width: 35),
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              EditProfile();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  SizedBox(width: 35),
                  Text(
                    "Settings",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              EditProfile();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: [
                  SizedBox(width: 35),
                  Text(
                    "Switch To Bussiness Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}

class UserDetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final User user = userProvider.getUser;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        children: [
          CachedImage(
            user.profilePhoto,
            isRound: true,
            radius: 100,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                user.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                user.email,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final User user = userProvider.getUser;
    return Scaffold(
      body: ListView(
        children: [
          CachedImage(
            user.profilePhoto,
            isRound: true,
            radius: 100,
          ),
        ],
      ),
    );
  }
}
