import 'dart:async';
import 'package:login_component/src/domain/domain.dart';
import 'package:login_component/src/model/login_reponse.dart';

class LoginBloc  {
  final _loginUseCase = Domain();
  String _userCredential;

  Stream<String> get validationStream => _loginUseCase.validationStream;
  Stream<LoginResponse> get authStream => _loginUseCase.webResponseStream;

  login(String userCredential) {
    _userCredential = userCredential;
    _loginUseCase.login(_userCredential);
  }

  validateUserInput(String userInput) {
    _loginUseCase.validateUserInput(userInput);
  }

  //Dispose Streams
  dispose() {
    _loginUseCase.dispose();
  }
}
