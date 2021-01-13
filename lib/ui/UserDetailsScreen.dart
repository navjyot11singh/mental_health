import 'dart:convert';

import 'package:com/models/UserDetailsModel.dart';
import 'package:com/widgets/InfoCard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import 'package:http/http.dart' as http;

class UserDetailsScreeb extends StatefulWidget {
  @override
  _UserDetailsScreebState createState() => _UserDetailsScreebState();
}

class _UserDetailsScreebState extends State<UserDetailsScreeb> {
  String url = 'navjyot.marwah@gmail.com';
  String email = 'navjyot.marwah@gmail.com';
  String phone = '+91 0000000000';
  String location = 'Dhaka, Bangladesh';

  String token;

  Future<UserDetailsModel> _futureUserDetails;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getToken();
  }

  void _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token');
      _futureUserDetails = fetchUserDetails();
    });
  }

  Future<UserDetailsModel> fetchUserDetails() async {
    final uri = 'https://minorp.herokuapp.com/user/me';

    final response = await http.get(uri, headers: {
      'x-auth-token': token //do token work
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("data received");
      return UserDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  void _showDialog(BuildContext context, {String title, String msg}) {
    final Dialog = AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: <Widget>[
        RaisedButton(
          color: Colors.teal,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Close',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
    showDialog(context: context, builder: (x) => Dialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: (_futureUserDetails == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : FutureBuilder<UserDetailsModel>(
                future: _futureUserDetails,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Stack(
                      children: <Widget>[

                        Container(
                          height: 400,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/background.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 120,
                            ),
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('images/doctor.jpg'),
                            ),
                            Text(
                              snapshot.data.data.name,
                              style: TextStyle(
                                fontSize: 40.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Pacifico',
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 200,
                              child: Divider(
                                color: Colors.white,
                              ),
                            ),
                            InfoCard(
                              text: snapshot.data.data.phone,
                              icon: Icons.phone,
                              onPressed: () async {
                                String removeSpaceFromPhoneNumber = phone
                                    .replaceAll(new RegExp(r"\s+\b|\b\s"), "");
                                final phoneCall =
                                    'tel:$removeSpaceFromPhoneNumber';

                                if (await launcher.canLaunch(phoneCall)) {
                                  await launcher.launch(phoneCall);
                                } else {
                                  _showDialog(
                                    context,
                                    title: 'Sorry',
                                    msg: 'please try again ',
                                  );
                                }
                              },
                            ),
                            InfoCard(
                              text: snapshot.data.data.email,
                              icon: Icons.email,
                              onPressed: () async {
                                final emailAddress = 'mailto:$email';
                                if (await launcher.canLaunch(emailAddress)) {
                                  await launcher.launch(emailAddress);
                                } else {
                                  _showDialog(
                                    context,
                                    title: 'Sorry',
                                    msg: 'please try again ',
                                  );
                                }
                              },
                            ),
                            InfoCard(
                              text: snapshot.data.data.gender,
                              icon: Icons.web,
                              onPressed: () async {
                                if (await launcher.canLaunch(url)) {
                                  await launcher.launch(url);
                                } else {
                                  _showDialog(
                                    context,
                                    title: 'Sorry',
                                    msg: 'please try again ',
                                  );
                                }
                              },
                            ),
                            InfoCard(
                              text: snapshot.data.data.address,
                              icon: Icons.location_city,
                              onPressed: () {
                                print('location');
                              },
                            ),
                          ],
                        ),
                      ],
                    );
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
}
