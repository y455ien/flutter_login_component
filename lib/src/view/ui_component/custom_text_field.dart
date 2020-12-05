import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_component/src/bloc/login_bloc.dart';

class CustomTextField extends StatelessWidget {
  final LoginBloc _bloc;

  CustomTextField(this._bloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.credentialStream,
      builder: (context, snapshot) {
        return TextField(
          onChanged: (value) {
            _bloc.addToCredentialStream(value);
          },
          decoration: InputDecoration(errorText: snapshot.error),
        );
      },
    );
  }
}
