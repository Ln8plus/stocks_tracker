import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'stockPage.dart';
import 'currencyconverter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage("assets/images/arrows.jpg")),
          ),
        ),

        //first button
        Container(
          alignment: Alignment(0.0, 0.3),
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return stockPage();
                  //This  button returns the stockpage on being pressed
                }),
              );
            },

            //Icon(Icons.search),
            child: Text(
              "    Stocks Listings   ",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            color: Colors.teal[700],
            textColor: Colors.white,
          ),
        ),

        //second button
        Container(
          alignment: Alignment(0.0, 0.5),
          child: RaisedButton(
            onPressed: () {},
            child: Text(
              "        Calculator         ",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            color: Colors.teal[700],
            textColor: Colors.white,
          ),
        ),

        //third button
        Container(
          alignment: Alignment(0.0, 0.7),
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return CurrencyConverter();
                }),
              );
            },
            child: Text(
              "Currency Converter",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            color: Colors.teal[700],
            textColor: Colors.white,
          ),
        ),

        //welcome message
        SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("\n\n \t\tStocks Trade  \n \t\tMarket ",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontWeight: FontWeight.w900)),
                    ])))
      ],
    ));
  }
}
