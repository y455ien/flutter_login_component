import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CredentialChangedEvent extends LoginEvent {
  final String _credential;

  CredentialChangedEvent(this._credential);

  String get credential => _credential;

  @override
  List<Object> get props => [_credential];
}

class LoginButtonEvent extends LoginEvent {
  final String _credential;

  LoginButtonEvent(this._credential);

  String get credential => _credential;

  @override
  // TODO: implement props
  List<Object> get props => [_credential];
}

class NetworkResponseEvent extends LoginEvent {
  final dynamic _response;

  NetworkResponseEvent(this._response);

  dynamic get response => _response;

  @override
  // TODO: implement props
  List<Object> get props => [_response];
}