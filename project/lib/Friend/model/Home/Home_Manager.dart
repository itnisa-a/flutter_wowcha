
import 'package:flutter/material.dart';
import 'package:ku_t/modules/component/Header_web.dart';
import 'package:ku_t/screens/dashboard_screen.dart';
import 'package:ku_t/screens/import_course.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../modules/component/sidebar.dart';

class Home_Manager extends StatefulWidget{
  const Home_Manager({super.key});
  @override
  _Home_ManagerState createState() => _Home_ManagerState();
}

class _Home_ManagerState extends State<Home_Manager>{
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Builder(
        builder: (context){
          final isSmallScreen = MediaQuery.of(context).size.width < 500;
          return Scaffold(
                body: Row(
              children: [
                if(!isSmallScreen) SideBarXExample(controller: _controller),
                Expanded(
                  child: Center(
                    child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context,child){
                      switch(_controller.selectedIndex){
                        case 0: _key.currentState?.closeDrawer();
                        return const ManagementPage();

                        //------------------------on test---------------------------------
                        
                        //return ImportPage();

                        //----------------------------------------------------------------
                        case 1: _key.currentState?.closeDrawer();
                        return const ImportPage();
                        case 2: _key.currentState?.closeDrawer();
                        return Center(
                          child: Text('Settings',style: TextStyle(color: Colors.white,fontSize: 40),),
                        );
                        case 3: _key.currentState?.closeDrawer();
                        return Center(
                          child: Text('Theme',style: TextStyle(color: Colors.white,fontSize: 40),),
                        );
                        default:
                          return const Center(
                    child: Text('Home',style: TextStyle(color: Colors.white,fontSize: 40),),
                          );
                      }
                    },
                  ),))
              ],
            ),
    );
        },
      ),
    );
    
  }
}