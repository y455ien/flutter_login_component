import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:dio/dio.dart';
import 'package:login_component/src/model/login_reponse.dart';

class UseCaseTransformer {
  final authTransformer = new StreamTransformer<Response, LoginResponse>.fromHandlers(
    handleData: (response, sink) {
      if (response.statusCode >= 200 && response.statusCode <= 299) sink.add(LoginResponse.fromJson(response.data));
    },
    handleError: (error, stackTrace, sink) {
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.RESPONSE:
            int statusCode = error.response.statusCode;
            sink.addError("error: " + statusCode.toString());
            if (statusCode == 422) {
              Response response = error.response;
              //Parse error list
            } else if (statusCode >= 400 && statusCode <= 499) {
              //Client Side Issue (ASK)
            } else if (statusCode >= 500 && statusCode <= 599) {
              //Server Side issues (ASK)
            }
            break;
          case DioErrorType.DEFAULT:
            String errorMessage = error.error.toString();
            sink.addError(errorMessage, stackTrace);
            break;
          case DioErrorType.CONNECT_TIMEOUT:
          case DioErrorType.SEND_TIMEOUT:
          case DioErrorType.RECEIVE_TIMEOUT:
          case DioErrorType.CANCEL:
            String errorMessage = "Connection Timeout, Please check your internet connection";
            sink.addError(errorMessage, stackTrace);
            break;
        }
      }
    },
  );

  final emailValidatorTransformer = new StreamTransformer<String, String>.fromHandlers(
    handleData: (userInput, sink) {
      if (!EmailValidator.validate(userInput))
        sink.addError("Enter a Valid Email");
      else
        sink.add(userInput);
    },
  );
}
