import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../providers/userinfo.dart';
import '../widgets/appdrawer.dart';

class MyBio extends StatelessWidget {
  static const routeName = '/biopage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ICIW > Profile'),
        backgroundColor: Color.fromRGBO(124, 67, 75, 1),
      ),
      body: AddNameForm(),
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

class AddNameForm extends StatefulWidget {
  @override
  _AddNameFormState createState() {
    return _AddNameFormState();
  }
}

class _AddNameFormState extends State<AddNameForm> {
  final _formKey = GlobalKey<FormState>();
  Gender _gender = Gender.female;
  Map nameMap = {
    'name': '',
    'address': '',
    'dob': DateTime.now(),
    'email': '',
    'mobile': '',
    'gender': Gender.female
  };

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please fill all fields';
                }
                return null;
              },
              onSaved: (newValue) {
                nameMap['name'] = newValue;
                nameMap['mobile'] = newValue;
                nameMap['address'] = newValue;
                nameMap['email'] = newValue;
                nameMap['dob'] = newValue;
              },
            ),
          ),
          ListTile(
            title: const Text('Female'),
            leading: Radio(
              value: Gender.female,
              groupValue: _gender,
              onChanged: (Gender newValue) {
                setState(() {
                  _gender = newValue;
                });
                nameMap['gender'] = newValue;
              },
            ),
          ),
          ListTile(
            title: const Text('Male'),
            leading: Radio(
              value: Gender.male,
              groupValue: _gender,
              onChanged: (Gender newValue) {
                setState(() {
                  _gender = newValue;
                });
                nameMap['gender'] = newValue;
              },
            ),
          ),
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Saving your data')));
                _handleSubmit();
              }
            },
            child: Text('Save'),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            splashColor: Color.fromRGBO(124, 67, 75, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(color: Theme.of(context).accentColor),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmit() {
    final FormState form = _formKey.currentState;

    if (form.validate() == true) {
      form.save();
      FirebaseFirestore.instance.collection('iciw-db').add({
        'name': nameMap['name'],
        'mobile': nameMap['mobile'],
        'address': nameMap['address'],
        'email': nameMap['email'],
        'dob': nameMap['dob'],
        'gender': nameMap['gender'].toString().split('.')[1],
      });
      form.reset();
    }
  }
}
