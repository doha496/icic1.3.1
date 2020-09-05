import 'package:flutter/foundation.dart';

class Diary with ChangeNotifier {
  final String entry;
  final String id;
  bool isSaved;

  Diary({
    @required this.entry,
    @required this.id,
    this.isSaved = false,
  });

  void toggleSavedStatus() {
    isSaved = !isSaved;
    notifyListeners();
  }
}
