// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class Title_promotion extends StatelessWidget {
  final String title_promo;

  const Title_promotion({
    Key? key,
    required this.title_promo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title_promo,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
