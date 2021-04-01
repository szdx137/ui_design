import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_design/model/login_model.dart';
import 'package:ui_design/service/login_service.dart';
import 'package:ui_design/view/home_page.dart';
import 'package:ui_design/view/overlay_progressbar.dart';
import 'package:ui_design/view/stacked_icons.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _emailController = new TextEditingController();

  final TextEditingController _passwordController = new TextEditingController();

  bool _isLoading = false;

  LoginResponseModel loginResponseModel = new LoginResponseModel();

  login(String email, String password) async {
    LoginService loginService = new LoginService();
    await loginService
        .login(new LoginRequestModel(email: email, password: password));

    loginResponseModel = loginService.loginResponseModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Color(
            0xFF18D191,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StackedIcons(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 80.0),
                  child: Text(
                    'Wire Web',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 5.0,
                      top: 10.0,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        FocusScope.of(context)
                            .unfocus(); // dismiss on screen keyboard

                        OverlayProgressBar.buildShowDialog(context);

                        // setState(() {
                        //   _isLoading = true;
                        // });

                        await login(
                            _emailController.text, _passwordController.text);

                        if (loginResponseModel.token != null) {
                          print(loginResponseModel.token);
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('token', loginResponseModel.token);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext ctx) => HomePage()));
                          Fluttertoast.showToast(
                              msg: "Login Success",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          Fluttertoast.showToast(
                            msg: loginResponseModel.error,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );

                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(
                          //     duration: Duration(milliseconds: 700),
                          //     content: Text(loginResponseModel.error),
                          //   ),
                          // );

                          Navigator.of(context)
                              .pop(); // pop progress indicator when getting error message
                        }

                        // setState(() {
                        //   _isLoading = false;
                        // });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF18D191),
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 20.0,
                      left: 5.0,
                      top: 10.0,
                    ),
                    child: GestureDetector(
                      onTap: () => print(_emailController.text),
                      child: Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF18D191),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
