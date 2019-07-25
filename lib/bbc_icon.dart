import 'package:flutter/material.dart';

class BbcIcon extends StatelessWidget {
  final Color textColor;

  BbcIcon({this.textColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          color: Colors.white,
          child: Text(
            'B',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            color: Colors.white,
            child: Text(
              'B',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ),
        Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          color: Colors.white,
          child: Text(
            'C',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
