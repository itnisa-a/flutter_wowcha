import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ku_t/Dropdown/BasicsubjectModel.dart';
import 'package:ku_t/Dropdown/CraditModel.dart';
import 'package:ku_t/modules/component/Header_web.dart';
import 'package:ku_t/screens/import_course.dart';
import 'package:sidebarx/sidebarx.dart';


import '../Dropdown/TeachernameModel.dart';
import '../modules/router/router.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({Key? key}) : super(key: key);
  
  @override
  State<ManagementPage> createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {

  CollectionReference addsubject = FirebaseFirestore.instance.collection('subject');
  final _key = GlobalKey<FormState>();
  String? selectedValue;
  String? creditValue;
  String? teachernameValue;
  String? basicsubjectValue;
  late TextEditingController controller;

  TextEditingController coursecodeC = TextEditingController();
  TextEditingController coursenameC = TextEditingController();

  void adddata() async {
    await addsubject.add({
      "coursecode": coursecodeC.text.trim(),
      "credit": creditValue.toString(),
      "coursename": coursenameC.text.trim(),
      "teachername": teachernameValue.toString(),
      "basicsubject": basicsubjectValue.toString()
    }).whenComplete(() => Navigator.pop(context));
  }
  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: NavBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Form(
          key: _key,
          child: Column(
            children: [
              _header(),
              Divider(height: 30),
              
              Container(
                child: orientation == Orientation.portrait
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "ปีการศึกษา",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(230, 230, 230, 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton<String?>(
                            hint: Text("เลือก",),
                            dropdownColor: Colors.white,
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                            underline: SizedBox(),
                            isExpanded: true,
                            style: TextStyle(fontSize: 14),
                            items: [
                              "2562", "2563", "2564", "2565", "2566", "2567", "2568", "2569", "2570"
                            ].map<DropdownMenuItem<String?>>((e) {
                              return DropdownMenuItem(
                                child: Text(e.toString()),
                                value: e,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "ค้นหารายวิชา",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                              width: MediaQuery.of(context).size.height,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(230, 230, 230, 1),
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                      child: TextField(
                                        cursorColor: Color.fromRGBO(172, 173, 191, 1),
                                        decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                  fontSize: 14
                                                ),
                                                hintText: "รหัสวิชา / ชื่อรายวิชา",
                                                // hintStyle: textStyle16(),
                                                contentPadding: const EdgeInsets.all(15),
                                        ),
                                      ),
                                    ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                    width: 70,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(0, 102, 94, 1)),
                    child: TextButton(
                      
                      onPressed: () {  },
                      child: Text('ค้นหา',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14
                      ),),
                    ),
                    )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal:10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(0, 102, 94, 1),
                          width: 2
                        ),
                        borderRadius: BorderRadius.circular(15),
                        // color: Color.fromRGBO(0, 102, 94, 1)
                        ),
                      child: TextButton(
                        
                        onPressed: () {  },
                        child: Text('จัดการรายวิชา',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 102, 94, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                        ),),
                      ),
                      ),
                      SizedBox(height: 10),
                      Container(
                      width: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(0, 102, 94, 1)),
                      child: TextButton(
                        
                        onPressed: () {
                          openDialog();
                        },
                        child: Text('เพิ่มรายวิชา',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                        ),),
                      ),
                      ),
                      SizedBox(height: 10),
                      Container(
                      width: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(47, 51, 55, 1)),
                      child: TextButton(
                        
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => router(controller: SidebarXController(selectedIndex: 1, extended: true)),
                            ),
                          );
                        },
                        child: Text('นำเข้าหลักสูตร',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                        ),),
                      ),
                      )
                  ],
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "ปีการศึกษา",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(230, 230, 230, 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton<String?>(
                            hint: Text("เลือก",),
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                            underline: SizedBox(),
                            isExpanded: true,
                            style: TextStyle(fontSize: 14),
                            items: [
                              "2562", "2563", "2564", "2565", "2566", "2567", "2568", "2569", "2570"
                            ].map<DropdownMenuItem<String?>>((e) {
                              return DropdownMenuItem(
                                child: Text(e.toString()),
                                value: e,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "ค้นหารายวิชา",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                width: MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                    color: Color.fromRGBO(230, 230, 230, 1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                        child: TextField(
                                          cursorColor: Color.fromRGBO(172, 173, 191, 1),
                                          decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  
                                                  hintText: "รหัสวิชา / ชื่อรายวิชา",
                                                  hintStyle: TextStyle(
                                                    fontSize: 14
                                                  ),
                                                  contentPadding: const EdgeInsets.all(15),
                                          ),
                                        ),
                                      ),
                              ),
                                    SizedBox(width: 10,),
                              Container(
                                                  width: 100,
                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(15),
                                                    color: Color.fromRGBO(0, 102, 94, 1)),
                                                  child: TextButton(
                                                    
                                                    onPressed: () {  },
                                                    child: Text('ค้นหา',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 14
                                                    ),),
                                                  ),
                                                  ),
                      Expanded(child: SizedBox(width: 200)),
                              Expanded(
                                    child: Container(
                                      width: MediaQuery.of(context).size.height,
                                                        // alignment: Alignment.topRight,
                                                        padding: EdgeInsets.symmetric(vertical: 8, horizontal:10),
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: Color.fromRGBO(0, 102, 94, 1),
                                                            width: 2
                                                          ),
                                                          borderRadius: BorderRadius.circular(15),
                                                          // color: Color.fromRGBO(0, 102, 94, 1)
                                                          ),
                                                        child: TextButton(
                                                          
                                                          onPressed: () {  },
                                                          child: Text('จัดการรายวิชา',
                                                          style: TextStyle(
                                                            overflow: TextOverflow.ellipsis,
                                                            color: Color.fromRGBO(0, 102, 94, 1),
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 14
                                                          ),),
                                                        ),
                                                        ),
                                  ),
                                  SizedBox(width: 10),
                      Expanded(
                        child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal:10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(0, 102, 94, 1)),
                        child: TextButton(
                          
                          onPressed: () {
                            openDialog();
                          },
                          child: Text('เพิ่มรายวิชา',
                          style: TextStyle(
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                          ),),
                        ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal:10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(47, 51, 55, 1)),
                        child: TextButton(
                          
                          onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => router(controller: SidebarXController(selectedIndex: 1, extended: true)),
                            ),
                          );
                          },
                          child: Text('นำเข้าหลักสูตร',
                          style: TextStyle(
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                          ),),
                        ),
                        ),
                      )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ),
              
            ],
          ),
        ),
      ),
    );
  }
  Future openDialog() => showDialog(
    context: context, 
    builder: (context) => Dialog(
      
      child: Container(
        height: 500,
        width: 500,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal:30),
        child: Column(
          children: [
            Text("เพิ่มรายวิชา",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "รหัสวิชา",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                      Container(
                                              width: MediaQuery.of(context).size.height,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromRGBO(230, 230, 230, 1),
                                                    borderRadius: BorderRadius.circular(15)
                                                  ),
                                                      child: TextFormField(
                                                        controller: coursecodeC,
                                                        keyboardType: TextInputType.number,
                                                        cursorColor: Color.fromRGBO(172, 173, 191, 1),
                                                        decoration: InputDecoration(
                                                                border: InputBorder.none,
                                                                hintStyle: TextStyle(
                                                                  fontSize: 14
                                                                ),
                                                                hintText: "รหัสวิชา",
                                                                // hintStyle: textStyle16(),
                                                                contentPadding: const EdgeInsets.all(15),
                                                        ),
                                                      ),
                                                    ),
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "หน่วยกิต",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(230, 230, 230, 1),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: DropdownButtonFormField(
                                hint: const Text("เลือก",
                                style: TextStyle(
                                  // color: Color.fromRGBO(172, 173, 191, 1),
                                  fontSize: 14,
                                  ),),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(15),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return "";
                                  }
                                  return null;
                                },
                                focusColor: Colors.white,
                                dropdownColor: Colors.white,
                                isExpanded: false,
                                value: creditValue,
                                items: credit
                                    .map((e) => DropdownMenuItem<String>(
                                        value: e.title, child: Text(e.title!)))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    creditValue = value.toString();
                                  });
                                }),
                          ),
                            ],
                          ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "ชื่อรายวิชา",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                  Container(
                                          // width: MediaQuery.of(context).size.height,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(230, 230, 230, 1),
                                                borderRadius: BorderRadius.circular(15)
                                              ),
                                                  child: TextFormField(
                                                    controller: coursenameC,
                                                    keyboardType: TextInputType.number,
                                                    cursorColor: Color.fromRGBO(172, 173, 191, 1),
                                                    decoration: InputDecoration(
                                                            border: InputBorder.none,
                                                            hintStyle: TextStyle(
                                                              fontSize: 14
                                                            ),
                                                            hintText: "ชื่อรายวิชา",
                                                            // hintStyle: textStyle16(),
                                                            contentPadding: const EdgeInsets.all(15),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10,),
                                                Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "อาจารย์ผู้สอน",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(230, 230, 230, 1),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: DropdownButtonFormField(
                                hint: const Text("อาจารย์ผู้สอน",
                                style: TextStyle(
                                  // color: Color.fromRGBO(172, 173, 191, 1),
                                  fontSize: 14,
                                  ),),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(15),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return "";
                                  }
                                  return null;
                                },
                                focusColor: Colors.white,
                                dropdownColor: Colors.white,
                                isExpanded: false,
                                value: teachernameValue,
                                items: teachername
                                    .map((e) => DropdownMenuItem<String>(
                                        value: e.title, child: Text(e.title!)))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    teachernameValue = value.toString();
                                  });
                                }),
                          ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "วิชาพื้นฐาน",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(230, 230, 230, 1),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: DropdownButtonFormField(
                                hint: const Text("วิชาพื้นฐาน",
                                style: TextStyle(
                                  // color: Color.fromRGBO(172, 173, 191, 1),
                                  fontSize: 14,
                                  ),),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(15),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return "";
                                  }
                                  return null;
                                },
                                focusColor: Colors.white,
                                dropdownColor: Colors.white,
                                isExpanded: false,
                                value: basicsubjectValue,
                                items: basicsubject
                                    .map((e) => DropdownMenuItem<String>(
                                        value: e.title, child: Text(e.title!)))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    basicsubjectValue = value.toString();
                                  });
                                }),
                          ),
                            ],
                          ),
                          SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(0, 102, 94, 1)),
                    child: TextButton(
                      onPressed: () {
                        adddata();
                            }, 
                    child: Text("ตกลง",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14
                    ),),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                      color: Color.fromRGBO(255, 93, 93, 1),
                      width: 2
                    ),
                      ),
                    child: TextButton(onPressed: () {
                      Navigator.pop(context);
                      }, 
                    child: Text("ยกเลิก",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 93, 93, 1),
                      fontSize: 14
                    ),),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
    Container _header(){
      return Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "การจัดการข้อมูลหลักสูตร",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            );
    }
}