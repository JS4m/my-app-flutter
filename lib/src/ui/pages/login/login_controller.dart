import 'package:app_delivery/src/data/models/user.dart';
import 'package:app_delivery/src/data/repositories/authentication_repository.dart';
import 'package:app_delivery/src/helpers/get.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  String _email = '', _password = '';
  //llamo a los archivos que estan en helpers
  final AuthenticationRepository _repository =
      Get.i.find<AuthenticationRepository>();

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<User> submit() async {
    return _repository.login(_email, _password);
  }
}
