import 'package:apna_store/constants/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, 'Bad Request');
      break;
    case 500:
      showSnackBar(context, 'Internal Server Error');
      break;
    default:
      showSnackBar(context, 'Something went wrong');
      break;
  }
}
