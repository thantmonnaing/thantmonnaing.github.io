import 'package:flutter/material.dart';

import '../../components/glass_content..dart';
import '../../components/section_title.dart';
import '../../constants.dart';
import '../../global.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: kDefaultPadding * 2.5),
          const SectionTitle(
            title: "Skills",
            subTitle: "",
            color: kTextLightColor,
          ),
          const SizedBox(height: 20),
          Container(
            constraints: const BoxConstraints(maxWidth: 1110),
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Center(
              child:GlobalValue.checkWidth(size.width) ? Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      progressWidget('TypeScript', 0.6),
                      const SizedBox(height: 20,),
                      progressWidget('Css/Scss', 0.5),
                      const SizedBox(height: 20,),
                      progressWidget('PHP', 0.6),
                      const SizedBox(height: 20,),
                      progressWidget('Java', 0.5),
                    ],
                  ),
                  const SizedBox(height: 50,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      progressWidget('REST API', 0.8),
                      const SizedBox(height: 20,),
                      progressWidget('Firebase', 0.8),
                      const SizedBox(height: 20,),
                      progressWidget('Back4app', 0.5),
                      const SizedBox(height: 20,),
                      progressWidget('Git', 0.7),
                      const SizedBox(height: 20,),
                      progressWidget('Backlog', 0.5),
                    ],
                  ),
                  const SizedBox(height: 50,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      progressWidget('Ionic', 0.9),
                      const SizedBox(height: 20,),
                      progressWidget('Dart', 0.7),
                      const SizedBox(height: 20,),
                      progressWidget('Flutter', 0.9),
                    ],
                  ),
                ],
              ): Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      progressWidget('TypeScript', 0.6),
                      const SizedBox(height: 20,),
                      progressWidget('Css/Scss', 0.5),
                      const SizedBox(height: 20,),
                      progressWidget('PHP', 0.6),
                      const SizedBox(height: 20,),
                      progressWidget('Java', 0.5),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      progressWidget('REST API', 0.8),
                      const SizedBox(height: 20,),
                      progressWidget('Firebase', 0.8),
                      const SizedBox(height: 20,),
                      progressWidget('Back4app', 0.5),
                      const SizedBox(height: 20,),
                      progressWidget('Git', 0.7),
                      const SizedBox(height: 20,),
                      progressWidget('Backlog', 0.5),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      progressWidget('Ionic', 0.9),
                      const SizedBox(height: 20,),
                      progressWidget('Dart', 0.7),
                      const SizedBox(height: 20,),
                      progressWidget('Flutter', 0.9),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget progressWidget(String skill, double level) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(skill,
            style: const TextStyle(fontSize: 14, color: kWhiteTextColor)),
        const SizedBox(width: 10),
        SizedBox(
          width: 150,
          child: LinearProgressIndicator(
            value: level,
            backgroundColor: Colors.grey.withOpacity(0.5),
            color: kProgressColor,
            minHeight: 10,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '${(level * 100).toInt()}%',
          style: const TextStyle(fontSize: 12, color: kWhiteTextColor),
        ),
      ],
    );
  }
}
