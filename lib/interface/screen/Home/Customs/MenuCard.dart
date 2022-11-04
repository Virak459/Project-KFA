// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_literals_to_create_immutables, prefer_const_constructors

//import 'package:crmproject/Customs/Contants.dart';

import 'package:admin/contants.dart';
import 'package:admin/interface/screen/Account/account.dart';
import 'package:admin/interface/screen/AutoVerbal/Add.dart';
import 'package:admin/interface/screen/Customs/responsive.dart';
import 'package:admin/interface/screen/Home/Customs/MenuCard1.dart';
import 'package:admin/interface/screen/Home/Customs/card2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Menu extends StatefulWidget {
  final String user;
  final String first_name;
  final String last_name;
  final String email;
  final String gender;
  final String from;
  final String tel;
  final String id;
  const Menu(
      {Key? key,
      required this.user,
      required this.first_name,
      required this.last_name,
      required this.email,
      required this.gender,
      required this.from,
      required this.tel,
      required this.id})
      : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Responsive(
        mobile: Mcard(
          username: widget.user,
          email: widget.email,
          first_name: widget.first_name,
          last_name: widget.last_name,
          gender: widget.gender,
          from: widget.from,
          tel: widget.tel,
          id: widget.id,
        ),
        tablet: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 715,
              child: card_Tab(
                email: '',
                first_name: '',
                from: '',
                gender: '',
                id: '',
                last_name: '',
                tel: '',
                username: '',
              ),
            ),
          ],
        ),
        phone: SizedBox(
          //color: Colors.red,
          width: 300,
          child: Scard(),
        ),
        desktop: Mcard(
          username: widget.user,
          email: widget.email,
          first_name: widget.first_name,
          last_name: widget.last_name,
          gender: widget.gender,
          from: widget.from,
          tel: widget.tel,
          id: widget.id,
        ),
      ),
    );
  }
}

class Mcard extends StatefulWidget {
  final String username;
  final String first_name;
  final String last_name;
  final String email;
  final String gender;
  final String from;
  final String tel;
  final String id;
  const Mcard({
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
  State<Mcard> createState() => _McardState();
}

class _McardState extends State<Mcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: <Widget>[
          Card(
            svgPic: 'assets/icons/profile2.svg',
            title: 'Profile',
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
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
            svgPic: 'assets/icons/addverbal.svg',
            title: 'Customer',
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
            title: 'Executive',
            press: () {},
          ),
          Card(
            svgPic: 'assets/icons/property.svg',
            title: 'Executive Approval',
            press: () {},
          ),
          Card(
            svgPic: 'assets/icons/list-property.svg',
            title: 'Comparable',
            press: () {},
          ),
          Card(
            svgPic: 'assets/icons/wallet.svg',
            title: 'sdfsd',
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
          height: 105,
          width: 105,
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: press,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
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
