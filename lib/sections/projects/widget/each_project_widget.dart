import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmn_portfolio/sections/projects/widget/store_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../global.dart';

class EachProjectWidget extends StatelessWidget {
  final String title;
  final String description;
  final String bgImg;
  final String img;
  final String? playStoreId;
  final String? appStoreId;
  final String? appName;

  const EachProjectWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.bgImg,
      required this.img,
      this.playStoreId,
      this.appStoreId,
      this.appName});

  Future<void> _launchPlayStore() async {
    final Uri url = Uri.parse(
      'https://play.google.com/store/apps/details?id=$playStoreId', // Use package name (e.g., com.example.app)
    );
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchAppStore() async {
    final Uri url = Uri.parse(
      'https://apps.apple.com/jp/app/$appName/$appStoreId', // Replace XXXXXX with the actual App ID
    );
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double dynamicWidth = size.width;
    double dynamicHeight = size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        LayoutBuilder(builder: (context, constraints) {
          dynamicWidth = constraints.maxWidth;
          dynamicHeight = constraints.maxHeight;
          return Center(
            child: Image.asset(
              'assets/images/mobile_bg_mockup.png',
              fit: BoxFit.contain,
            ),
          );
        }),
        Container(
          width: dynamicWidth,
          height: dynamicHeight,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Image.asset(
              'assets/images/$bgImg.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(vertical: dynamicHeight * 0.08),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 12.spMin,
                overflow: TextOverflow.ellipsis // screen-adaptive text size
                ),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(vertical: dynamicHeight * 0.15),
          child: Image.asset(
            'assets/images/$img.png',
            fit: BoxFit.contain,
            width: dynamicHeight * 0.09, // or use constraints.maxWidth * 0.6
          ),
        ),
        Container(
          width: dynamicWidth,
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(
              top: dynamicHeight * 0.27,
              left: dynamicWidth * 0.07,
              right: dynamicWidth * 0.07,
              bottom: dynamicHeight * 0.15),
          child: Text(
            description,
            style: const TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          width: dynamicWidth,
          padding: EdgeInsets.symmetric(
              vertical: dynamicHeight * 0.05, horizontal: 10),
          child: GlobalValue.checkWidth(size.width)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: _showStoreBtn(dynamicHeight, dynamicWidth),
                )
              : Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _showStoreBtn(dynamicHeight, dynamicWidth)),
        )
      ],
    );
  }

  _showStoreBtn(double dynamicHeight, double dynamicWidth) {
    return [
      Visibility(
        visible: playStoreId != null,
        child: StoreWidget(
          dynamicHeight: dynamicHeight,
          dynamicWidth: dynamicWidth,
          status: 2,
          storeLink: playStoreId!,
          onClick: () => _launchPlayStore(),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Visibility(
        visible: appStoreId != null,
        child: StoreWidget(
          dynamicHeight: dynamicHeight,
          dynamicWidth: dynamicWidth,
          status: 1,
          storeLink: appStoreId!,
          onClick: () => _launchAppStore(),
        ),
      ),
    ];
  }
}
