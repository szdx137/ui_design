import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Color(0xFF18D191),
        foregroundColor: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.green,
        ),
      ),
    );
  }
}
