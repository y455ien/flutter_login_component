
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_component/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {

  final bloc = LoginBloc();

  Provider({Key key, Widget child})
  : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().bloc;
  }

  static void showToast(BuildContext context) {
    BotToast.showText(text:"event");
  }

}