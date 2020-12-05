import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_component/src/model/login_reponse.dart';

class WebService {
  final dio = Dio();

  Future<Response> makeRequest({@required String username, @required String password}) async {
    dio.interceptors.add(LogInterceptor(error: true, request: false, requestBody: false, responseBody: true));
    dio.options.headers = {"Accept": "application/json", "Accept-Language": "en"};
    dio.options.baseUrl = "https://fab.intcore.net/";
    Response response = await dio.post("api/v1/user/auth/regular/login", data: {
      "email": username,
      "password": password,
      "device_id": "12123",
    });
    return response;
  }

  LoginResponse processResponse(Response response) {
    if (response.statusCode == 200) {
      LoginResponse loginResponse = LoginResponse.fromJson(response.data);
      return loginResponse;
    }
    return null;
  }


  Future<Response> fabLogin(Dio dioClient, String url, Map<String, String> data) async {
    return await dioClient.post(url, data: data);
  }

}
