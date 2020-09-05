import 'package:flutter/material.dart';
// import 'package:footer/footer.dart';
import 'package:provider/provider.dart';
import '../providers/diarylist.dart';
import '../widgets/appdrawer.dart';
import '../widgets/toastmsg.dart';

class MyDiary extends StatelessWidget {
  static const routeName = '/add_diary';
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final diarylist = Provider.of<DiaryList>(context);
    // final savedDToastc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ICIW > Diary'),
        backgroundColor: Color.fromRGBO(124, 67, 75, 1),
      ),
      body: Center(
        // child: Text('Add Diary'),
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          // EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            maxLines: 100,
            controller: _textFieldController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(124, 67, 75, 1)),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              filled: true,
              fillColor: Color.fromRGBO(250, 244, 245, 1),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          backgroundColor: Color.fromRGBO(124, 67, 75, 1),
          onPressed: () {
            diarylist.add_diarylist;
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
