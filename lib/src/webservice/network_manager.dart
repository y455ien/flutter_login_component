import 'package:dio/dio.dart';
import 'package:login_component/src/model/login_reponse.dart';
import 'package:login_component/src/webservice/web_service.dart';

class NetworkManager {
  final WebService _webService;
  Dio dioClient;
  final BaseOptions _options = BaseOptions(
    baseUrl: "https://fab.intcore.net/",
    headers: {"Accept": "application/json", "Accept-Language": "en"},
    responseType: ResponseType.json,
    contentType: "application/json",
  );

  NetworkManager(this._webService) {
    dioClient = Dio(_options);
    dioClient.interceptors.add(LogInterceptor(error: true, request: true, requestBody: true, responseBody: true));
  }

  fabLogin() {
    _webService
        .fabLogin(dioClient, "api/v1/user/auth/regular/login", {
          "email": "m.yassin@intcore.net",
          "password": "Aa123123",
          "device_id": "12123",
        })
        .then(_pushResponseToStream)
        .catchError(_pushErrorMessageToStream);
  }

  _pushResponseToStream(Response response) {
    if (response.statusCode >= 200 && response.statusCode <= 299) LoginResponse loginResponse = LoginResponse.fromJson(response.data);
  }

  _pushErrorMessageToStream(dynamic error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.RESPONSE:
          print("ERROR TYPE IS: DIO ERROR");
          int statusCode = error.response.statusCode;
          if (statusCode == 422) {
            Response response = error.response;
            //Parse error list
          } else if (statusCode >= 400 && statusCode <= 499) {
            //Client Side Issue
          } else if (statusCode >= 500 && statusCode <= 599) {
            //Server Side issues
          }
          break;
        case DioErrorType.CONNECT_TIMEOUT:
        case DioErrorType.SEND_TIMEOUT:
        case DioErrorType.RECEIVE_TIMEOUT:
        case DioErrorType.CANCEL:
          String errorMessage = "Connection Timeout, Please check your internet connection";
          break;
        case DioErrorType.DEFAULT:
          String errorMessage = error.error.toString();
          break;
      }
    }
  }
}
