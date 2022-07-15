import 'package:apna_store/constants/error_handling..dart';
import 'package:apna_store/constants/global_variables.dart';
import 'package:apna_store/constants/utils.dart';
import 'package:apna_store/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthService {
  //Sign up
  void signupUser({
    required BuildContext context,
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
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Account has been created successfully');
          });
    } catch (e) {
      showSnackBar(context, 'Something went wrong');
    }
  }
}
