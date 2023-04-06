import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:push_fire_notifications/pushnotification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (ex) {}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PushFireNotifications(
      fcmTokenGet: (String token) {
        print("TOKEN:$token");
      },
      onNotification: (String payload) {
        print("1 $payload");
      },
      onTapAppTerminatedNotification: (String payload) {
        print("3$payload");
      },
      onTapNotification: (String payload) {
        print("2$payload");
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter firebse message',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Message"),
          ),
          body: Container(),
        ),
      ),
    );
  }
}
