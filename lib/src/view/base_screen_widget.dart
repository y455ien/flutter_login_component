import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_component/src/bloc/login_bloc.dart';
import 'package:login_component/src/domain/domain.dart';
import 'package:login_component/src/repository/login_repository.dart';
import 'package:login_component/src/webservice/web_service.dart';

class BaseScreenWidget extends InheritedWidget {

  final _bloc = LoginBloc();

  BaseScreenWidget({Key key, Widget child})
  : super(key: key, child: child) {
    observeBlocState();
  }

  observeBlocState() {
    _bloc.authStream.listen((event) {showToast(event.name);}, onError: (error) {showToast(error);});
  }

  @override
  bool updateShouldNotify(_) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BaseScreenWidget>()._bloc;
  }

  static showLoading() {
    BotToast.showLoading();
  }

  hideLoading() {
    BotToast.closeAllLoading();
  }

  showToast(String message) {
    hideLoading();
    BotToast.showText(text:message);
  }

  navigate() {

  }

  dispose() {
    _bloc.dispose();
  }

}