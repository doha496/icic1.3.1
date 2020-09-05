import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DiaryToast extends StatefulWidget {
  @override
  _DiaryToast createState() {
    return _DiaryToast();
  }
}

class _DiaryToast extends State {
  showToast() {
    Fluttertoast.showToast(
        msg: 'Diary Entry Saved',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromRGBO(124, 67, 75, 10),
        textColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) => showToast();
}
