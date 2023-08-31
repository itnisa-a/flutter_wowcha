import 'package:flutter/material.dart';
import 'package:ku_t/Modules/ManagerPage/Test1.dart';

class ManagerPage extends StatefulWidget {
  const ManagerPage({super.key});

  @override
  State<ManagerPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ManagerPage> {
  bool state = true;
  @override
  Widget build(BuildContext context) {
    if (state == true) {
      return Center(
          child: Container(
        child: Row(
          children: [
            Text("หน้า 1"),
            FloatingActionButton(
              onPressed: (() {
                setState(() {
                  state = false;
                });
              }),
              child: Text("1"),
            )
          ],
        ),
      ));
    } else {
      return Container(
        child: Row(
          children: [
            Text("หน้า 2"),
            FloatingActionButton(
              onPressed: (() {
                setState(() {
                  state = true;
                });
              }),
              child: Text("2"),
            )
          ],
        ),
      );
    }
  }
}
