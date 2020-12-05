import 'dart:async';

import 'file:///C:/Users/Hp/AndroidStudioProjects/login_component/lib/src/bloc/new_trial/LoginState.dart';
import 'file:///C:/Users/Hp/AndroidStudioProjects/login_component/lib/src/bloc/new_trial/login_event.dart';
import 'package:login_component/src/bloc/new_trial/trial_login_repository.dart';
import 'package:login_component/src/model/login_reponse.dart';
import 'package:login_component/src/repository/login_repository.dart';
import 'package:login_component/src/util/transformers.dart';
import 'package:login_component/src/webservice/web_service.dart';


final _loginRepository = TrialLoginRepo(webService: WebService());


class TrialBloc extends Object with Transformers {

  final _mainStream = StreamController.broadcast();

  final mainTransformer = new StreamTransformer<LoginEvent, LoginState>.fromHandlers(
    handleData: (loginEvent, sink) {
      if (loginEvent is CredentialChangedEvent) {
        final credential = loginEvent.credential;
        if (credential.contains("@")) sink.add(CredentialValidState(credential));
        else sink.add(CredentialInvalidState("Please Enter a Valid Email"));
      }
      else if (loginEvent is LoginButtonEvent) {
        final credential = loginEvent.credential;
        _loginRepository.fireRequest(credential);
      }
      else if (loginEvent is NetworkResponseEvent) {
        dynamic response = loginEvent.response;
        if (response = null) sink.add(UserNotFoundState());
        else if (response is LoginResponse) sink.add(UserFoundState(response));
        else if (response is String) sink.add(NetworkRequestFailedState("Network Error"));
      }
    },
  );

  get mainStream => _mainStream.stream.transform(mainTransformer);
  get mainSink => _mainStream.sink.add;

  dispose() {
    _mainStream.close();
  }

}