import 'package:dio/dio.dart';
import 'package:login_component/src/webservice/web_service.dart';

class AuthClient {
  final WebService _webService;
  Dio dioClient;

  AuthClient(this._webService) {
    _initClient();
  }

  _initClient() {
    final BaseOptions _options = BaseOptions(
      baseUrl: "https://fab.intcore.net/",
      headers: {"Accept": "application/json", "Accept-Language": "en"},
      responseType: ResponseType.json,
      contentType: "application/json",
    );
    dioClient = Dio(_options);
    dioClient.interceptors.add(LogInterceptor(error: true, request: true, requestBody: true, responseBody: true));
  }

  Future<Response> login(String userCredential) {
    return _webService
        .login(dioClient, "api/v1/user/auth/regular/login", {
          "email": userCredential,
          "password": "Aa123123",
          "device_id": "12123",
        });
  }
}
