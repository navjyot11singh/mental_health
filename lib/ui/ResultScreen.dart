import 'package:com/colors/LightColors.dart';
import 'package:com/theme/light_color.dart';
import 'package:com/util/Constants.dart';
import 'package:com/util/navigation.dart';
import 'package:com/widgets/ActiveProjectCard.dart';
import 'package:com/widgets/TaskColumn.dart';
import 'package:com/widgets/TopContainerWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:share/share.dart';

class ResultSection extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class _MyHomePageState extends State<ResultSection> {
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int depression = Constants.firstSection.depression +
        Constants.secondSection.depression +
        Constants.thirdSection.depression;
    int stress = Constants.firstSection.stress +
        Constants.secondSection.stress +
        Constants.thirdSection.stress;
    int anxiety = Constants.firstSection.anxiety +
        Constants.secondSection.anxiety +
        Constants.thirdSection.anxiety;

    int total = depression + stress + anxiety;
    double depressionPercentage = depression / total;
    double stressPercentage = stress / total;
    double anxietyPercentage = anxiety / total;

    final key = new GlobalKey<ScaffoldState>();
    // void _print(String text) =>
    //     key.currentState.showSnackBar(new SnackBar(content: new Text(text)));
    String _result() {
      String result = "";
      if (depression > 4) {
        result = "You're sunk in depression :c";
      } else if (stress > 2) {
        result = "You're sunk in stress :c";
      } else if (anxiety > 2) {
        result = "You are sunk in anxiety :c";
      } else {
        result = "It's sanitary :)";
      }
      return result;
    }

    var data = [
      new ClicksPerYear('2016', depression, LightColors.kRed),
      new ClicksPerYear('2017', stress, LightColors.kDarkYellow),
      new ClicksPerYear('2018', anxiety, LightColors.kGreen),
    ];

    var series = [
      new charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];
    Widget _appBar() {
      return AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
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
                color: Color.fromRGBO(143, 148, 251, 1),
              ),
              child: GestureDetector(
                  onTap: () {
                    Navigation.navigateToUserDetails(context);
                  },
                  child: Image.asset("assets/user.png", fit: BoxFit.fill)),
            ),
          ),
        ],
      );
    }

    var chartWidget = new SizedBox(
      height: 200,
      width: 200,
      child: new charts.PieChart(series),
    );
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _appBar(),
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TopContainer(
                  height: 300,
                  width: width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              chartWidget,
                              Container(
                                child: Text(
                                  _result(),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('My Score'),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => CalendarPage()),
                                  // );
                                },
                                child: calendarIcon(),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.alarm,
                            iconBackgroundColor: LightColors.kDarkYellow,
                            title: 'Depression',
                            subtitle: depressionPercentage.toString() + "%",
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TaskColumn(
                            icon: Icons.blur_circular,
                            iconBackgroundColor: LightColors.kRed,
                            title: 'Stress',
                            subtitle: stressPercentage.toString() + "%",
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.check_circle_outline,
                            iconBackgroundColor: LightColors.kLightGreen,
                            title: 'Anxiety',
                            subtitle: anxietyPercentage.toString() + "%",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Some Options'),
                          SizedBox(height: 5.0),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigation.navigateToDoctorsSection(
                                        context);
                                  },
                                  child: ActiveProjectsCard(
                                    cardColor: LightColors.kGreen,
                                    loadingPercent: 0.25,
                                    title: 'Medical App',
                                    subtitle: 'Seek professional help',
                                    image: 'assets/doctoricon.png',
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.0),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigation.navigateToChatBot(context);
                                  },
                                  child: ActiveProjectsCard(
                                    cardColor: Color.fromRGBO(143, 148, 251, 1),
                                    loadingPercent: 0.6,
                                    title: 'Ask your doubts',
                                    subtitle:
                                        'A chatbot to ask anything you want',
                                    image: 'assets/chatboticon.png',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    Share.share(
                                        'Hey! can you help me? I am not feeling well.');
                                  },
                                  child: ActiveProjectsCard(
                                    cardColor: Color.fromRGBO(143, 148, 251, 1),
                                    loadingPercent: 0.45,
                                    title: 'Chat with friends',
                                    subtitle: 'Go and chat with your friends',
                                    image: 'assets/messageicon.png',
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.0),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigation.navigateToDrawingUi(context);
                                  },
                                  child: ActiveProjectsCard(
                                    cardColor: LightColors.kBlue,
                                    loadingPercent: 0.9,
                                    title: 'Draw something',
                                    subtitle: 'Drawing relives stress level',
                                    image: 'assets/drawingicon.png',

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
