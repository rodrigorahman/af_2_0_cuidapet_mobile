import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotification {
  Future<void> configure() async {}

  Future<String?> getDeviceToken() => FirebaseMessaging.instance.getToken();
}
