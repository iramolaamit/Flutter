import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 12,
        semanticLabel: 'Drawer',
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            // primary: true,
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(color: Colors.blueGrey),
                  accountName: Text('Amit Rajput'),
                  accountEmail: Text('xyz@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg'),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                ),
                title: Text(
                  textScaleFactor: 1.2,
                  'Home',
                  style: TextStyle(),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                ),
                title: Text(
                  textScaleFactor: 1.2,
                  'Profile',
                  style: TextStyle(),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.mail_solid,
                ),
                title: Text(
                  textScaleFactor: 1.2,
                  'Inbox',
                  style: TextStyle(),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                ),
                title: Text(
                  textScaleFactor: 1.2,
                  'Exit',
                  style: TextStyle(),
                ),
              )
            ],
          ),
        ));
  }
}
