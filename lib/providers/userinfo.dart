import 'package:cloud_firestore/cloud_firestore.dart';

enum Gender { female, male }

class Record {
  final String name;
  final String mobile;
  final String address;
  final String email;
  final DateTime dob;
  final Gender gender;
  final DocumentReference reference;

  Record(
      this.name, this.mobile, this.address, this.email, this.dob, this.gender,
      {this.reference});

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['mobile'] != null),
        assert(map['address'] != null),
        assert(map['email'] != null),
        assert(map['dob'] != null),
        assert(map['gender'] != null),
        name = map['name'],
        mobile = map['mobile'],
        address = map['address'],
        email = map['email'],
        dob = map['dob'],
        gender = map['gender'] == 'female' ? Gender.female : Gender.male;

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() {
    return "Record: {$name:$mobile:$address:$email:$dob:$gender}";
  }
}
