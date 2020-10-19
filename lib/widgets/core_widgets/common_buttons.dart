import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final void Function() onTap;
  final Text text;
  final Widget icon;

  const CommonButton({
    Key key,
    @required this.onTap,
    @required this.text,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: MediaQuery.of(context).size.width * 0.65,
      onPressed: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80.0),
      ),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFBC6FC2),
              Color(0xFF8E95F1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 300.0,
            minHeight: 60.0,
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Stack(
              children: [
                Align(alignment: Alignment.centerLeft, child: text),
                Align(alignment: Alignment.centerRight, child: icon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
