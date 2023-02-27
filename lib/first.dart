import 'package:exam27/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import 'modal.dart';
makingPhoneCall() async {
  var url = Uri.parse("tel:9776765434");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
void sending_SMS(String msg, List<String> list_receipents) async {
  String send_result = await sendSMS(message: msg, recipients: list_receipents)
      .catchError((err) {
    print(err);
  });
  print(send_result);
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController txtuname = TextEditingController();
  TextEditingController txtucont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(onTap: () {
            setState(() {
              Navigator.pop(context);
            });
          }, child: Icon(Icons.arrow_back, color: Colors.grey.shade700,)),
          actions: [Icon(Icons.more_vert, color: Colors.grey.shade700,),],
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: double.infinity,
                color: Colors.grey.shade100,
                child: Column(
                  children: [
                    Text("MY CONTACT"),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Container(
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [Text("\t\t\tsearch your contact")],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: l1.length, itemBuilder: (context, index) {
                return Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(9),),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(child: InkWell(onTap: () async {
                        final ImagePicker photo = ImagePicker();
                        final XFile? image = await photo.pickImage(
                            source: ImageSource.camera);
                      }, child: Icon(Icons.add))),
                      Text("${l1[index].name}\n${l1[index].cont}"),
                      IconButton(onPressed: () {
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            actions: [
                              ElevatedButton(onPressed: () {
                                setState(() {
                                  l1[index].name = txtuname.text;
                                  l1[index].cont = txtucont.text;
                                });
                                Navigator.pop(context);
                              }, child: Text("Edit"))
                            ],
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(controller: txtuname,decoration: InputDecoration(hintText: "Enter the new name"),),
                                TextField(controller: txtucont,decoration: InputDecoration(hintText: "Enter the new contact"),),
                              ],
                            ),
                          );
                        },);
                      }, icon: Icon(Icons.edit)),
                      IconButton(onPressed: () {
                        setState(() {
                          l1.removeAt(index);
                        });
                      }, icon: Icon(Icons.delete)),
                      IconButton(onPressed: () {
                        String message = "This is a test message!";
                        List<String> recipents = ["1234567890", "5556787676"];
                        sending_SMS(message, recipents);
                      }, icon: Icon(Icons.sms)),
                      IconButton(onPressed: () {
                        makingPhoneCall();
                      }, icon: Icon(Icons.call)),
                      SizedBox(height: 10),
                    ],
                  ),
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}
