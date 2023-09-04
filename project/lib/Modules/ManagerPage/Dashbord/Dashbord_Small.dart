import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ku_t/Modules/ManagerPage/Dashbord/PopUp.dart';

class DashbordSmall extends StatefulWidget {
  const DashbordSmall({super.key});

  @override
  State<DashbordSmall> createState() => _DashbordSmallState();
}

class _DashbordSmallState extends State<DashbordSmall> {
  CollectionReference addsubject =
      FirebaseFirestore.instance.collection('subject');
  late TextEditingController controller;
  String? selectedValue; //N

  TextEditingController coursecodeC = TextEditingController(); //y
  TextEditingController coursenameC = TextEditingController();

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
            _ButtonSubject(),
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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(230, 230, 230, 1),
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
        underline: const SizedBox(),
        isExpanded: true,
        style: const TextStyle(fontSize: 14),
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
            value: e,
            child: Text(e.toString()),
          );
        }).toList(),
      ),
    );
  }

  // ignore: non_constant_identifier_names
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
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(0, 102, 94, 1)),
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

  // ignore: non_constant_identifier_names
  Container _ButtonSubject() {
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

  // ignore: non_constant_identifier_names
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
      builder: (context) => const Dialog(child: PopupManagerView()));
}