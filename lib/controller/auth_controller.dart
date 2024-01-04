import 'package:chat_app_iat/pages/chat_page.dart';
import 'package:chat_app_iat/pages/login_page.dart';
import 'package:chat_app_iat/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  void register() async {
    try {
      await AuthService.register(
        emailController.value.text,
        passwordController.value.text,
      );

      if (AuthService.user != null) {
        Get.snackbar(
          'SUCCES',
          'Yeay, kamu sudah berhasil membuat akun !!!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.white,
        );
        await Future.delayed(const Duration(seconds: 5));
        Get.offAll(() => ChatPage());
      } else {
        Get.snackbar(
          'EROR',
          'Gagal Register. Silakan Coba lagi untuk membuat akun dengan benar.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Gagal Register ',
        'Gagal Register . Silakan coba lagi atau hubungi dukungan.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void login() async {
    try {
      await AuthService.login(
          emailController.value.text, passwordController.value.text);

      if (AuthService.user != null) {
        Get.snackbar(
          'SUCCES',
          'Yeay, kamu sudah berhasil login !!!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.white,
        );
        await Future.delayed(const Duration(seconds: 2));
        Get.offAll(() => ChatPage());
      } else {
        Get.snackbar(
          'EROR',
          'Gagal Login. Silakan masukkkan email dan password yang sudah terdaftar !!!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (err) {
      print(err);
      Get.snackbar(
        'Gagal Login',
        'Gagal Login. Silakan coba lagi atau hubungi dukungan.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void logout() async {
    await AuthService.logout();
    Get.to(LoginPage());
  }
}
