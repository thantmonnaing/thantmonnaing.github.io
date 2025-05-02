import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';

import '../../../constants.dart';

class GlassContent extends StatelessWidget {
  const GlassContent({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: GlassContainer.frostedGlass(
          height: 200,
          width: 350,
          gradient: LinearGradient(
            colors: [
              kFrostBlendColor.withOpacity(0.40),
              kMainColor.withOpacity(0.20),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          //blur: 10,
          borderColor: kMainColor.withOpacity(0.60),
          borderRadius: BorderRadius.circular(20.0),
          borderWidth: 1.0,
          elevation: 5.0,
          shadowColor: kMainColor.withOpacity(0.20),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                      'Hello',
                      style: TextStyle(
                          color: kTextColor, fontSize: 16,fontWeight: FontWeight.bold),
                     
                  ),
                  SizedBox(height: 5,),
                 Text('I\'m Thant Mon Naing ',
                        style: TextStyle(
                            color: kNameTextColor, fontSize: 18),
                    ),
                     Text('Mobile Developer',
                        style: TextStyle(
                            color: kTextColor, fontSize: 16),
                    )
              ],
            ),
          ),
        ),
    );
  }
}