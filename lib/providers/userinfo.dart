import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class Record {
  final String name;
  final String mobile;
  final String address;
  final String email;
  final DateTime dob;
  final Gender gender;
  // final String id;
  // bool isSaved;
  final DocumentReference reference;

  Record(
      this.name, this.mobile, this.gender, this.email, this.address, this.dob,
      {this.reference});

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      :
        // : assert(map['id'] != null),
        assert(map['name'] != null),
        assert(map['mobile'] != null),
        assert(map['gender'] != null),
        assert(map['email'] != null),
        assert(map['dob'] != null),
        assert(map['address'] != null),
        name = map['name'],
        mobile = map['mobile'],
        address = map['address'],
        email = map['email'],
        dob = map['dob'],
        gender = map['gender'] == 'male' ? Gender.male : Gender.female;

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() {
    return "Record: {$name:$mobile:$gender:$address:$dob:$email}";
  }
}
