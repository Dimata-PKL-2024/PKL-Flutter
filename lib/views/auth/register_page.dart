import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class RegisterPage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildUsernameField(),
            _buildPasswordField(),
            SizedBox(height: 20),
            _buildRegisterButton(),
          ],
        ),
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

  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: () async {
        String username = usernameController.text.trim();
        String password = passwordController.text.trim();

        if (username.isEmpty || password.isEmpty) {
          Get.snackbar('Error', 'Mohon isi semua kolom');
          return;
        }

        Get.dialog(
          Center(child: CircularProgressIndicator()),
          barrierDismissible: false,
        );

        try {
          bool success = await authController.register(username, password);
          Get.back();

          if (success) {
            Get.snackbar('Sukses', 'Registrasi berhasil');
            Get.offNamed('/login');
          } else {
            Get.snackbar('Error', 'Username sudah digunakan');
          }
        } catch (e) {
          Get.back();
          Get.snackbar('Error', 'Terjadi kesalahan yang tidak terduga');
        }
      },
      child: Text('Daftar'),
    );
  }
}
