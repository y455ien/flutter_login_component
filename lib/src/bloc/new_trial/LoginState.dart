import 'package:equatable/equatable.dart';
import 'package:login_component/src/model/login_reponse.dart';

class LoginState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CredentialValidState extends LoginState {
  final String _credential;

  CredentialValidState(this._credential);

  @override
  // TODO: implement props
  List<Object> get props => [_credential];
}

class CredentialInvalidState extends LoginState {
  final String _errorMessage;

  CredentialInvalidState(this._errorMessage);

  @override
  // TODO: implement props
  List<Object> get props => [_errorMessage];
}

class UserFoundState extends LoginState {
  final LoginResponse _user;

  UserFoundState(this._user);

  @override
  // TODO: implement props
  List<Object> get props => [_user];
}

class UserNotFoundState extends LoginState {

}

class NetworkRequestFailedState extends LoginState {
  final String _errorMessage;

  NetworkRequestFailedState(this._errorMessage);

  String get errorMessage => _errorMessage;

  @override
  // TODO: implement props
  List<Object> get props => [_errorMessage];
}