import 'package:app_delivery/src/routes/pages.dart';
import 'package:app_delivery/src/utils/colors.dart';
import 'package:app_delivery/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Sam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
        //accentColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: FontStyles.textTheme,
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: primaryColor,
          textTheme: CupertinoTextThemeData(textStyle: FontStyles.normal),
        ),
      ),
      initialRoute: Pages.INITIAL,
      routes: Pages.routes,
    );
  }
}
