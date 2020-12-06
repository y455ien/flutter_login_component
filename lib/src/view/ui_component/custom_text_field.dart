import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_component/src/bloc/login_bloc.dart';

class CustomTextField extends StatelessWidget {
  final LoginBloc _bloc;

  CustomTextField(this._bloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.validationStream,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            _bloc.validateUserInput(value);
          },
          decoration: InputDecoration(errorText: snapshot.error),
        );
      },
    );
  }
}
