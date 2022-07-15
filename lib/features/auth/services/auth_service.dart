import 'package:apna_store/constants/global_variables.dart';
import 'package:apna_store/models/user.dart';
import 'package:http/http.dart' as http;

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
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: {'Content-Type': 'application/json'},
      );
      print(res.statusCode);
    } catch (e) {
      print(e);
    }
  }
}
