import 'package:flutter/material.dart';

import '../../../components/shimmer.dart';

class StoreWidget extends StatefulWidget {
  final int status;
  final String storeLink;
  final VoidCallback onClick;
  final double dynamicWidth;
  final double dynamicHeight;

  const StoreWidget(
      {super.key,
      required this.status,
      required this.storeLink,
      required this.onClick,
      required this.dynamicWidth,
      required this.dynamicHeight});

  @override
  State<StoreWidget> createState() => _StoreWidgetState();
}

class _StoreWidgetState extends State<StoreWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  String text = "Google Play";
  String title = "GET IT ON";
  String imageUrl = "assets/images/playstore_logo.png";

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationController
      ..forward()
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// 1 is app store
    if (widget.status == 1) {
      text = "App Store";
      title = "DOWNLOAD ON";
      imageUrl = "assets/images/apple_logo.png";
    }
    return GestureDetector(
      onTap: widget.onClick,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
        height: widget.dynamicHeight / 18,
        width: widget.dynamicWidth / 13,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.white,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                  blurStyle: BlurStyle.outer // changes position of shadow
                  ),
            ]),
        child: Row(
          children: [
            Image.asset(
                imageUrl, fit: BoxFit.contain, width: (widget.dynamicHeight * 0.02)),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 8,
                      color: Colors.grey),
                ),
                // const SizedBox(height: 5,),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Row(
                      children: List.generate(
                          text.length,
                          (index) => ShimmerWidget(
                              key: ValueKey('$index'),
                              animationController: _animationController,
                              length: text.length,
                              char: text[index],
                              index: index + 1)),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
