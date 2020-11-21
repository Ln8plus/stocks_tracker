import 'package:flutter/material.dart';
import 'company.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class stockPage extends StatefulWidget {
  @override
  _stockPageState createState() => _stockPageState();
}

// ignore: camel_case_types
class _stockPageState extends State<stockPage> {
  List<Company> _companies = List<Company>();

  List<Company> _companiesForDisplay = List<Company>();

  Future<List<Company>> fetchCompanies() async {
    var url = 'https://stonks-88a9.restdb.io/rest/stock-json';

    var response = await http.get(url, headers: {
      'x-apikey': "dcfe97f7bcce72026887a2075d0187fd6ca6d",
      'cache-control': "no-cache"
    });
    var companies = List<Company>();
    if (response.statusCode == 200) {
      var companiesJson = json.decode(response.body);
      for (var companyJson in companiesJson) {
        companies.add(Company.fromJson(companyJson));
      }
    }
    return companies;
  }

  @override
  void initState() {
    fetchCompanies().then((value) {
      setState(() {
        _companies.addAll(value);
        _companiesForDisplay = _companies;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stocks Listings'),
          backgroundColor: Colors.teal,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return index == 0 ? _searchBar() : _listItem(index - 1);
          },
          itemCount: _companiesForDisplay.length + 1,
        ));
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Enter unique company code...',
            prefixIcon: Icon(Icons.search)),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _companiesForDisplay = _companies.where((company) {
              var companyTitle = company.companyCode.toLowerCase();
              return companyTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _companiesForDisplay[index].companyCode,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              _companiesForDisplay[index].companyName,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            Text(
              _companiesForDisplay[index].countryCode,
              style: TextStyle(color: Colors.blue.shade300),
            ),
            Text(
              _companiesForDisplay[index].lastTrade,
              style: TextStyle(color: Colors.green.shade600),
            ),
            Text(
              _companiesForDisplay[index].changePercent,
              style: TextStyle(color: Colors.purple.shade900),
            ),
          ],
        ),
      ),
    );
  }
}
