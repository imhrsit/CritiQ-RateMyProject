import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

void showSnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

void httpErrorHandle({
  required BuildContext context,
  required http.Response response,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200: 
      onSuccess();
      break;
    case 400:
      showSnackbar(context, jsonDecode(response.body)['message']);
      break;
    case 500:
      showSnackbar(context, jsonDecode(response.body)['error']);
      break;
    default:
    showSnackbar(context, response.body);
  }
}