import 'package:chat_app_iat/controller/chat_controller.dart';
import 'package:chat_app_iat/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'message_bubble.dart';

class MessagesStream extends StatelessWidget {
  MessagesStream({super.key});
  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('messages')
          .orderBy('dateTime', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ),
          );
        }

        final messages = snapshot.data!.docs.reversed.toList();
        List<MessageBubble> messageBubbles = [];

        final currentUser = AuthService.user?.email;

        for (var message in messages) {
          final messageText = message['text'];
          final messageSender = message['sender'];

          if (currentUser != null && messageSender != null) {
            final messageBubble = MessageBubble(
              sender: messageSender,
              text: messageText,
              isMe: currentUser == messageSender,
            );

            messageBubbles.add(messageBubble);
          }
        }

        return Expanded(
          child: Scaffold(
            backgroundColor: const Color(0XFF1B202D),
            body: ListView(
              reverse: true,
              shrinkWrap: true,
              children: messageBubbles,
            ),
          ),
        );
      },
    );
  }
}
