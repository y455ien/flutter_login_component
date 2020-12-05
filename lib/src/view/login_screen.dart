import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_component/src/view/login_widget.dart';
import '../bloc/provider.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: SafeArea(
        child: LoginWidget(),
      ),
    );
  }
}