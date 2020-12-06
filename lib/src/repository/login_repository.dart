import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_component/src/model/login_reponse.dart';
import 'package:login_component/src/webservice/auth_client.dart';
import 'package:login_component/src/webservice/web_service.dart';
import 'package:rxdart/rxdart.dart';

class LoginRepository {
  final AuthClient networkManager = AuthClient(WebService());
  final PublishSubject<Response> _webResponseStream = PublishSubject<Response>();

  Stream<Response> get webResponseStream => _webResponseStream.stream;

  login(String userCredential) {
    networkManager.login(userCredential).then((response) => _webResponseStream.add(response)).catchError((error) {_webResponseStream.addError(error);});
  }

  dispose() {
    _webResponseStream.close();
  }
}
