// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe, use_build_context_synchronously

import 'package:admin/interface/screen/Abouts/Abouts.dart';
import 'package:admin/interface/screen/Abouts/aboutSideBar.dart';
import 'package:admin/interface/screen/Account/account.dart';
import 'package:admin/interface/screen/AutoVerbal/Add.dart';
import 'package:admin/interface/screen/Contacts/ContactUs_sidebar.dart';
import 'package:admin/interface/screen/Contacts/ContactsUs.dart';
import 'package:admin/interface/screen/Faqs/fapsSidebar.dart';
import 'package:admin/interface/screen/Faqs/faqs.dart';
import 'package:admin/interface/screen/Home/Body.dart';
import 'package:admin/interface/screen/Home/Customs/Drawer_menu.dart';
import 'package:admin/interface/screen/Home/Customs/MyDrawerList.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Auth/login.dart';

class HomePage extends StatefulWidget {
  final String user;
  final String first_name;
  final String last_name;
  final String email;
  final String gender;
  final String from;
  final String tel;
  final String id;
  const HomePage({
    Key? key,
    required this.user,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.gender,
    required this.from,
    required this.tel,
    required this.id,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('email');
    Fluttertoast.showToast(
      msg: 'Log Out',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      textColor: Colors.blue,
      fontSize: 20,
    );
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ));
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Center(
          child: Body(
        user: widget.user,
        email: widget.email,
        first_name: widget.first_name,
        last_name: widget.last_name,
        gender: widget.gender,
        from: widget.from,
        tel: widget.tel,
        id: widget.id,
      )),
      Center(child: Faps()),
      Center(child: Contacts()),
      Center(child: Abouts()),
    ];
    return Scaffold(
      body: tabs[_currentIndex],
      drawer: Drawer(
        width: 270,
        child: ListView(
          children: [
            MyHeaderDrawer(),
            MyDrawerList(
              icon: Icons.people,
              title: 'Account',
              Press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Account(
                      username: widget.user,
                      email: widget.email,
                      first_name: widget.first_name,
                      last_name: widget.last_name,
                      gender: widget.gender,
                      from: widget.from,
                      tel: widget.tel,
                      id: widget.id,
                    );
                  }),
                );
              },
            ),
            MyDrawerList(
              icon: Icons.list,
              title: 'Add Verbal',
              Press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Add();
                  }),
                );
              },
            ),
            MyDrawerList(
              icon: Icons.villa,
              title: 'Property',
              Press: () {},
            ),
            MyDrawerList(
              icon: Icons.wallet,
              title: 'Wallet',
              Press: () {},
            ),
            MyDrawerList(
              icon: Icons.question_answer,
              title: 'FAQ',
              Press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return FapsSidebar();
                  }),
                );
              },
            ),
            MyDrawerList(
              icon: Icons.contact_phone,
              title: 'Contact Us',
              Press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ContactsSidebar();
                  }),
                );
              },
            ),
            MyDrawerList(
              icon: Icons.people,
              title: 'About Us',
              Press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return AboutSidebar();
                  }),
                );
              },
            ),
            SizedBox(
              height: 40,
            ),
            Divider(
              color: Colors.blueAccent,
            ),
            MyDrawerList(
              icon: Icons.lock,
              title: 'Log Out',
              Press: () {
                logOut();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: "FAQ",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            label: "Contact",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "About",
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
