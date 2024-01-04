import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/auth_controller.dart';
import '../widgets/button_masuk.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.025),
                Center(
                  child: Text(
                    'ATHA CHAT',
                    style: GoogleFonts.montserrat(
                      color: const Color(0XFF4285F4),
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Center(
                  child: Text(
                    'BUAT AKUN',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Text(
                  'Masukkan Email',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  maxLines: 1,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.montserrat(
                        fontSize: 20, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Color(0XFF4285F4),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Color(0XFF4285F4),
                        width: 2.0,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    authController.emailController.value.text = value;
                  },
                ),
                const SizedBox(
                  height: 41.0,
                ),
                TextFormField(
                  maxLines: 1,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.montserrat(
                        fontSize: 20, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Color(0XFF4285F4),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Color(0XFF4285F4),
                        width: 2.0,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    authController.passwordController.value.text = value;
                  },
                ),
                const SizedBox(
                  height: 32.0,
                ),
                ButtonMasuk(
                  onTap: () {
                    authController.register();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
