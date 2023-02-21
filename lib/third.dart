import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'list.dart';

class Third extends StatefulWidget {
  const Third({Key? key}) : super(key: key);

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    int data = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '4', arguments: data).then(
                    (value) => setState(() {}),
                  );
                },
                child: Icon(Icons.edit),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            (l1[data].path!.isEmpty)
                ? CircleAvatar(
                    maxRadius: 80,
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  )
                : Container(
                    height: 500,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(
                            File(l1[data].path!),
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Container(
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                           color: Colors.white
                          ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            children: [
                              Text("${l1[data].fname} ${l1[data].lname}",
                                  style: Theme.of(context).textTheme.headline1),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${l1[data].call}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2),
                                      Text("Mobile  |  India",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    ],
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: 5,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await launchUrl(
                                        Uri.parse('tel:${l1[data].call}'),
                                      );
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green),
                                      child: Icon(
                                        Icons.call,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await launchUrl(
                                        Uri.parse('sms:${l1[data].call}'),
                                      );
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue),
                                      child: Icon(
                                        Icons.message,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                onPressed: () {
                                  launchUrl(
                                    Uri.parse("mailto:${l1[data].email}"),
                                  );
                                },
                                child: Text("${l1[data].email}",
                                    style: Theme.of(context).textTheme.headline2),
                              ),
                              TextButton(
                                onPressed: () {
                                  Timer(Duration(milliseconds: 1), () {
                                    Navigator.pop(context);
                                    l1.removeAt(data);
                                  });
                                },
                                child: Text("Delete Contact",
                                    style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
