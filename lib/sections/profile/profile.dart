import 'package:flutter/material.dart';

import '../../components/glass_content..dart';
import '../../constants.dart';
import '../../global.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<Offset> _leftToCenter;
  late Animation<Offset> _rightToCenter;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _leftToCenter = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _rightToCenter = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _leftToCenter,
             child: Container(
              alignment: Alignment.centerRight,
              width: GlobalValue.dynamicWidth(size.width),
              child: GlassContent(size:size)),
           ),
            SlideTransition(
              position: _rightToCenter,
              child: Container(
                width: GlobalValue.dynamicWidth(size.width),
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Image.asset("assets/images/profile_image1.png",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}