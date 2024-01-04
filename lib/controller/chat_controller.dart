import 'package:chat_app_iat/services/auth_services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatController extends GetxController {
  var messageTextController = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void addChat() async {
    try {
      await FirebaseFirestore.instance.collection('messages').add({
        'text': messageTextController.value,
        'sender': AuthService.user?.email,
        'dateTime': FieldValue.serverTimestamp(),
      });
    } catch (err) {
      print(err);
    }
  }
}
