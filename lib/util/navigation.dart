import 'package:com/ui/firstSection.dart';
import 'package:com/ui/home_page.dart';
import 'package:com/ui/resultSection.dart';
import 'package:com/ui/secondSection.dart';
import 'package:com/ui/thirdSection.dart';
import 'package:flutter/material.dart';


class Navigation{
  static void navigateToFirst(BuildContext context) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => FirstSection()));

  static void navigateToSecond(BuildContext context) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => SecondSection()));

  static void navigateToThird(BuildContext context) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => ThirdSection()));

  static void navigateToResult(BuildContext context) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => ResultSection()));

  static void navigateToDoctorsSection(BuildContext context) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));

  static void popNavigation(context) => Navigator.of(context).pop(true);
}