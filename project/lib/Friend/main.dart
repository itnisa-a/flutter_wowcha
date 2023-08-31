import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ku_t/model/Home/Home_Manager.dart';
import 'package:ku_t/modules/component/Header_web.dart';
import 'package:ku_t/screens/dashboard_screen.dart';
import 'package:sidebarx/sidebarx.dart';

import 'modules/component/sidebar.dart';
import 'modules/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAce3unDUcQ6AJZu3PtGIZFk-UNCIT5Ojw", 
      appId: "1:1054979711267:web:c0d9aa3ebe2e72043cec96", 
      messagingSenderId: "1054979711267", 
      projectId: "setable-e4c54")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        canvasColor: const Color.fromRGBO(0, 102, 94, 1),
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: router(controller: SidebarXController(selectedIndex: 0, extended: true)),
    );
  }
}