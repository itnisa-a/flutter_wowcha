import 'package:flutter/material.dart';
import 'package:ku_t/modules/router/router.dart';
import 'package:sidebarx/sidebarx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return router(
        controller: SidebarXController(selectedIndex: 0, extended: true));
  }
}
