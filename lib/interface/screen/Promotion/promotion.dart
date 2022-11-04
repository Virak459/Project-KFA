// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, import_of_legacy_library_into_null_safe

import 'package:admin/interface/screen/Promotion/PromoDetail.dart';
import 'package:admin/interface/screen/Promotion/Title.dart';
import 'package:flutter/material.dart';

class Promotion extends StatelessWidget {
  const Promotion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ImagePromo(
            ImagPromotion: "assets/images/Promo-pic.jpg",
            press: () {},
          ),
          ImagePromo(
            ImagPromotion: "assets/images/Promo-pic.jpg",
            press: () {},
          ),
          ImagePromo(
            ImagPromotion: "assets/images/Promo-pic.jpg",
            press: () {},
          ),
          ImagePromo(
            ImagPromotion: "assets/images/Promo-pic.jpg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class Title_promo extends StatelessWidget {
  const Title_promo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            'Promotions',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              //color: Colors.blue,
              color: Colors.black,
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return PromoDetail();
                }),
              );
            },
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  'Show all',
                  style: TextStyle(fontSize: 15, height: 1, color: Colors.blue),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
