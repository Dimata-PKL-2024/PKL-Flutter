import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class RegisterPage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isFilled = false.obs;

  RegisterPage() {
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_add, size: 100, color: Colors.blueAccent),
              SizedBox(height: 20),
              _buildUsernameField(),
              SizedBox(height: 20),
              _buildPasswordField(),
              SizedBox(height: 30),
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

  Widget _buildRegisterButton() {
    return Obx(() => SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isFilled.value
            ? () async {
                String username = usernameController.text.trim();
                String password = passwordController.text.trim();

                if (username.isEmpty || password.isEmpty) {
                  Get.snackbar('Error', 'Mohon isi semua kolom', snackPosition: SnackPosition.TOP);
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
                    Get.snackbar('Sukses', 'Registrasi berhasil', snackPosition: SnackPosition.TOP);
                    Get.offNamed('/login');
                  } else {
                    Get.snackbar('Error', 'Username sudah digunakan', snackPosition: SnackPosition.TOP);
                  }
                } catch (e) {
                  Get.back();
                  Get.snackbar('Error', 'Terjadi kesalahan yang tidak terduga', snackPosition: SnackPosition.TOP);
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
        child: Text('Daftar', style: TextStyle(fontSize: 18)),
      ),
    ));
  }
}
