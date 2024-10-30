import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isFilled = false.obs;

  LoginPage() {
    usernameController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    isFilled.value = usernameController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_circle, size: 100, color: Colors.blueAccent),
              SizedBox(height: 20),
              _buildUsernameField(),
              SizedBox(height: 20),
              _buildPasswordField(),
              SizedBox(height: 30),
              _buildLoginButton(),
              SizedBox(height: 20),
              _buildRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUsernameField() {
    return TextField(
      controller: usernameController,
      decoration: InputDecoration(
        labelText: 'Username',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: Icon(Icons.person),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: Icon(Icons.lock),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Obx(() => SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isFilled.value
            ? () {
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
                  Get.snackbar(
                    'Error',
                    'Invalid username or password',
                    snackPosition: SnackPosition.TOP, // Notifikasi di bagian atas
                  );
                }
              }
            : null,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          foregroundColor: isFilled.value ? Colors.white : Colors.black38,
        ),
        child: Text('Login', style: TextStyle(fontSize: 18)),
      ),
    ));
  }

  Widget _buildRegisterButton() {
    return TextButton(
      onPressed: () => Get.toNamed('/register'),
      child: Text(
        'Belum punya akun? Register sekarang',
        style: TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
