import 'dart:async';

import 'package:login_component/src/bloc/base_bloc.dart';
import 'package:login_component/src/model/login_reponse.dart';
import 'package:login_component/src/repository/login_repository.dart';
import 'package:login_component/src/util/transformers.dart';
import 'package:login_component/src/webservice/web_service.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Object with Transformers {
  final _credentialStream = PublishSubject<String>();
  final _authStream = StreamController<String>.broadcast();
  final _loginRepository = LoginRepository(webService: WebService());
  String _userCredential;

  //Constructor
  LoginBloc() {
    _loginRepository.responseStream.transform(responseTransformer).listen((event) {}, onError: (error) {
      authSink(error);
    });
  }

  // Expose Streams
  Stream<String> get authStream => _authStream.stream;
  Stream<String> get credentialStream => _credentialStream.transform(emailValidator).doOnData((userInput) {
        _userCredential = userInput;
      });

  // Exposing Sinks
  get authSink => _authStream.sink.add;
  get addToCredentialStream => _credentialStream.add;

  //Fire Login request
  fireRequest() {
    _loginRepository.callFabAPI(_userCredential);
  }

  //Dispose Streams
  dispose() {
    _authStream.close();
    _credentialStream.close();
  }
}
