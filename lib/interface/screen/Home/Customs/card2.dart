// ignore_for_file: import_of_legacy_library_into_null_safe, camel_case_types, prefer_const_constructors

import 'package:admin/contants.dart';
import 'package:admin/interface/screen/AutoVerbal/Add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Scard extends StatelessWidget {
  const Scard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Wrap(
        spacing: 5.0,
        runSpacing: 5.0,
        children: <Widget>[
          SCard(
            svgPic: 'assets/icons/profile2.svg',
            title: 'Profile',
            press: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) {
              //     return Account();
              //   }),
              // );
            },
          ),
          SCard(
            svgPic: 'assets/icons/addverbal.svg',
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
          SCard(
            svgPic: 'assets/icons/verballist.svg',
            title: 'Verbal List',
            press: () {},
          ),
          SCard(
            svgPic: 'assets/icons/property.svg',
            title: 'Property',
            press: () {},
          ),
          SCard(
            svgPic: 'assets/icons/list-property.svg',
            title: 'Property List',
            press: () {},
          ),
          SCard(
            svgPic: 'assets/icons/wallet.svg',
            title: 'Wallet',
            press: () {},
          ),
        ],
      ),
    );
  }
}

class SCard extends StatelessWidget {
  final String svgPic;
  final String title;
  final press;
  const SCard({
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
          height: 90,
          width: 92,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [kDefaultShadow],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: press,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 47,
                    width: 47,
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
                    style: TextStyle(fontSize: 12),
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
