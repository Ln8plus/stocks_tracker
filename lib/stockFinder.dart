import 'package:flutter/material.dart';
import 'company.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dbhelper.dart';
import 'package:sqflite/sqflite.dart';

/*
TODO AS OF 08/11/2020


Implepment sqflite for search and display on this 
page 
Put all parts in one file for knowing what is where and don't make multiple dart files

Remove all firebase clutter like searchDisplay, authentication and fllutter fire as
useless stuff is not needed anymore. Also the search service at the bottom of this page


*/

class FieldEntry extends StatefulWidget {
  FieldEntry({Key key, this.title}) : super(key: key);
  // ignore: non_constant_identifier_names
  final String title;

  @override
  FieldEntryState createState() => new FieldEntryState();
}

List allStocks = List();
List items = List();

var entry;
var hold;
bool check = false;

class FieldEntryState extends State<FieldEntry> {
  // fire this to the searcher function
//global var entry;
  final entryCon = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: entryCon,
                decoration: InputDecoration(
                    hintText: "Enter company code !",
                    prefixIcon: Icon(Icons.search)),
              ),
              RaisedButton(
                onPressed: () {
                  entry = entryCon;
                  _query();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _query() async {
    // get a reference to the database
    Database db = await Dbhelper.instance.database;

    // raw query
    List<Map> result = await db
        .rawQuery('SELECT * FROM listings WHERE CompanyCode=?', [entryCon]);

    // print the results
    result.forEach((row) => print(row));
    // {_id: 2, name: Mary, age: 32}
  }

  /*@override
  void initState() {
    initState();
  }
  */
}
