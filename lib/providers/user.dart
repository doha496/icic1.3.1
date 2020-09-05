import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Profile with ChangeNotifier {
  final String name;
  final String mobile;
  final String address;
  final String email;
  final DateTime dob;
  final String gender;
  final String id;
  bool isSaved;

  Profile({
    @required this.name,
    @required this.mobile,
    @required this.address,
    @required this.dob,
    @required this.email,
    @required this.gender,
    @required this.id,
    this.isSaved = false,
  });

  void toggleSavedStatus() {
    isSaved = !isSaved;
    notifyListeners();
  }
}
