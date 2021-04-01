import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_design/view/contact_us.dart';
import 'package:ui_design/view/first_page.dart';
import 'package:ui_design/view/main_content.dart';
import 'package:ui_design/view/settings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget loadWigdet = MainContent();
  String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Abhilasha Sedain"),
              accountEmail: Text("abbilasha24@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                radius: 60.0,
                backgroundColor: Color(0xFF18D191),
                backgroundImage: NetworkImage(
                  'https://www.clipartkey.com/mpngs/m/82-824693_dummy-image-of-user.png',
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  loadWigdet = MainContent();
                  appBarTitle = 'Home';
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.of(context).pop();

                setState(() {
                  loadWigdet = Settings();
                  appBarTitle = 'Settings';
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("Contact Us"),
              onTap: () {
                Navigator.of(context).pop();

                setState(() {
                  loadWigdet = ContactUs();
                  appBarTitle = 'Contact Us';
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('token');
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => FirstPage()),
                    (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.green[400]),
      ),
      body: WillPopScope(
        onWillPop: () {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(
                      'Are you sure?',
                    ),
                    content: Text('It will close the application.'),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: Text('Yes'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('No'),
                      ),
                    ],
                  ));
        },
        child: loadWigdet,
      ),
    );
  }
}
