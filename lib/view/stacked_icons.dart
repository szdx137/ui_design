import 'package:flutter/material.dart';

class StackedIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 70,
          ),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.red[400],
          ),
          child: Icon(
            Icons.book,
            color: Colors.white,
            size: 30,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: 70,
          ),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.blue[400],
          ),
          child: Icon(
            Icons.school,
            color: Colors.white,
            size: 30,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 70,
          ),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.green[400],
          ),
          child: Icon(
            Icons.power,
            color: Colors.white,
            size: 30,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            right: 70,
          ),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.brown[400],
          ),
          child: Icon(
            Icons.cast_for_education,
            color: Colors.white,
            size: 30,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 0,
          ),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.yellow[700]),
          child: Icon(
            Icons.hourglass_top_sharp,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}
