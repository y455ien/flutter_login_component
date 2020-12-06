import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_component/src/view/login_widget.dart';
import 'base_screen_widget.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreenWidget(
      child: SafeArea(
        child: LoginWidget(),
      ),
    );
  }
}