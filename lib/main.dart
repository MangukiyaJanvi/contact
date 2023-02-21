import 'package:contact/second.dart';
import 'package:flutter/material.dart';
import 'four.dart';
import 'home.dart';
import 'third.dart';

void main()
{
  runApp(
    MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          headline3: TextStyle(fontSize: 14),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Home(),
        '2':(context) => Second(),
        '3':(context) => Third(),
        '4':(context) => Four(),
      },
    ),
  );
}