import 'package:exam27/modal.dart';
import 'package:exam27/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Add your Contact",style: TextStyle(color: Colors.black),),centerTitle: true,backgroundColor: Colors.white),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: txtname,decoration: InputDecoration(hintText: "Enter the Name",enabledBorder: OutlineInputBorder(),focusedBorder: OutlineInputBorder()),),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: txtcont,decoration: InputDecoration(hintText: "Enter the Contact number",enabledBorder: OutlineInputBorder(),focusedBorder: OutlineInputBorder()),),
            ),
            ElevatedButton(onPressed: () {
              Modal m1 = Modal(name: txtname.text,cont: txtcont.text);
              Navigator.pushNamed(context, 'one');
              setState(() {
                l1.add(m1);
              });
              txtname.clear();
              txtcont.clear();
            }, child: Text("ADD"))
          ],
        ),
      ),
    );
  }
}
