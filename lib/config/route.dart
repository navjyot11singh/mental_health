import 'package:com/ui/DoctorDetailsScreen.dart';
import 'package:com/ui/DoctorHomeScreen.dart';
import 'package:com/ui/home.dart';
import 'package:com/widgets/coustom_route.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => Home(),
    };
  }

  static Route onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name.split('/');
    if (pathElements[0] != '' || pathElements.length == 1) {
      return null;
    }
    switch (pathElements[1]) {
      case "HomePage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => HomePage(
            model: settings.arguments,
          ),
        );
      case "DetailPage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => DetailPage(
            model: settings.arguments,
          ),
        );
      case "LoginPage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => DetailPage(
            model: settings.arguments,
          ),
        );
    }
  }
}
