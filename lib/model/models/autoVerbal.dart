// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';

String autoVerbalL(VerbalTypeRequestModel data) => json.encode(data.toJson());

class AutoVerbalReponseModel {
  final String message;
  AutoVerbalReponseModel({
    required this.message,
  });
  factory AutoVerbalReponseModel.fromJson(Map<String, dynamic> json) {
    return AutoVerbalReponseModel(
      message: json["message"] ?? "",
    );
  }
}

class AutoVerbalRequestModel {
  late String property_type_id;
  late String bank_id;
  late String bank_branch_id;
  late String bank_contact;
  late String owner;
  late String contact;
  late String date;
  late String bank_officer;
  late String address;
  late String approve_id;
  late String comment;
  late String lat;
  late String lng;
  late String image;
  late String verbal_con;
  late String verbal_com;
  late String code;
  late String user;
  late String option;
  VerbalTypeRequestModel data;
  // List<VerbalTypeRequestModel> autoVerbal;
  AutoVerbalRequestModel(
      {required this.property_type_id,
      required this.lat,
      required this.lng,
      required this.address,
      required this.approve_id,
      required this.bank_branch_id,
      required this.bank_contact,
      required this.bank_id,
      required this.bank_officer,
      required this.code,
      required this.comment,
      required this.contact,
      required this.date,
      required this.image,
      required this.option,
      required this.owner,
      required this.user,
      required this.verbal_com,
      required this.verbal_con,
      //   required this.autoVerbal,
      required this.data});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "verbal_property_id": property_type_id.trim(),
      "verbal_bank_id": bank_id.trim(),
      "verbal_bank_branch_id": bank_branch_id.trim(),
      "verbal_bank_contact": bank_contact.trim(),
      "verbal_owner": owner.trim(),
      "verbal_contact": contact.trim(),
      "verbal_date": date.trim(),
      "verbal_bank_officer": bank_officer.trim(),
      "verbal_address": address.trim(),
      "verbal_approve_id": approve_id.trim(),
      "verbal_comment": comment.trim(),
      "latlong_log": lat.trim(),
      "latlong_la": lng.trim(),
      "verbal_image": image.trim(),
      "verbal_com": verbal_com.trim(),
      "verbal_con": verbal_con.trim(),
      "verbal_property_code": code.trim(),
      "verbal_user": user.trim(),
      "verbal_option": option.trim(),
      "VerbalType": [autoVerbalL(data)]
    };
    return map;
  }
}

class VerbalTypeRequestModel {
  final String verbal_land_type;
  late String verbal_landid;
  late String verbal_land_des;
  late String verbal_land_area;
  late String verbal_land_minsqm;
  late String verbal_land_maxsqm;
  late String verbal_land_minvalue;
  late String verbal_land_maxvalue;
  late String verbal_land_dp;

  VerbalTypeRequestModel({
    required this.verbal_land_type,
    required this.verbal_landid,
    required this.verbal_land_des,
    required this.verbal_land_area,
    required this.verbal_land_minsqm,
    required this.verbal_land_maxsqm,
    required this.verbal_land_minvalue,
    required this.verbal_land_maxvalue,
    required this.verbal_land_dp,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "verbal_land_type": verbal_land_type.trim(),
      "verbal_landid": verbal_landid.trim(),
      "verbal_land_des": verbal_land_des.trim(),
      "verbal_land_area": verbal_land_area.trim(),
      "verbal_land_minsqm": verbal_land_minsqm.trim(),
      "verbal_land_maxsqm": verbal_land_maxsqm.trim(),
      "verbal_land_minvalue": verbal_land_minvalue.trim(),
      "verbal_land_maxvalue": verbal_land_maxvalue.trim(),
      "verbalToDate": verbal_land_dp.trim(),
    };
    return map;
  }
}
