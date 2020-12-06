import 'package:dio/dio.dart';
import 'package:login_component/src/model/login_reponse.dart';
import 'package:login_component/src/repository/login_repository.dart';
import 'file:///C:/Users/Hp/AndroidStudioProjects/login_component/lib/src/domain/use_case_transformer.dart';
import 'package:rxdart/rxdart.dart';

class Domain extends Object with UseCaseTransformer {
  final LoginRepository _loginRepository = LoginRepository();
  final PublishSubject<String> _validationStream = PublishSubject<String>();

  Stream<LoginResponse> get webResponseStream => _loginRepository.webResponseStream.transform(authTransformer);
  Stream<String> get validationStream => _validationStream.stream.transform(emailValidatorTransformer);

  login(String userCredential) {
    _loginRepository.login(userCredential);
  }

  validateUserInput(String userInput) {
    _validationStream.add(userInput);
  }

  dispose() {
    _validationStream.close();
    _loginRepository.dispose();
  }
}
