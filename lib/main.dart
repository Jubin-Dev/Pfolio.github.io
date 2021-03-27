import 'package:flutter/material.dart';
import 'package:jcsfolio/landing-page/index.dart';
import 'package:jcsfolio/widgets/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jubin Surya| Portfolio',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        accentColor: kPrimaryColor,
        highlightColor: kPrimaryColor,
      ),
      home: IndexPage(),
    );
  }
}
