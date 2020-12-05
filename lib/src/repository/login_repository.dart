import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_component/src/model/login_reponse.dart';
import 'package:login_component/src/webservice/network_manager.dart';
import 'package:login_component/src/webservice/web_service.dart';

class LoginRepository {
  final _streamController = StreamController<String>.broadcast();
  final _responseStream = StreamController<dynamic>.broadcast();
  final WebService _webService;

  final NetworkManager networkManager = NetworkManager(WebService());

  LoginRepository({@required WebService webService}) : _webService = webService;

  login({@required String username, @required String password}) {
    return _webService.makeRequest(username: username, password: password).then((value) => {_streamController.sink.add("event")});
  }

  fireRequest(String credential) async {
    return await Future.delayed(Duration(seconds: 2), () {
      _streamController.sink.add("Request Fired");
    });
  }

  callFabAPI(String userCredential) {
    networkManager.fabLogin();
    // _webService.makeRequest(username: "m.yassin@intcore.net3", password: "Aa1233123").then((value) => {print("THEN VALUE: $value")}, onError: (error) {
    //     int response = (error as DioError).response.statusCode;
    //     print("ERROR SERVER RESPONSE"+ response.toString());
    //   // print("CATCH ERROR VALUE: $error");
    // });
  }

  Stream<String> get repoStream => _streamController.stream;
  Stream<dynamic> get responseStream => _responseStream.stream;

  closeSink() {
    _streamController.close();
    _responseStream.close();
  }
}
