import 'package:flutter/material.dart';

class EndGameButtons extends StatelessWidget {

  final String text;
  final String route;
  final int mode;

  const EndGameButtons({Key key, this.text, this.route, this.mode}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    Color color;
    Color textColor;
    Color splashColor;
    Border border;

    switch (this.mode) {
      case 1:
        color = Color(0xff6ec2bb);
        splashColor = Color(0xff6ec2bb);
        textColor = Color(0xffEEEEEE);
        border = Border.all(width: 0, color: Color(0xff6ec2bb));
        break;
      case 2:
        color = Color(0xffffffff);
        splashColor = Color(0xffffffff);
        textColor = Color(0xff6ec2bb);
        border = Border.all(width: 2, color: Color(0xff6ec2bb));
        break;
    }

    return Container(
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: border,
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: color,
        textColor: textColor,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding:
            EdgeInsets.only(bottom: 15.0, top: 15.0, left: 45.0, right: 45.0),
        splashColor: splashColor,
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            route,
            (route) => false,
          );
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
