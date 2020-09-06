import 'package:flutter/material.dart';
// import 'package:footer/footer.dart';
// import 'package:provider/provider.dart';
// import '../providers/diarylist.dart';
import '../widgets/appdrawer.dart';
import '../widgets/toastmsg.dart';

// ignore: must_be_immutable
class MyDiary extends StatelessWidget {
  static const routeName = '/add_diary';
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final diarylist = Provider.of<DiaryList>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 234, 255, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Text('ICIW > Diary'),
        backgroundColor: Color.fromRGBO(124, 67, 75, 1),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'What happened today?',
                  style: TextStyle(
                    color: Color.fromRGBO(124, 67, 75, 1),
                    fontSize: 50,
                    // fontFamily: 'Georgie',
                  ),
                  textAlign: TextAlign.center,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(7),
                    child: TextField(
                      maxLines: 100,
                      controller: _textFieldController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(124, 67, 75, 1)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(250, 244, 245, 1),
                      ),
                    ),
                  ),
                ),
              ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          backgroundColor: Color.fromRGBO(124, 67, 75, 1),
          onPressed: () {
            // diarylist.add_diarylist;
            ToastMsg.showCustomToast(context, "Diary Entry Saved");
          }),
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
