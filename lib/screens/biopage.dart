import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../providers/userinfo.dart';
import '../widgets/appdrawer.dart';

class MyBio extends StatelessWidget {
  static const routeName = '/biopage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 234, 255, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Text('ICIW > Profile'),
        backgroundColor: Color.fromRGBO(124, 67, 75, 1),
      ),
      body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
        AddForm(),
      ]),
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

class AddForm extends StatefulWidget {
  @override
  _AddFormState createState() {
    return _AddFormState();
  }
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();
  Gender _gender = Gender.male;
  Map nameMap = {
    'name': '',
    'mobile': '',
    'address': '',
    'email': '',
    'dob': '',
    'gender': Gender.female,
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
              decoration: InputDecoration(
                labelText: 'Your Name',
                filled: true,
                fillColor: Color.fromRGBO(250, 204, 255, 1),
              ),
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please fill all fields!';
                }
                return null;
              },
              onSaved: (newValue) {
                nameMap['name'] = newValue;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Your Mobile Number',
                filled: true,
                fillColor: Color.fromRGBO(250, 204, 255, 1),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please fill all fields!';
                }
                return null;
              },
              onSaved: (newValue) {
                nameMap['mobile'] = newValue;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Your Address',
                filled: true,
                fillColor: Color.fromRGBO(250, 204, 255, 1),
              ),
              keyboardType: TextInputType.streetAddress,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please fill all fields!';
                }
                return null;
              },
              onSaved: (newValue) {
                nameMap['address'] = newValue;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Your Email',
                filled: true,
                fillColor: Color.fromRGBO(250, 204, 255, 1),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please fill all fields!';
                }
                return null;
              },
              onSaved: (newValue) {
                nameMap['email'] = newValue;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: 'Your date of birth (DD/MM/YYYY)',
                filled: true,
                fillColor: Color.fromRGBO(250, 204, 255, 1),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please fill all feilds';
                }
                return null;
              },
              onSaved: (newValue) {
                nameMap['dob'] = newValue;
              },
            ),
          ),
          ListTile(
            title: const Text(
              'Female',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
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
            title: const Text(
              'Male',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
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
                    .showSnackBar(SnackBar(content: Text('Saving your info')));
                _handleSubmit();
              }
            },
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
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
      // FocusScope.of(context).unfocus();
    }
  }
}
