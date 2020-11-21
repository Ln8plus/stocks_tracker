import 'package:flutter/material.dart';

import 'dart:convert';

// ignore: camel_case_types
class stocksPage extends StatefulWidget {
  @override
  _stocksPageState createState() => _stocksPageState();
}

// ignore: camel_case_types
class _stocksPageState extends State<stocksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stocks Listings"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            var showData = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(showData[index]['companyName']),
                  subtitle: Text(showData[index]['companyCode']),
                );
              },
              itemCount: showData.length,
            );
          },
          future:
              DefaultAssetBundle.of(context).loadString("assets/STOCK.json"),
        ),
      ),
    );
  }
}
