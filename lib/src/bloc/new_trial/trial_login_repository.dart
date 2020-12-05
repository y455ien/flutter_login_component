import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:login_component/src/model/login_reponse.dart';
import 'package:login_component/src/webservice/web_service.dart';

class TrialLoginRepo {

  final _streamController = StreamController<String>.broadcast();
  final WebService _webService;

  TrialLoginRepo({@required WebService webService}) : _webService = webService;

  login({@required String username, @required String password}) {
    return _webService.makeRequest(username: username, password: password).then((value) => {
      _streamController.sink.add("event")
    });
  }

  fireRequest(String credential) async {
    return await Future.delayed(Duration(seconds: 2), () {
      _streamController.sink.add("Request Fired");
    });
  }

  Stream<String> get repoStream => _streamController.stream;


  closeSink() {
    _streamController.close();
  }

}