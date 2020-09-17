import 'package:com/util/Constants.dart';
import 'package:com/util/navigation.dart';
import 'package:com/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
    void _print(String text) =>
        key.currentState.showSnackBar(new SnackBar(content: new Text(text)));
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
      new ClicksPerYear('2016', depression, Colors.red),
      new ClicksPerYear('2017', stress, Colors.yellow),
      new ClicksPerYear('2018', anxiety, Colors.green),
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

    var chartWidget = new Padding(
      padding: new EdgeInsets.all(32.0),
      child: new SizedBox(
        height: 200.0,
        child: new charts.PieChart(series),
      ),
    );

    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text(Strings.RESULTS),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  _result(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.display1,
                ),
                chartWidget,
              ],
            ),
            RaisedButton(
              color: Colors.blue,
              disabledColor: Colors.blue,
              onPressed: () {
                Navigation.navigateToDoctorsSection(context);
              },
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _print(
            'Yellow: Depression with $depressionPercentage%\n' +
                'Red: Stress with $stressPercentage%\n' +
                'Green: Anxiety with $anxietyPercentage%\n'),
        tooltip: 'Increment',
        child: new Icon(Icons.info),
      ),
    );
  }
}
