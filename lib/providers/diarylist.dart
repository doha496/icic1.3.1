import 'package:flutter/cupertino.dart';
import 'diary.dart';

class DiaryList with ChangeNotifier {
  final List<Diary> _diaryList = [];
  // ignore: non_constant_identifier_names
  void add_diarylist() {
    Diary diary = Diary(entry: 'null', id: 'a;ks');
    _diaryList.add(diary);
    notifyListeners();
  }
}
