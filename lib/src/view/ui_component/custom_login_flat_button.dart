
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_component/src/bloc/login_bloc.dart';

class CustomFlatButton extends StatelessWidget {
  final LoginBloc _bloc;

  CustomFlatButton(this._bloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.credentialStream,
      builder: (context, snapshot) {
        return FlatButton(
          onPressed: !snapshot.hasData ? null : () {
            BotToast.showLoading();
            _bloc.fireRequest();
            },
          child: Text("NEXT",),
          color: Colors.black,
          textColor: Colors.white,
          disabledColor: Colors.red,
        );
      },
    );
  }

}