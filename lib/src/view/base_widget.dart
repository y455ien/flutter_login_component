import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_component/src/bloc/login_bloc.dart';

abstract class BaseWidget extends StatelessWidget {

  final LoginBloc _bloc;

  BaseWidget(this._bloc) {
    _observeBloc();
  }

  _observeBloc() {
    _bloc.authStream.listen((event) {
      BotToast.showText(text:event);
    });
  }

  LoginBloc get bloc => _bloc;
}