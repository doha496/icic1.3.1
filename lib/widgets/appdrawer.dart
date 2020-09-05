import 'package:flutter/material.dart';
import '../screens/biopage.dart';
import '../screens/mylogs.dart';
import '../screens/meds.dart';
import '../screens/quotd.dart';
import '../screens/add_diary.dart';
import '../screens/chat.dart';
import '../screens/contact_dr.dart';
import '../screens/mood.dart';
import '../screens/settings.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _draweritems(
              icon: Icons.home,
              text: 'Home',
              onTap: () => Navigator.of(context).pushNamed('/')),
          // _draweritems(
          //     icon: Icons.person,
          //     text: 'My Profile',
          //     onTap: () => Navigator.of(context).pushNamed(MyBio.routeName)),
          _draweritems(
              icon: Icons.book,
              text: 'My Diary',
              onTap: () => Navigator.of(context).pushNamed(MyDiary.routeName)),
          _draweritems(
              icon: Icons.list,
              text: 'My Log',
              onTap: () => Navigator.of(context).pushNamed(Mylogs.routeName)),
          _draweritems(
              icon: Icons.mood,
              text: '#mood',
              onTap: () => Navigator.of(context).pushNamed(Mymoods.routeName)),
          _draweritems(
              icon: Icons.healing,
              text: 'Meds',
              onTap: () => Navigator.of(context).pushNamed(MyMeds.routeName)),
          _draweritems(
              icon: Icons.bookmark,
              text: '#QUOTD',
              onTap: () => Navigator.of(context).pushNamed(MyQuotes.routeName)),
          _draweritems(
              icon: Icons.contacts,
              text: 'Contact Doctor',
              onTap: () =>
                  Navigator.of(context).pushNamed(ContactDr.routeName)),
          _draweritems(
              icon: Icons.chat_bubble,
              text: 'Chat',
              onTap: () => Navigator.of(context).pushNamed(MyChat.routeName)),
          _draweritems(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () => Navigator.of(context).pushNamed(Settings.routeName)),
          Divider(),
          ListTile(title: Text('ICIW ©2020, All Rights Reserved'))
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/header.jpg'))),
        child: InkWell(
            child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("You Can Do This!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Loto'))),
        ])));
  }

  Widget _draweritems({IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(padding: EdgeInsets.all(8.0), child: Text(text))
        ],
      ),
      onTap: onTap,
    );
  }
}
