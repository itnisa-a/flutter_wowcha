import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Componemt/TabAppBar.dart';
import 'package:ku_t/Modules/ManagerPage/ManagerDashboard.dart';
import 'package:ku_t/Modules/ManagerPage/ManagerImportPage.dart';

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
      return _Page(() => const ManagerImportPage(), 1);
    } else if (state == 1) {
      return _Page(() => const MyWidget(), 0);
    } else
      return _Page(() => const MyWidget(), 0);
  }

  Scaffold _Page(Widget function(), int page) {
    return Scaffold(
      appBar: TabAppBar(),
      body: Column(
        children: [
          function(),
          FloatingActionButton(
            onPressed: (() {
              setState(() {
                state = page;
                print(state);
              });
            }),
            child: Text(state.toString()),
          )
        ],
      ),
    );
  }
}
