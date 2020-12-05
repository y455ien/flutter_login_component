import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:login_component/src/view/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: LoginScreen(),
      ),
    );
  }
}
