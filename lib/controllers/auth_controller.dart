import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var users = [].obs;

  Future<void> loadUsers() async {
    final String response = await rootBundle.loadString('assets/users.json');
    users.value = json.decode(response);
  }

  bool login(String username, String password) {
    return users.any(
        (user) => user['username'] == username && user['password'] == password);
  }

  bool register(String username, String password) {
    if (users.any((user) => user['username'] == username)) {
      return false;
    }

    users.add({'username': username, 'password': password});
    return true;
  }
}
