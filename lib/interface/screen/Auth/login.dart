// ignore_for_file: prefer_const_constructors

import 'package:admin/interface/screen/Customs/Contants.dart';
import 'package:admin/interface/screen/Customs/ProgressHUD.dart';
import 'package:admin/interface/screen/Customs/formVLD.dart';
import 'package:admin/interface/screen/Customs/responsive.dart';
import 'package:admin/interface/screen/Home/Home.dart';
import 'package:admin/model/models/login_model.dart';
import 'package:admin/server/api_service.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Login();
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Check Loging with shared preferences

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  late LoginRequestModel requestModel;
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    // ignore: unnecessary_new
    requestModel = new LoginRequestModel(email: "", password: "");
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      color: kPrimaryColor,
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      child: _uiSteup(context),
    );
  }

  Widget _uiSteup(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/images/KFA-Logo.png',
          height: 100,
          width: 130,
        ),
        toolbarHeight: 100,
      ),
      backgroundColor: kPrimaryColor,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Responsive(
            mobile: login(context),
            tablet: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 500,
                        child: login(context),
                      ),
                    ],
                  ),
                )
              ],
            ),
            desktop: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 500,
                        child: login(context),
                      ),
                    ],
                  ),
                )
              ],
            ),
            phone: login(context),
          ),
        ),
      ),
    );
  }

  Padding login(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'Welcome to KFA system',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text.rich(
              TextSpan(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  TextSpan(
                    text: "ONE CLICK ",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: kImageColor,
                    ),
                  ),
                  TextSpan(
                    text: "1\$",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 30.0,
            ),
            FormValidate(
              label: 'Phone Number/ Email/ Username',
              onSaved: (input) => requestModel.email = input!, // Data email
              iconname: Icon(
                Icons.email,
                color: kImageColor,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              //   height: 55,
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextFormField(
                onSaved: (input) =>
                    requestModel.password = input!, // Data password
                obscureText: _isObscure,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Enter password',
                  prefixIcon: Icon(
                    Icons.key,
                    color: kImageColor,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      color: kImageColor,
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: kPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (input) {
                  if (input == null || input.isEmpty) {
                    return 'require *';
                  }
                  return null;
                },
              ),
            ),

            SizedBox(
              height: 10.0,
            ),
            // ignore: deprecated_member_use
            SizedBox(
              width: 150,
              child: AnimatedButton(
                text: 'Login',
                color: kPrimaryColor,
                pressEvent: () {
                  if (validateAndSave()) {
                    setState(() {
                      isApiCallProcess = true;
                      //AuthController.login();
                    });
                    APIservice apIservice = APIservice();
                    apIservice.login(requestModel).then((value) {
                      setState(() {
                        isApiCallProcess = false;
                      });
                      if (value.message == "Login Successfully!") {
                        AwesomeDialog(
                          context: context,
                          animType: AnimType.leftSlide,
                          headerAnimationLoop: false,
                          dialogType: DialogType.success,
                          showCloseIcon: false,
                          title: value.message,
                          autoHide: Duration(seconds: 3),
                          onDismissCallback: (type) {
                            // debugPrint('Dialog Dissmiss from callback $type');
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(
                                  user: value.user,
                                  email: value.email,
                                  first_name: value.first_name,
                                  last_name: value.last_name,
                                  gender: value.gender,
                                  from: value.from,
                                  tel: value.tel,
                                  id: value.id,
                                ),
                              ),
                            );
                          },
                        ).show();
                        // Navigator.pushReplacement(context,
                        //     MaterialPageRoute(builder: (context) => Add()));
                        // ignore: avoid_print
                        // print(value.message);
                      } else {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          headerAnimationLoop: false,
                          title: 'Error',
                          desc: value.message,
                          btnOkOnPress: () {},
                          btnOkIcon: Icons.cancel,
                          btnOkColor: Colors.red,
                        ).show();
                        print(value.message);
                      }
                      print(value.user);
                    });
                    // ignore: avoid_print
                    print(requestModel.toJson());
                  }
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: "Don't have any account? ",
                style: TextStyle(fontSize: 16.0, color: kTextLightColor),
              ),
              TextSpan(
                text: 'Register',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                style: TextStyle(
                  fontSize: 16.0,
                  color: kImageColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ])),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
