import 'dart:async';

import 'package:dio/dio.dart';
import 'package:login_component/src/model/login_reponse.dart';

class Transformers {

  final emailValidator = new StreamTransformer<String, String>.fromHandlers(
    handleData: (userInput, sink) {
      if (!userInput.contains("@")) sink.addError("Enter a Valid Email");
      else sink.add(userInput);
    },
  );

  final responseTransformer = new StreamTransformer<dynamic, dynamic>.fromHandlers(
    handleData: (data, sink) {
      // sink.add(data as LoginResponse);
    },
    handleError: (error, stackTrace, sink) {
      if (error is DioError) {
        String message = error.message;
        sink.addError(message, stackTrace);
      }
    },
  );

}
