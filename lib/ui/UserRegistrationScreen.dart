import 'dart:convert';


import 'package:com/models/UserRegistration.dart';
import 'package:com/util/FadeAnimation.dart';
import 'package:com/util/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;


class UserRegistrationScreen extends StatefulWidget {
  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  final myNameController = TextEditingController();
  final myEmailController = TextEditingController();
  final myPasswordController = TextEditingController();
  final myPhoneController = TextEditingController();
  final myGenderController = TextEditingController();
  final myAddressController = TextEditingController();

  String name;
  String email;
  String password;
  String phone;
  String gender;
  String address;

  Future<UserRegistration> _futureSignup;

  @override
  void dispose() {
    // cleaning up the controller when the widget is disposed

    myNameController.dispose();
    myEmailController.dispose();
    myPasswordController.dispose();
    myPhoneController.dispose();
    myGenderController.dispose();
    myAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: (_futureSignup == null)
            ? Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/background.png'),
                              fit: BoxFit.fill)),
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
                                    image:
                                        AssetImage('assets/images/light-1.png'),
                                  ),
                                ),
                              ),
                            ),
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
                                          'assets/images/light-2.png'),
                                    ),
                                  ),
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
                                    image:
                                        AssetImage('assets/images/clock.png'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            child: FadeAnimation(
                                1.6,
                                Container(
                                  margin: EdgeInsets.only(top: 50),
                                  child: Center(
                                    child: Text(
                                      "Sign Up",
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
                                        controller: myNameController,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Name",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    ),
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
                                            hintText: "Email",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[100]))),
                                      child: TextField(
                                        controller: myPasswordController,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Password",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[100]))),
                                      child: TextField(
                                        controller: myPhoneController,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Phone",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[100]))),
                                      child: TextField(
                                        controller: myGenderController,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Gender",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: myAddressController,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Address",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
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
                                    "SignUp",
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
                                Navigation.navigateToLoginScreen(context);
                              },
                              child: Text(
                                "Already have an account?",
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
            : FutureBuilder<UserRegistration>(
                future: _futureSignup,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print("data received");
                    // return Padding(
                    //   padding: const EdgeInsets.all(30.0),
                    //   child: Center(child: Text(snapshot.data.message)),
                    // );
                    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                      Navigation.navigateToLoginScreen(context);
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
    if (name.length <= 0) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Name field is empty"),
      ));
    } else if (email.length <= 0 || !validateEmail(email)) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Please enter a correct email address"),
      ));
    } else if (password.length <= 0) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Password field is empty"),
      ));
    } else if (phone.length <= 0) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Phone field is empty"),
      ));
    } else if (gender.length <= 0) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Gender field is empty"),
      ));
    } else if (address.length <= 0) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Address field is empty"),
      ));
    } else {
      setState(() {
        _futureSignup =
            registerApiHit(name, email, password, phone, gender, address);
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
    name = myNameController.text;
    email = myEmailController.text;
    password = myPasswordController.text;
    phone = myPhoneController.text;
    gender = myGenderController.text;
    address = myAddressController.text;
  }

  Future<UserRegistration> registerApiHit(String name, String email,
      String password, String phone, String gender, String address) async {
    final uri = 'https://minorp.herokuapp.com/user';
    var requestBody = {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'gender': gender,
      'address': address,
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
      print("data sent");
      return UserRegistration.fromJson(jsonDecode(response.body));
    } else {
      print("ERRORR in logging");

      throw Exception('Failded to login');
    }
  }
}
