import 'package:flutter/material.dart';
import 'package:montyhacks2022/screens/Homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/login/loginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool islogin = false;
  bool islogin1 = false;
  final prefs = await SharedPreferences.getInstance();
  islogin = prefs.getBool('deleteAll') ?? false;
  islogin1 = prefs.getBool('EkdeleteAll') ?? false;

  await Firebase.initializeApp(
    options: const FirebaseOptions(
    apiKey: "AIzaSyAVIGw9dakIgtkXsR96ZCmdgu9lKK1vA68",
    appId: "1:369278270263:web:eecc70240f50ef256f78b2",
    messagingSenderId: "369278270263",
    projectId: "montyhacks2022",
  ));
  runApp(MaterialApp(
    home: islogin
        ? const MyApp()
        : islogin1
            ? const MyApp()
            : login(),
  ));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hackiton',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
