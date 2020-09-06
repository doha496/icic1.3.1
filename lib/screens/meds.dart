import 'package:flutter/material.dart';
import '../widgets/appdrawer.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyMeds extends StatelessWidget {
  static const routeName = '/mymeds';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 234, 255, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Text('ICIW > Meds'),
        backgroundColor: Color.fromRGBO(124, 67, 75, 1),
      ),
      body: ListView(
        children: <Widget>[],
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: BottomAppBar(
        child: Text(
          'ICIW ©2020, All Rights Reserved',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        color: Color.fromRGBO(124, 67, 75, 1),
      ),
    );
  }
}
