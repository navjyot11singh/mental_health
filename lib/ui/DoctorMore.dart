import 'dart:convert';
import 'dart:math';

import 'package:com/models/DoctorDataModel.dart';
import 'package:com/models/DoctorModel.dart';
import 'package:com/theme/light_color.dart';
import 'package:com/theme/text_styles.dart';
import 'package:com/theme/extention.dart';
import 'package:com/util/navigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DoctorMoreScreen extends StatefulWidget {
  final String dtype;
  DoctorMoreScreen({@required this.dtype});
  @override
  _DoctorMoreScreenState createState() => _DoctorMoreScreenState();
}

class _DoctorMoreScreenState extends State<DoctorMoreScreen> {
  Future<DoctorModel> _futureDoctorList;
  List<DoctorDataModel> doctorDataList;
  List<DoctorDataModel> showDataList=new List();
  String token;

  @override
  void initState() {
    _getDataFromSharedPref();
    super.initState();
  }

  void _getDataFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token');
      _futureDoctorList = fetchDoctorDetails();
    });
  }

  Future<DoctorModel> fetchDoctorDetails() async {
    final uri = 'https://minorp.herokuapp.com/doctor';

    final response = await http.get(uri, headers: {
      'x-auth-token': token //do token work
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("data received"+widget.dtype);

      return DoctorModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Widget _doctorTile(DoctorDataModel model) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: LightColor.grey.withOpacity(.2),
          ),
          BoxShadow(
            offset: Offset(-3, 0),
            blurRadius: 15,
            color: LightColor.grey.withOpacity(.1),
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: randomColor(),
              ),
              child: Image.network(
                model.image,
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(model.name, style: TextStyles.title.bold),
          subtitle: Text(
            model.type,
            style: TextStyles.bodySm.subTitleColor.bold,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ).ripple(() {
        Navigator.pushNamed(context, "/DetailPage", arguments: model);
      }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }

  Widget _doctorsList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Top Doctors", style: TextStyles.title.bold),
              IconButton(
                  icon: Icon(
                    Icons.sort,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {})
              // .p(12).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
            ],
          ).hP16,
          getdoctorWidgetList()
        ],
      ),
    );
  }

  Color randomColor() {
    var random = Random();
    final colorList = [
      Theme.of(context).primaryColor,
      LightColor.orange,
      LightColor.green,
      LightColor.grey,
      LightColor.lightOrange,
      LightColor.skyBlue,
      LightColor.titleTextColor,
      Colors.red,
      Colors.brown,
      LightColor.purpleExtraLight,
      LightColor.skyBlue,
    ];
    var color = colorList[random.nextInt(colorList.length)];
    return color;
  }
  Widget getdoctorWidgetList() {
    return Column(
        children: doctorDataList.map((x) {
          if(equalsIgnoreCase(x.type, widget.dtype)){
            return _doctorTile(x);
          }
        }).toList());
  }


  Widget _appBar() {

    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).backgroundColor,
      leading: Icon(
        Icons.short_text,
        size: 30,
        color: Colors.black,
      ),
      actions: <Widget>[
        Icon(
          Icons.notifications_none,
          size: 30,
          color: LightColor.grey,
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          child: Container(
            // height: 40,
            // width: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
            child: GestureDetector(
                onTap: () {
                  Navigation.navigateToUserDetails(context);
                },
                child: Image.asset("assets/user.png", fit: BoxFit.fill)),
          ),
        ).p(8),
      ],
    );
  }

  bool equalsIgnoreCase(String string1, String string2) {
    return string1?.toLowerCase() == string2?.toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: (_futureDoctorList == null)
          ? Center(
        child: CircularProgressIndicator(),
      )
          : FutureBuilder<DoctorModel>(
        future: _futureDoctorList,
        builder: (context, snapshot) {


          if (snapshot.hasData) {
            doctorDataList = snapshot.data.data;
            return CustomScrollView(
              slivers: <Widget>[
                _doctorsList()
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
    );
  }
}
