import 'dart:convert';
import 'package:com/models/Login.dart';
import 'package:com/util/FadeAnimation.dart';
import 'package:com/util/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final myEmailController = TextEditingController();
  final myPasswordController = TextEditingController();

  String email;
  String password;

  Future<Login> _futureLogin;

  @override
  void dispose() {
    // cleaning up the controller when the widget is disposed

    myEmailController.dispose();
    myPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: (_futureLogin == null)
            ? Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/background.png'),
                              fit: BoxFit.fill),),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 30,
                            width: 80,
                            height: 200,
                            child: FadeAnimation(
                                1,
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/light-1.png'))),
                                )),
                          ),
                          Positioned(
                            left: 140,
                            width: 80,
                            height: 150,
                            child: FadeAnimation(
                                1.3,
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/light-2.png'))),
                                )),
                          ),
                          Positioned(
                            right: 40,
                            top: 40,
                            width: 80,
                            height: 150,
                            child: FadeAnimation(
                                1.5,
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/clock.png'))),
                                )),
                          ),
                          Positioned(
                            child: FadeAnimation(
                                1.6,
                                Container(
                                  margin: EdgeInsets.only(top: 50),
                                  child: Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(
                              1.8,
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(143, 148, 251, .2),
                                          blurRadius: 20.0,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[100]))),
                                      child: TextField(
                                        controller: myEmailController,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Email or Phone number",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: myPasswordController,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Password",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    )
                                  ],
                                ),
                              ),),
                          SizedBox(
                            height: 30,
                          ),
                          FadeAnimation(
                            2,
                            GestureDetector(
                              onTap: () {
                                print("Login Button Pressed");
                                validation();
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(143, 148, 251, 1),
                                      Color.fromRGBO(143, 148, 251, .6),
                                    ])),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          FadeAnimation(
                            1.5,
                            Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, 1)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FadeAnimation(
                            1.5,
                            GestureDetector(
                              onTap: () {
                                Navigation.navigateToSignupScreen(context);
                              },
                              child: Text(
                                "Create Account",
                                style: TextStyle(
                                    color: Color.fromRGBO(143, 148, 251, 1)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : FutureBuilder<Login>(
                future: _futureLogin,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // print("data received");
                    // return Padding(
                    //   padding: const EdgeInsets.all(30.0),
                    //   child: Center(child: Text(snapshot.data.data.email)),
                    // );
                    _saveDetailsToSharedPref(snapshot.data.data.token,snapshot.data.data.name);

                    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                      Navigation.navigateToFirst(context);
                    });
                  } else if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Center(child: Text("${snapshot.error}")),
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
      ),
    );
  }

  void validation() {
    getData();
    if (email.length <= 0 || !validateEmail(email)) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Please enter a correct email address"),
      ));
    } else if (password.length <= 0) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Password field is empty"),
      ));
    } else {
      setState(() {
        _futureLogin = emailApiHit(email, password);
      });
    }
  }

  //used for validating email in flutter
  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  void getData() {
    email = myEmailController.text;
    password = myPasswordController.text;
  }

  Future<Login> emailApiHit(String email, String password) async {
    final uri = 'https://minorp.herokuapp.com/auth';
    var requestBody = {
      'email': email,
      'password': password,
    };
    final http.Response response = await http.post(
      uri,
      //   headers: <String, String>{
      // "Content-Type": "application/x-www-form-urlencoded",
      //     // 'Content-Type': 'application/json; charset=UTF-8',
      //   },
      body: requestBody,
    );

    if (response.statusCode == 200) {
      return Login.fromJson(jsonDecode(response.body));
    } else {
      print("ERRORR in logging");

      throw Exception('Failded to login');
    }
  }

  void _saveDetailsToSharedPref (String token, String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('name', name);
  }
}
