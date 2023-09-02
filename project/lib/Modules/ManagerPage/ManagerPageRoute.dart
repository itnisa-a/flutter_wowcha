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
  int state = 0;
  @override
  Widget build(BuildContext context) {
    if (state == 0) {
      return _PageImport(() => const ManagerImportPage());
    } else if (state == 1) {
      return _Page(() => const MyWidget());
    } else if (state == 2) {
      return _Page(() => const Test());
    } else
      return _Page(() => const MyWidget());
  }

  Scaffold _Page(Widget function()) {
    return Scaffold(
      appBar: TabAppBar(),
      body: Column(
        children: [
          Row(
            children: [
              FloatingActionButton(
                onPressed: (() {
                  setState(() {
                    state = 0;
                    print(state);
                  });
                }),
                child: Text("Importing"),
              ),
              FloatingActionButton(
                onPressed: (() {
                  setState(() {
                    state = 2;
                    print(state);
                  });
                }),
                child: Text("Test"),
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
                state = 1;
                print(state);
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
