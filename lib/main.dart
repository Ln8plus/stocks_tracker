import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stocks_tracker/constants.dart';
import 'package:stocks_tracker/dbhelper.dart';
//import 'authentication.dart';
import './homeScreen.dart';
import 'dbhelper.dart';
//import 'package:flutter_svg/flutter_svg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //Dbhelper dbhelper = new Dbhelper();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}
