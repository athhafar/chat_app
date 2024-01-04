import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {required this.sender,
      required this.text,
      required this.isMe,
      super.key});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: <Widget>[
          Text(
            sender,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Material(
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
            elevation: 5.0,
            color: isMe ? const Color(0XFF7A8194) : const Color(0XFF373E4E),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
