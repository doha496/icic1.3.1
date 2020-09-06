import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/appdrawer.dart';

class ContactDr extends StatelessWidget {
  static const routeName = '/contactdr';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 234, 255, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Text('ICIW > Doctor\'s Profile'),
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

  Map nameMap = {
    'name': '',
    'mobile': '',
    'address': '',
    'email': '',
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
              autocorrect: false,
              decoration: InputDecoration(
                labelText: 'Therapist\'s Name',
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
              autocorrect: false,
              decoration: InputDecoration(
                labelText: 'Therapist\'s Mobile Number',
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
              autocorrect: false,
              decoration: InputDecoration(
                labelText: 'Therapist\'s Clinic Address',
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
              autocorrect: false,
              decoration: InputDecoration(
                labelText: 'Therapist\'s Email',
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
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Saving Therapist\'s info')));
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
      });
      form.reset();
    }
  }
}
