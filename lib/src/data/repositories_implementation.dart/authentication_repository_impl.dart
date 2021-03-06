import 'package:app_delivery/src/data/models/user.dart';
import 'package:app_delivery/src/data/repositories/authentication_repository.dart';

import '../providers/remote/authentication_provider.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationProvider _authenticationProvider;
  AuthenticationRepositoryImpl(this._authenticationProvider);

  @override
  Future<User> login(String email, String password) {
    return _authenticationProvider.login(email, password);
  }

  @override
  Future<bool> register(User user) {
    return _authenticationProvider.register(user);
  }

  @override
  Future<bool> sendResetToken(String email) {
    return _authenticationProvider.sendResetToken(email);
  }
}
