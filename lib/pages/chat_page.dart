import 'package:chat_app_iat/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'message_input.dart';
import 'messages_stream.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              authController.logout();
            },
          ),
        ],
        title: Text(
          'ATHA CHAT',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0XFF1B202D),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessagesStream(),
            MessageInput(),
          ],
        ),
      ),
    );
  }
}
