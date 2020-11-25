import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  Function onPressed;

  InfoCard({@required this.text, @required this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.grey[100],
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Color.fromRGBO(143, 148, 251, 1),
          ),
          title: Text(
            text,
            style: TextStyle(
              color: Color.fromRGBO(143, 148, 251, 1),
              fontSize: 20.0,
              fontFamily: 'Source Sans Pro',
            ),
          ),
        ),
      ),
    );
  }
}