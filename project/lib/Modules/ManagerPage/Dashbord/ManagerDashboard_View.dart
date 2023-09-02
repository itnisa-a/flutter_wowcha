import 'package:flutter/material.dart';
import 'package:ku_t/Modules/ManagerPage/Dashbord/Dashbord_Small.dart';

class ManagerDashboard_View extends StatefulWidget {
  const ManagerDashboard_View({super.key});

  @override
  State<ManagerDashboard_View> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ManagerDashboard_View> {
  @override
  Widget build(BuildContext context) {
    return const DashbordSmall();
  }
}
