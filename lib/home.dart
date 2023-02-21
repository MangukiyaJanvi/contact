import 'dart:io';

import 'package:contact/Modal.dart';
import 'package:flutter/material.dart';

import 'list.dart';

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
        appBar: AppBar(
          title: Text("Contact Details"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemBuilder: (context, index) =>
                  Box(l1[index].fname!, l1[index].call!,index,l1[index].path!),
              itemCount: l1.length,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '2').then((value) {
                      setState(() {

                      });
                    });
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Box(String name, String call,int index,String path) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, '3',arguments: index).then((value) {
            setState(() {

            });
          });
        },
        child: Row(
          children: [
            (path.isEmpty)
                ? CircleAvatar(
              maxRadius: 22,
              backgroundImage:
              AssetImage("assets/images/profile.png"),
            )
                : CircleAvatar(
              maxRadius: 22,
              backgroundImage: FileImage(
                File(path),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${name}"),
                Text("${call}"),
              ],
            ),
            Expanded(
              child: SizedBox(
                width: 10,
              ),
            ),
            Icon(Icons.navigate_next),
          ],
        ),
      ),
    );
  }
}
