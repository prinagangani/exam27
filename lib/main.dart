import 'package:flutter/material.dart';

import 'first.dart';
import 'home.dart';
void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Home(),
        'one':(context) => HomePage(),
      },
    ),
  );
}