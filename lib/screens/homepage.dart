import 'package:flutter/material.dart';
import '../screens/add_diary.dart';
import '../screens/biopage.dart';
import '../screens/chat.dart';
import '../screens/contact_dr.dart';
import '../screens/meds.dart';
import '../screens/mood.dart';
import '../screens/mylogs.dart';
import '../screens/quotd.dart';
import '../screens/settings.dart';
// import 'package:footer/footer.dart';
import '../widgets/appdrawer.dart';

class MYHomepage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        title: Text('ICIW'),
        // fontFamily: 'Georgia',
        backgroundColor: Color.fromRGBO(124, 67, 75, 1),
      ),
      drawer: MyDrawer(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/stars.jpeg'),
                        fit: BoxFit.cover))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                HomeOpt('My Profile', MyBio.routeName),
                HomeOpt('My Log', Mylogs.routeName),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // HomeOpt('My Diary', MyDiary.routeName),
                HomeOpt('#QOUTD', MyQuotes.routeName),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                HomeOpt('#mood', Mymoods.routeName),
                HomeOpt('Meds', MyMeds.routeName),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                HomeOpt('Contact Doctor', ContactDr.routeName),
                HomeOpt('Chat', MyChat.routeName),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  HomeOpt('Settings', Settings.routeName),
                ]),
          ]),
      // bottomSheet: new Footer(
      //     child: Padding(
      //   padding: new EdgeInsets.all(7),
      //   child: Text('ICIW ©2020, All Rights Reserved.'),
      // )),
      // debugShowCheckedModeBanner: false
    );
    // );
  }
}

class HomeOpt extends StatelessWidget {
  final String optName;
  final String routeName;

  HomeOpt(this.optName, this.routeName);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 50,
        width: 200,
        padding: EdgeInsets.all(3),
        child: new Container(
          decoration: new BoxDecoration(
              color: Color.fromRGBO(124, 67, 75, 1),
              borderRadius: BorderRadius.circular(30.0)),
          child: Center(
              child: Text(
            optName,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
        print(routeName);
      },
    );
  }
}
