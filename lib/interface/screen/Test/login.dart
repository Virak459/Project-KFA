// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin/interface/screen/Test/getData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassData extends StatefulWidget {
  const PassData({Key? key}) : super(key: key);

  @override
  State<PassData> createState() => _PassDataState();
}

class _PassDataState extends State<PassData> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get data and passing'),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _email,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Phone',
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => Profile()));
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GetData(
                        name: _name.text,
                        email: _email.text,
                      )));
            },
            child: Text('Login'),
          )
        ],
      ),
    );
  }
}
