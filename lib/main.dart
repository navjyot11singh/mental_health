import 'package:com/ui/home.dart';
import 'package:com/util/strings.dart';
import 'package:flutter/material.dart';

import 'config/route.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: Strings.APP_NAME,
      theme: new ThemeData(primaryColor: Colors.white,),
//      home: new Home(title: Strings.APP_NAME),
      initialRoute: "HomePage",
      routes: Routes.getRoute(),
      onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
      debugShowCheckedModeBanner: false,

    );
  }
}