import 'package:flutter/material.dart';
// import 'package:footer/footer.dart';
import '../widgets/appdrawer.dart';

class ContactDr extends StatelessWidget {
  static const routeName = '/contactdr';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ICIW > Doctor\'s Profile'),
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
