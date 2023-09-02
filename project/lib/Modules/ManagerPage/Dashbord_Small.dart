import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ku_t/Friend/Dropdown/BasicsubjectModel.dart';
import 'package:ku_t/Friend/Dropdown/CraditModel.dart';
import 'package:ku_t/Friend/Dropdown/TeachernameModel.dart';
import 'package:ku_t/modules/router/router.dart';
import 'package:sidebarx/sidebarx.dart';

class DashbordSmall extends StatefulWidget {
  const DashbordSmall({super.key});

  @override
  State<DashbordSmall> createState() => _DashbordSmallState();
}

class _DashbordSmallState extends State<DashbordSmall> {
  CollectionReference addsubject =
      FirebaseFirestore.instance.collection('subject');
  final _key = GlobalKey<FormState>();
  late TextEditingController controller;

  TextEditingController coursecodeC = TextEditingController();
  TextEditingController coursenameC = TextEditingController();
  String? selectedValue;
  String? creditValue;
  String? teachernameValue;
  String? basicsubjectValue;

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(),
            _selectYear(),
            const SizedBox(height: 10),
            _SearchSubject(), //ควย
            const SizedBox(height: 10),
            _ButtonSumject(),
            const SizedBox(height: 10),
            _ButtonAdd()
          ],
        )
      ],
    );
  }

  Container _title() {
    return Container(
      alignment: Alignment.bottomLeft,
      child: const Text(
        "ปีการศึกษา",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container _selectYear() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(230, 230, 230, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButton<String?>(
        hint: const Text(
          "เลือก",
        ),
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
          "2562",
          "2563",
          "2564",
          "2565",
          "2566",
          "2567",
          "2568",
          "2569",
          "2570"
        ].map<DropdownMenuItem<String?>>((e) {
          return DropdownMenuItem(
            child: Text(e.toString()),
            value: e,
          );
        }).toList(),
      ),
    );
  }

  Column _SearchSubject() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          child: const Text(
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
                    color: const Color.fromRGBO(230, 230, 230, 1),
                    borderRadius: BorderRadius.circular(15)),
                child: const TextField(
                  cursorColor: Color.fromRGBO(172, 173, 191, 1),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 14),
                    hintText: "รหัสวิชา / ชื่อรายวิชา",
                    // hintStyle: textStyle16(),
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 70,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(0, 102, 94, 1)),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'ค้นหา',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Container _ButtonSumject() {
    return Container(
      width: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        border:
            Border.all(color: const Color.fromRGBO(0, 102, 94, 1), width: 2),
        borderRadius: BorderRadius.circular(15),
        // color: Color.fromRGBO(0, 102, 94, 1)
      ),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'จัดการรายวิชา',
          style: TextStyle(
              color: Color.fromRGBO(0, 102, 94, 1),
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),
      ),
    );
  }

  Container _ButtonAdd() {
    return Container(
      width: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(0, 102, 94, 1)),
      child: TextButton(
        onPressed: () {
          openDialog();
        },
        child: const Text(
          'เพิ่มรายวิชา',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
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
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(
                children: [
                  const Text(
                    "เพิ่มรายวิชา",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: const Text(
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
                                  borderRadius: BorderRadius.circular(15)),
                              child: TextFormField(
                                controller: coursecodeC,
                                keyboardType: TextInputType.number,
                                cursorColor: Color.fromRGBO(172, 173, 191, 1),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(fontSize: 14),
                                  hintText: "รหัสวิชา",
                                  // hintStyle: textStyle16(),
                                  contentPadding: EdgeInsets.all(15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: const Text(
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
                                  borderRadius: BorderRadius.circular(15)),
                              child: DropdownButtonFormField(
                                  hint: const Text(
                                    "เลือก",
                                    style: TextStyle(
                                      // color: Color.fromRGBO(172, 173, 191, 1),
                                      fontSize: 14,
                                    ),
                                  ),
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
                                          value: e.title,
                                          child: Text(e.title!)))
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
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
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
                        borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      controller: coursenameC,
                      keyboardType: TextInputType.number,
                      cursorColor: Color.fromRGBO(172, 173, 191, 1),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 14),
                        hintText: "ชื่อรายวิชา",
                        // hintStyle: textStyle16(),
                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: const Text(
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
                            borderRadius: BorderRadius.circular(15)),
                        child: DropdownButtonFormField(
                            hint: const Text(
                              "อาจารย์ผู้สอน",
                              style: TextStyle(
                                // color: Color.fromRGBO(172, 173, 191, 1),
                                fontSize: 14,
                              ),
                            ),
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
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: const Text(
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
                            borderRadius: BorderRadius.circular(15)),
                        child: DropdownButtonFormField(
                            hint: const Text(
                              "วิชาพื้นฐาน",
                              style: TextStyle(
                                // color: Color.fromRGBO(172, 173, 191, 1),
                                fontSize: 14,
                              ),
                            ),
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
                            items: basicsubject //แก้
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
                            child: const Text(
                              "ตกลง",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: Color.fromRGBO(255, 93, 93, 1),
                                width: 2),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "ยกเลิก",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(255, 93, 93, 1),
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ));
}
