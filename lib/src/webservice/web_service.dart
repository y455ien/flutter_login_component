import 'package:dio/dio.dart';

class WebService {
  Future<Response> login(Dio dioClient, String url, Map<String, String> data) async {
    return await dioClient.post(url, data: data);
  }
}
