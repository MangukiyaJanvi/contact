import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Modal.dart';
import 'list.dart';

class Four extends StatefulWidget {
  const Four({Key? key}) : super(key: key);

  @override
  State<Four> createState() => _FourState();
}

class _FourState extends State<Four> {


  @override
  Widget build(BuildContext context) {
    int data = ModalRoute.of(context)!.settings.arguments as int;
    TextEditingController txtfname2 = TextEditingController(text: "${l1[data].fname}");
    TextEditingController txtlname2 = TextEditingController(text: "${l1[data].lname}");
    TextEditingController txtcall2 = TextEditingController(text: "${l1[data].call}");
    TextEditingController txtemail2 = TextEditingController(text: "${l1[data].email}");
    String path="";
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
                     fname: txtfname2.text,
                     lname: txtlname2.text,
                     call: txtcall2.text,
                     email: txtemail2.text,
                 path: path);
                 l1[data]=m1;
                 print(l1[data]);
                 print(txtfname2);
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
                controller: txtfname2,
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
                controller: txtlname2,
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
                controller: txtcall2,
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
                controller: txtemail2,
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
