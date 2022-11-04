import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GetData extends StatelessWidget {
  String name, email;
  GetData({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: name,
              decoration: InputDecoration(
                fillColor: Color.fromARGB(255, 255, 255, 255),
                filled: true,
                labelText: 'Name',
              ),
            ),
            Text('Name: $name'),
            Text('Email: $email'),
            // Text('Phone: $phone'),
          ],
        ),
      ),
    );
  }
}
