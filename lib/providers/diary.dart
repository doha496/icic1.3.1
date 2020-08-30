import 'package:flutter/foundation.dart';

class Diary with ChangeNotifier {
  final String entry;
  bool isSaved;

  Diary({
    @required this.entry,
    this.isSaved = false,
  });

  void toggleSavedStatus() {
    isSaved = !isSaved;
    notifyListeners();
  }
}
