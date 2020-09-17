import 'package:com/util/Constants.dart';
import 'package:com/util/navigation.dart';
import 'package:com/util/strings.dart';
import 'package:flutter/material.dart';


class FirstSection extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<FirstSection> {
  int _radioValue1 = -1;
  int _radioValue2 = -1;
  int _radioValue3 = -1;
  int _radioValue4 = -1;
  int _radioValue5 = -1;
  int _radioValue6 = -1;
  int _radioValue7 = -1;
  double paddingSize = 4.0;
  double questionSize = 16.0;
  double answerSize = 14.0;
  double dividerSize = 2.0;
  double buttonPaddingSize = 7.0;
  double buttonTextSize = 25.0;
  double buttonRadius = 20.0;

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

  void _handleRadioValueChange5(int value) {
    setState(() {
      _radioValue5 = value;
    });
  }

  void _handleRadioValueChange6(int value) {
    setState(() {
      _radioValue6 = value;
    });
  }

  void _handleRadioValueChange7(int value) {
    setState(() {
      _radioValue7 = value;
    });
  }

  @override
  Widget build(BuildContext context) {

    final key = new GlobalKey<ScaffoldState>();
    void _print(String text) => key.currentState.showSnackBar(new SnackBar(content: new Text(text)));

    return new Scaffold(
            appBar: AppBar(
              title: Text(Strings.FIRST_SECTION),
              centerTitle: true,
              actions: <Widget>[
                // action button
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: finish,
                ),
              ],
            ),
            body: new SingleChildScrollView(
                padding: EdgeInsets.all(paddingSize),
                child:
                new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Padding(padding: new EdgeInsets.all(paddingSize),),
                      new Text(Strings.QUESTION_1,
                        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: questionSize,),
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio(value: 0, groupValue: _radioValue1, onChanged: _handleRadioValueChange1,),
                          new Text(Strings.NO, style: new TextStyle(fontSize: answerSize),),
                          new Radio(value: 1, groupValue: _radioValue1, onChanged: _handleRadioValueChange1,),
                          new Text(Strings.MORE_OR_LESS, style: new TextStyle(fontSize: answerSize),),
                          new Radio(value: 2, groupValue: _radioValue1, onChanged: _handleRadioValueChange1,),
                          new Text(Strings.YES, style: new TextStyle(fontSize: answerSize),),
                        ],
                      ),
                      new Divider(height: dividerSize, color: Colors.black,),
                      new Padding(padding: new EdgeInsets.all(paddingSize),),
                      new Text(Strings.QUESTION_2,
                        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: questionSize,),
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio(value: 0, groupValue: _radioValue2, onChanged: _handleRadioValueChange2,),
                          new Text(Strings.NO, style: new TextStyle(fontSize: answerSize),),
                          new Radio(value: 1, groupValue: _radioValue2, onChanged: _handleRadioValueChange2,),
                          new Text(Strings.MORE_OR_LESS, style: new TextStyle(fontSize: answerSize),),
                          new Radio(value: 2, groupValue: _radioValue2, onChanged: _handleRadioValueChange2,),
                          new Text(Strings.YES, style: new TextStyle(fontSize: answerSize),),
                        ],
                      ),
                      new Divider(height: dividerSize, color: Colors.black,),
                      new Padding(padding: new EdgeInsets.all(paddingSize),),
                      new Text(Strings.QUESTION_3,
                        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: questionSize,),
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio(value: 0, groupValue: _radioValue3, onChanged: _handleRadioValueChange3,),
                          new Text(Strings.NO, style: new TextStyle(fontSize: answerSize),),
                          new Radio(value: 1, groupValue: _radioValue3, onChanged: _handleRadioValueChange3,),
                          new Text(Strings.MORE_OR_LESS, style: new TextStyle(fontSize: answerSize),),
                          new Radio(value: 2, groupValue: _radioValue3, onChanged: _handleRadioValueChange3,),
                          new Text(Strings.YES, style: new TextStyle(fontSize: answerSize),),
                        ],
                      ),
                      new Divider(height: dividerSize, color: Colors.black,),
                      new Padding(padding: new EdgeInsets.all(paddingSize),),
                      new Text(Strings.QUESTION_4,
                        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: questionSize,),
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio(value: 0, groupValue: _radioValue4, onChanged: _handleRadioValueChange4,),
                          new Text(Strings.NO, style: new TextStyle(fontSize: answerSize),),
                          new Radio(value: 1, groupValue: _radioValue4, onChanged: _handleRadioValueChange4,),
                          new Text(Strings.MORE_OR_LESS, style: new TextStyle(fontSize: answerSize),),
                          new Radio(value: 2, groupValue: _radioValue4, onChanged: _handleRadioValueChange4,),
                          new Text(Strings.YES, style: new TextStyle(fontSize: answerSize),),
                        ],
                      ),
                      new Divider(height: dividerSize, color: Colors.black,),
                      new Padding(padding: new EdgeInsets.all(paddingSize),),
                      new Text(Strings.QUESTION_5,
                        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: questionSize,),
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio(value: 0, groupValue: _radioValue5, onChanged: _handleRadioValueChange5,),
                          new Text(Strings.NO, style: new TextStyle(fontSize: answerSize),),
                          new Radio(value: 1, groupValue: _radioValue5, onChanged: _handleRadioValueChange5,),
                          new Text(Strings.MORE_OR_LESS, style: new TextStyle(fontSize: answerSize),),
                          new Radio(value: 2, groupValue: _radioValue5, onChanged: _handleRadioValueChange5,),
                          new Text(Strings.YES, style: new TextStyle(fontSize: answerSize),),
                        ],
                      ),
                      new Divider(height: dividerSize, color: Colors.black,),
                      new Padding(padding: new EdgeInsets.all(paddingSize),),
                      new Text(Strings.QUESTION_6,
                        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: questionSize,),
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio(value: 0, groupValue: _radioValue6, onChanged: _handleRadioValueChange6,),
                          new Text(Strings.NO, style: new TextStyle(fontSize: answerSize),),
                          new Radio(value: 1, groupValue: _radioValue6, onChanged: _handleRadioValueChange6,),
                          new Text(Strings.MORE_OR_LESS, style: new TextStyle(fontSize: answerSize),),
                          new Radio(value: 2, groupValue: _radioValue6, onChanged: _handleRadioValueChange6,),
                          new Text(Strings.YES, style: new TextStyle(fontSize: answerSize),),
                        ],
                      ),
                      new Divider(height: dividerSize, color: Colors.black,),
                      new Padding(padding: new EdgeInsets.all(paddingSize),),
                      new Text(Strings.QUESTION_7,
                        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: questionSize,),
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio(value: 0, groupValue: _radioValue7, onChanged: _handleRadioValueChange7,),
                          new Text(Strings.NO, style: new TextStyle(fontSize: answerSize),),
                          new Radio(value: 1, groupValue: _radioValue7, onChanged: _handleRadioValueChange7,),
                          new Text(Strings.MORE_OR_LESS, style: new TextStyle(fontSize: answerSize),),
                          new Radio(value: 2, groupValue: _radioValue7, onChanged: _handleRadioValueChange7,),
                          new Text(Strings.YES, style: new TextStyle(fontSize: answerSize),),
                        ],
                      ),
                    ]
                )
            )
        );
  }

  void finish(){
    Constants.firstSection.depression = _radioValue1+_radioValue2+_radioValue3;
    Constants.firstSection.stress = _radioValue4+_radioValue5;
    Constants.firstSection.anxiety = _radioValue6+_radioValue7;
    Navigation.navigateToSecond(context);
  }
}
