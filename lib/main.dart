import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:jcsfolio/landing-page/index.dart';
import 'package:jcsfolio/widgets/constants.dart';

void main() async {
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode savedThemeMode;
  const MyApp({Key key, this.savedThemeMode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        // primarySwatch: Colors.red,
        // accentColor: Colors.amber,
      ),
      dark: ThemeData(
        // backgroundColor: Colors.black,
        // scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        // primarySwatch: Colors.red,
        // accentColor: Colors.amber,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jubin Surya| Portfolio',
        theme: theme,
        darkTheme: darkTheme,
        //  ThemeData(
        //   // primarySwatch: Colors.blue,
        //   brightness: Brightness.dark,
        //   primaryColor: kPrimaryColor,
        //   accentColor: kPrimaryColor,
        //   highlightColor: kPrimaryColor,
        // ),
        home: IndexPage(),
      ),
    );
  }
}
