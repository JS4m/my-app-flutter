import 'package:app_delivery/src/data/models/user.dart';

class AuthenticationProvider {
  //en este caso se cambiaria a una api rest
  Future<User> login(String email, String password) async {
    //await Future.delayed(Duration(seconds: 3));
    if (email == "test@test.com" && password == "test") {
      return User(
        id: "123456",
        email: "test@test.com",
        name: "test",
        lastname: "vilcherrez",
        birthday: DateTime(1999, 12, 28),
      );
    }
    return null;
  }

  //Aqui se consume un servicio de un api restore
  //actualizar una base de datos local
  Future<bool> register(User user) async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }

  Future<bool> sendResetToken(String email) async {
    //print("emal jajajajaa $email");
    await Future.delayed(Duration(seconds: 3));
    return true;
  }
}
