import 'package:flutter/material.dart';
import '../widgets/appdrawer.dart';

class MyQuotes extends StatelessWidget {
  static const routeName = '/quotd';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ICIW > #QUOTD'),
        backgroundColor: Color.fromRGBO(124, 67, 75, 1),
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
