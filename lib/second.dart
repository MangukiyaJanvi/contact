import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Modal.dart';
import 'list.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {

  String path = ""; // for_imagepicker
  TextEditingController txtfname = TextEditingController();
  TextEditingController txtlname = TextEditingController();
  TextEditingController txtcall = TextEditingController();
  TextEditingController txtemail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.cancel_rounded)),
          title: Text("Edit Contact"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Modal m1 = Modal(
                      fname: txtfname.text,
                      lname: txtlname.text,
                      call: txtcall.text,
                      email: txtemail.text,
                      path: path);
                  l1.add(m1);
                  Navigator.pop(context);
                },
                child: Icon(Icons.done),
              ),
            ),
          ],
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () async {
                    ImagePicker imagePicker = ImagePicker();
                    XFile? xfile = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    setState(() {
                      path = xfile!.path;
                    });
                  },
                  child: (path.isEmpty)
                      ? CircleAvatar(
                          maxRadius: 100,
                          backgroundImage:
                              AssetImage("assets/images/profile.png"),
                        )
                      : CircleAvatar(
                          maxRadius: 100,
                          backgroundImage: FileImage(
                            File(path),
                          ),
                        ),
                ),
              ),
              Text("First Name"),
              TextFormField(
                controller: txtfname,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Text("Last Name"),
              TextFormField(
                controller: txtlname,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Text("Contact Number"),
              TextFormField(
                controller: txtcall,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Text("Gmail"),
              TextFormField(
                controller: txtemail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
