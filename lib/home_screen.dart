import 'dart:convert';
import 'dart:developer';

import 'package:firebase_remote_config_app/services/notification_handler.dart';
import 'package:firebase_remote_config_app/services/remote_config_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationHandler().requistPermisssion();
    NotificationHandler().getFirebaseToken();
    NotificationHandler().handleNotification();
    // getData();
  }

  Future<String> getData() async {
    final firebaseRemoteConfigService = FireaseRemoteConfigService();
    await firebaseRemoteConfigService.init();

    final remoteData = firebaseRemoteConfigService.welcome;

    final decodedData = jsonDecode(remoteData);

    log(decodedData['message']);

    final appVersion = firebaseRemoteConfigService.appVersion;
    final decodeedAppVersion = jsonDecode(appVersion);
    log(decodeedAppVersion['app_version']);

    return remoteData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Push Notification'),
      )
    );
  }
}
