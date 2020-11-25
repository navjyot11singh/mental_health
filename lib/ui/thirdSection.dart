import 'package:com/util/Constants.dart';
import 'package:com/util/navigation.dart';
import 'package:com/util/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThirdSection extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<ThirdSection> {
  double paddingSize = 4.0;
  double questionSize = 16.0;
  double answerSize = 14.0;
  double dividerSize = 2.0;
  double buttonPaddingSize = 7.0;
  double buttonTextSize = 25.0;
  double buttonRadius = 20.0;

  int _radioValue1 = -1;
  int _radioValue2 = -1;
  int _radioValue3 = -1;
  int _radioValue4 = -1;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;
    });
  }

  void _handleRadioValueChange3(int value) {
    setState(() {
      _radioValue3 = value;
    });
  }

  void _handleRadioValueChange4(int value) {
    setState(() {
      _radioValue4 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        title: Text(
          Strings.THIRD_SECTION,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: finish,
            color: Colors.white,
          ),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Image.asset(
            'images/image_1.png',
          ),
          new Padding(
            padding: new EdgeInsets.all(paddingSize),
          ),
          new Text(
            Strings.PHOTO_QUESTION_1,
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: questionSize,
            ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Radio(
                value: 0,
                groupValue: _radioValue1,
                onChanged: _handleRadioValueChange1,
              ),
              new Text(
                Strings.PHOTO_NO,
                style: new TextStyle(fontSize: answerSize),
              ),
              new Radio(
                value: 1,
                groupValue: _radioValue1,
                onChanged: _handleRadioValueChange1,
              ),
              new Text(
                Strings.PHOTO_MORE_OR_LESS,
                style: new TextStyle(fontSize: answerSize),
              ),
              new Radio(
                value: 2,
                groupValue: _radioValue1,
                onChanged: _handleRadioValueChange1,
              ),
              new Text(
                Strings.PHOTO_YES,
                style: new TextStyle(fontSize: answerSize),
              ),
            ],
          ),
          new Image.asset(
            'images/image_2.png',
          ),
          new Padding(
            padding: new EdgeInsets.all(paddingSize),
          ),
          new Text(
            Strings.PHOTO_QUESTION_2,
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: questionSize,
            ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Radio(
                value: 0,
                groupValue: _radioValue2,
                onChanged: _handleRadioValueChange2,
              ),
              new Text(
                Strings.PHOTO_NO,
                style: new TextStyle(fontSize: answerSize),
              ),
              new Radio(
                value: 1,
                groupValue: _radioValue2,
                onChanged: _handleRadioValueChange2,
              ),
              new Text(
                Strings.PHOTO_MORE_OR_LESS,
                style: new TextStyle(fontSize: answerSize),
              ),
              new Radio(
                value: 2,
                groupValue: _radioValue2,
                onChanged: _handleRadioValueChange2,
              ),
              new Text(
                Strings.PHOTO_YES,
                style: new TextStyle(fontSize: answerSize),
              ),
            ],
          ),
          new Image.asset(
            'images/image_3.png',
          ),
          new Padding(
            padding: new EdgeInsets.all(paddingSize),
          ),
          new Text(
            Strings.PHOTO_QUESTION_3,
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: questionSize,
            ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Radio(
                value: 0,
                groupValue: _radioValue3,
                onChanged: _handleRadioValueChange3,
              ),
              new Text(
                Strings.PHOTO_NO,
                style: new TextStyle(fontSize: answerSize),
              ),
              new Radio(
                value: 1,
                groupValue: _radioValue3,
                onChanged: _handleRadioValueChange3,
              ),
              new Text(
                Strings.PHOTO_MORE_OR_LESS,
                style: new TextStyle(fontSize: answerSize),
              ),
              new Radio(
                value: 2,
                groupValue: _radioValue3,
                onChanged: _handleRadioValueChange3,
              ),
              new Text(
                Strings.PHOTO_YES,
                style: new TextStyle(fontSize: answerSize),
              ),
            ],
          ),
          new Image.asset(
            'images/image_4.png',
          ),
          new Padding(
            padding: new EdgeInsets.all(paddingSize),
          ),
          new Text(
            Strings.PHOTO_QUESTION_4,
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: questionSize,
            ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Radio(
                value: 0,
                groupValue: _radioValue4,
                onChanged: _handleRadioValueChange4,
              ),
              new Text(
                Strings.PHOTO_NO,
                style: new TextStyle(fontSize: answerSize),
              ),
              new Radio(
                value: 1,
                groupValue: _radioValue4,
                onChanged: _handleRadioValueChange4,
              ),
              new Text(
                Strings.PHOTO_MORE_OR_LESS,
                style: new TextStyle(fontSize: answerSize),
              ),
              new Radio(
                value: 2,
                groupValue: _radioValue4,
                onChanged: _handleRadioValueChange4,
              ),
              new Text(
                Strings.PHOTO_YES,
                style: new TextStyle(fontSize: answerSize),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void finish() {
    Constants.thirdSection.depression = _radioValue1 + _radioValue2;
    Constants.thirdSection.stress = _radioValue3;
    Constants.thirdSection.anxiety = _radioValue4;
    Navigation.navigateToResult(context);
  }
}
