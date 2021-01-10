import 'package:com/ui/ChatBotScreen.dart';
import 'package:com/ui/DoctorHomeScreen.dart';
import 'package:com/ui/DrawingUi.dart';
import 'package:com/ui/LoginScreen.dart';
import 'package:com/ui/ResultScreen.dart';
import 'package:com/ui/UserDetailsScreen.dart';
import 'package:com/ui/UserRegistrationScreen.dart';
import 'package:com/ui/firstSection.dart';
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

  static void navigateToLoginScreen(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => LoginScreen()));

  static void navigateToSignupScreen(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => UserRegistrationScreen()));

   static void navigateToUserDetails(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => UserDetailsScreeb()));

   static void navigateToChatBot(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => ChatbotScreen()));

    static void navigateToDrawingUi(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => DrawingUi()));

  static void popNavigation(context) => Navigator.of(context).pop(true);
}