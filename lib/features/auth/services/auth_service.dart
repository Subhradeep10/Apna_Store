import 'package:apna_store/models/user.dart';

class AuthService {
  //Sign up
  void signupUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );
    } catch (e) {
      print(e);
    }
  }
}
