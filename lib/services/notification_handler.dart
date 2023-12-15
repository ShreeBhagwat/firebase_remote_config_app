import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationHandler {
  void requistPermisssion() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('User granted provisional permission');
    } else {
      log('User declined or has not accepted permission');
    }
  }

  Future getFirebaseToken() async {
    await FirebaseMessaging.instance.getToken().then((value) async {
      if (value != null) {
        log('Token from Firebase: $value');
      }
      
    });
  }

  void handleNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');
      log('Message data: ${message.data}');

      if (message.notification != null) {
        log('Message also contained a notification: ${message.notification}');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('A new onMessageOpenedApp event was published!');
      log('Message data: ${message.data}');

      if (message.notification != null) {
        log('Message also contained a notification: ${message.notification}');
      }
    });
  }
}
