// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, import_of_legacy_library_into_null_safe

import 'package:admin/contants.dart';
import 'package:admin/interface/screen/Account/account.dart';
import 'package:admin/interface/screen/AutoVerbal/Add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class card_Tab extends StatelessWidget {
  final String username;
  final String first_name;
  final String last_name;
  final String email;
  final String gender;
  final String from;
  final String tel;
  final String id;
  const card_Tab({
    Key? key,
    required this.username,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.gender,
    required this.from,
    required this.tel,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      alignment: Alignment.center,
      child: Wrap(
        spacing: 5.0,
        runSpacing: 5.0,
        children: <Widget>[
          Card(
            svgPic: 'assets/icons/profile2.svg',
            title: 'Profile',
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                var widget;
                return Account(
                  username: widget.username,
                  email: widget.email,
                  first_name: widget.first_name,
                  last_name: widget.last_name,
                  gender: widget.gender,
                  from: widget.from,
                  tel: widget.tel,
                  id: widget.id,
                );
              }));
            },
          ),
          Card(
            svgPic: 'assets/icons/AddVerbal.svg',
            title: 'Add Verbal',
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Add(),
                ),
              );
            },
          ),
          Card(
            svgPic: 'assets/icons/verballist.svg',
            title: 'Verbal List',
            press: () {},
          ),
          Card(
            svgPic: 'assets/icons/property.svg',
            title: 'Property',
            press: () {},
          ),
          Card(
            svgPic: 'assets/icons/list-property.svg',
            title: 'Property List',
            press: () {},
          ),
          Card(
            svgPic: 'assets/icons/wallet.svg',
            title: 'Wallet',
            press: () {},
          ),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String svgPic;
  final String title;
  final press;
  const Card({
    Key? key,
    required this.svgPic,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 102,
          width: 218,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [kDefaultShadow],
          ),
          child: Material(
            color: Colors.transparent,
            //borderRadius: BorderRadius.circular(30),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: press,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        svgPic,
                        color: kImageColor,
                      ),
                    ),
                  ),
                  Text(
                    title,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
