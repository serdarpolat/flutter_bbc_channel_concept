import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 44,
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xffBB1100),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: 30,
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xffBB1100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
