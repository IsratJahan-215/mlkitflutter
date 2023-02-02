import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyForm()));
}

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  var _myFormKey = GlobalKey<FormState>();
  var _password = TextEditingController();
  var _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Form"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
        child: Form(
          key: _myFormKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: (String? msg) {
                    if (msg!.isEmpty) {
                      return "Please enter name";
                    }
                    if (msg.length < 3) {
                      return "Name is less than 3 char";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "First Name",
                      hintText: "Enter your name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: (String? msg) {
                    if (msg!.isEmpty) {
                      return "Please enter name";
                    }
                    if (msg.length < 3) {
                      return "Name is less than 3 char";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Last Name",
                      hintText: "Enter your name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  validator: (String? msg) {
                    if (msg!.isEmpty) {
                      return "Please enter your number";
                    }
                    if (msg.length != 11) {
                      return "Number is less than 11";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Phone No.",
                      hintText: "Enter your number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _password,
                  validator: (String? msg) {
                    if (msg!.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _confirmPassword,
                  validator: (String? msg) {
                    if (msg != _password.value.text) {
                      return "Please enter valid password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
                      hintText: "Enter your password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () {
          _myFormKey.currentState!.validate();
        },
      ),
    );
  }
}
