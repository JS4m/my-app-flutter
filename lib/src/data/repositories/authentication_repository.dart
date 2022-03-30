import 'package:app_delivery/src/data/models/user.dart';

//Aqui solo va la estructura , la funcion , que datos recibe
//que datos retorna - para crear interfaces , se crean clases abstractas

abstract class AuthenticationRepository {
  Future<User> login(String email, String password);
  Future<bool> register(User user);
  Future<bool> sendResetToken(String email);
}
