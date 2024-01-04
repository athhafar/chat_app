import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/chat_controller.dart';

class MessageInput extends StatelessWidget {
  MessageInput({super.key});

  final TextEditingController messageController = TextEditingController();
  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        color: Color(0XFF3D4354),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              onChanged: (value) {
                chatController.messageTextController.value = value;
              },
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                hintText: 'Type a message',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: const Color(
                    0XFFFFFFFF,
                  ).withOpacity(0.45),
                ),
              ),
            ),
          ),
          Obx(
            () => IconButton(
              onPressed: chatController.messageTextController.value.isNotEmpty
                  ? () {
                      chatController.addChat();
                      messageController.clear();
                      chatController.messageTextController.value = '';
                    }
                  : () {},
              icon: Icon(
                Icons.send,
                color: chatController.messageTextController.value.isNotEmpty
                    ? const Color(0XFF9398A7)
                    : Colors.white.withOpacity(0.1),
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
