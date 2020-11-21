import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'stockFinder.dart';

// ignore: camel_case_types
class outputResult extends StatefulWidget {
  @override
  // ignore: camel_case_types
  outputResultState createState() => new outputResultState();
}

// ignore: camel_case_types
class outputResultState extends State<outputResult> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Material(
            elevation: 7.0,
            borderRadius: BorderRadius.circular(7.0),
            child: Container(
                height: 300.0,
                padding: EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Company Name',
                        style: TextStyle(fontSize: 17.0),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: 0.5,
                        width: double.infinity,
                        color: Colors.red,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                    ])),
          ),
        ),
      ),
    );
  }
}
