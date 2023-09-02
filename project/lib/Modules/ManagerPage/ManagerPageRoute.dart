// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Componemt/TabAppBar.dart';
import 'package:ku_t/Modules/ManagerPage/ManagerDashboard.dart';
import 'package:ku_t/Modules/ManagerPage/ManagerImportPage.dart';
import 'package:ku_t/Modules/ManagerPage/Test.dart';

class ManagerPageRoute extends StatefulWidget {
  const ManagerPageRoute({super.key});

  @override
  State<ManagerPageRoute> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ManagerPageRoute> {
  int Path = 0;
  @override
  Widget build(BuildContext context) {
    if (Path == 0) {
      return _PageImport(() => const ManagerImportPage());
    } else if (Path == 1) {
      return _Page(() => const MyWidget());
    } else if (Path == 2) {
      return _Page(() => const Test());
    } else
      return _Page(() => const MyWidget());
  }

  Scaffold _Page(Widget Function() function) {
    return Scaffold(
      appBar: TabAppBar(),
      body: Column(
        children: [
          Row(
            children: [
              FloatingActionButton(
                onPressed: (() {
                  setState(() {
                    Path = 0;
                  });
                }),
                child: const Text("Importing"),
              ),
              FloatingActionButton(
                onPressed: (() {
                  setState(() {
                    Path = 2;
                    print(Path);
                  });
                }),
                child: const Text("Test"),
              ),
            ],
          ),
          function(),
        ],
      ),
    );
  }

  Scaffold _PageImport(Widget function()) {
    return Scaffold(
      appBar: TabAppBar(),
      body: Column(
        children: [
          FloatingActionButton(
            onPressed: (() {
              setState(() {
                Path = 1;
                print(Path);
              });
            }),
            child: Text("Dashboard"),
          ),
          function(),
        ],
      ),
    );
  }
}
