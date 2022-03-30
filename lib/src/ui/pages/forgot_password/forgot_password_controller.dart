import 'package:app_delivery/src/data/repositories/authentication_repository.dart';
import 'package:app_delivery/src/helpers/get.dart';
import 'package:flutter/widgets.dart';

class ForgotPasswordController extends ChangeNotifier {
  String _email = '';
  String get email => _email;
  //final AuthenticationRepository _repository =
  //new AuthenticationRepository();Get.i.find<AuthenticationRepository>();
  final AuthenticationRepository _repository =
      Get.i.find<AuthenticationRepository>();
  void onEmailChanged(String text) {
    _email = text;
  }

  Future<bool> submit() {
    return _repository.sendResetToken(_email);
  }
}
