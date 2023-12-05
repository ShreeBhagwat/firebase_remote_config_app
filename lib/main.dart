import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config_app/firebase_options.dart';
import 'package:firebase_remote_config_app/home_screen.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(RemoteConfig());
}


class RemoteConfig extends StatelessWidget {
  const RemoteConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
