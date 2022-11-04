// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe, prefer_const_literals_to_create_immutables, deprecated_member_use, must_be_immutable

import 'dart:io';

import 'package:admin/contants.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:kfa_project/screen/Profile/components/FieldBox.dart';
// import 'package:kfa_project/screen/Profile/components/TwinBox.dart';
// import 'package:kfa_project/screen/Profile/components/genderBox.dart';
// import 'package:kfa_project/screen/Profile/components/singleBox.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AccountTest extends StatelessWidget {
  String fname, lname, email, address;
  AccountTest({
    Key? key,
    required this.fname,
    required this.lname,
    required this.email,
    required this.address,
  }) : super(key: key);

  String? _imagepath;
  File? _imagefile;
  final ImagePicker _picker = ImagePicker();
  final ImageCropper _cropper = ImageCropper();

  getImage(ImageSource source) async {
    _imagefile = (await _picker.getImage(source: source)) as File?;
    if (_imagefile != null) {
      CroppedFile? cropped = await _cropper.cropImage(
        sourcePath: _imagefile!.path,
        //aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 90,
        maxHeight: 100,
        maxWidth: 100,
        compressFormat: ImageCompressFormat.jpg,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.blue,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
      setState(() {
        _imagefile = cropped as File?;
      });
    } else {
      throw "Could not cropped Image";
    }
  }

  @override
  Widget build(BuildContext context) {
    //Get.lazyPut(() => ImageController());
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(LineAwesomeIcons.camera),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Choose Options',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            EditPicture(
                              icon: (LineAwesomeIcons.retro_camera),
                              title: 'Camera',
                              press: () {
                                getImage(ImageSource.camera);
                              },
                            ),
                            EditPicture(
                              icon: Icons.image_aspect_ratio_outlined,
                              title: 'Gallary',
                              press: () {
                                getImage(ImageSource.gallery);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
          )
        ],
        title: Text(
          'Account',
          style: TextStyle(
            //color: Color.fromRGBO(169, 203, 56, 1),
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 70,
        // flexibleSpace: SafeArea(
        //   child: Text('FAQ'),
        // ),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: double.infinity,
            maxHeight: 750,
          ),
          //padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            //---Profile---//
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: kBottomBorderRadius,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.black38,
                          child: _imagepath != null
                              ? CircleAvatar(
                                  radius: 68,
                                  backgroundColor: Colors.blue,
                                  backgroundImage: FileImage(File(_imagepath!)))
                              : CircleAvatar(
                                  radius: 68,
                                  backgroundColor: Colors.blue,
                                  //foregroundImage: AssetImage('assets/images/KFA-Logo.png'),
                                  backgroundImage: _imagefile == null
                                      ? null
                                      : FileImage(File(_imagefile!.path))),
                        ),
                        kWidthSizedBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$fname $lname',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text('ID:098765432',
                                style: Theme.of(context).textTheme.subtitle2),
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class EditPicture extends StatelessWidget {
  final String title;
  final icon;
  final press;
  const EditPicture({
    Key? key,
    required this.title,
    required this.icon,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: [
        InkWell(
          onTap: press,
          splashColor: Colors.lightBlue,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  icon,
                  color: kImageColor,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )
            ],
          ),
        ),
      ],
    );
  }
}
