import 'package:flutter/material.dart';

import '../../components/glass_content..dart';
import '../../constants.dart';
import '../../global.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Container(
            alignment: Alignment.centerRight,
            width: GlobalValue.dynamicWidth(size.width),
            child: GlassContent(size:size)),
            Container(
              width: GlobalValue.dynamicWidth(size.width),
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Image.asset("assets/images/profile_image1.png",
              ),
            ),
          ],
        ),
      ],
    );
  }
}