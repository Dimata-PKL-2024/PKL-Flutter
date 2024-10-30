import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Column(
        children: [
          _buildUsernameField(),
          _buildPasswordField(),
          _buildLoginButton(),
          _buildRegisterButton(),
        ],
      ),
    );
  }

  Widget _buildUsernameField() {
    return TextField(
      controller: usernameController,
      decoration: InputDecoration(labelText: 'Username'),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: passwordController,
      decoration: InputDecoration(labelText: 'Password'),
      obscureText: true,
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        String username = usernameController.text;
        String password = passwordController.text;

        if (username.contains('@')) {
          var parts = username.split('@');
          username = parts[0];
        }

        bool success = authController.login(username, password);
        if (success) {
          Get.toNamed('/home');
        } else {
          Get.snackbar('Error', 'Invalid username or password');
        }
      },
      child: Text('Login'),
    );
  }

  Widget _buildRegisterButton() {
    return TextButton(
      onPressed: () => Get.toNamed('/register'),
      child: Text('Register'),
    );
  }
}
