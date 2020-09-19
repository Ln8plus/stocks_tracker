import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './StocksScreen.dart';
import 'package:stocks_tracker/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: size.height * .45,
          decoration: BoxDecoration(
            color: kSkyBlue,
            image: DecorationImage(
                alignment: Alignment.topRight,
                image: AssetImage("assets/images/sun.png")),
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
                  return StocksScreen();
                }),
              );
            },

            //Icon(Icons.search),
            child: Text(
              "           Stocks           ",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            color: Colors.blue,
            textColor: Colors.black,
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
            color: Colors.blue,
            textColor: Colors.black,
          ),
        ),

        //third button
        Container(
          alignment: Alignment(0.0, 0.7),
          child: RaisedButton(
            onPressed: () {},
            child: Text(
              "Currency Converter",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            color: Colors.blue,
            textColor: Colors.black,
          ),
        ),

        //welcome message
        SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("\n\nGood Morning  \nUser !",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontWeight: FontWeight.w900)),
                    ])))
      ],
    ));
  }
}
