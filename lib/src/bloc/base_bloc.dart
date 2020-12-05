
import 'package:login_component/src/repository/login_repository.dart';

abstract class BaseBloc {

  LoginRepository loginRepository;

  BaseBloc(this.loginRepository);

  void fireRequest() {
    loginRepository.login(username: "m.yassin@intcore.net", password: "Aa123123");
  }

}
