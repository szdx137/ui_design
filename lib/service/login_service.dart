import 'dart:convert';

import 'package:ui_design/model/login_model.dart';
import 'package:http/http.dart' as http;

class LoginService {
  LoginResponseModel loginResponseModel;

  Future<void> login(LoginRequestModel requestModel) async {
    String url = "https://reqres.in/api/login";

    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      print('got some response from api');

      loginResponseModel = LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
