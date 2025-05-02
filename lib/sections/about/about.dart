import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
//import 'dart:html' as html;
import 'package:flutter/services.dart' show rootBundle;
import '../../components/section_title.dart';
import '../../constants.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: kDefaultPadding * 2.5),
          const SectionTitle(
            title: "About Me",
            subTitle: "",
            color: kTextLightColor,
          ),
          aboutContent(size)
        ],
      ),
    );
  }

  Widget aboutContent(Size size) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1110),
      //margin: const EdgeInsets.only(top: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text(
                    "           I am a passionate Hybrid Mobile developer with a Bachelor degree in computer science. I have over 5 years’ experience in Mobile development. I have accomplished a lot of local and international applications using Ionic and Flutter. I am constantly striving to learn new technologies and look to better myself in the rapidly changing industry. I am interested in learning, contributing and improving day by day, taking part in teamwork. I am always willing to accept new challenges and actively seek out new technologies and stay up-to-date on IT trends.",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  downloadCV(),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  containerText(5, 'Mobile Development'),
                  const SizedBox(height: 15),
                  containerText(3, 'Ionic Framework'),
                  const SizedBox(height: 15),
                  containerText(2, 'Flutter Framework'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget containerText(int year, String framework) {
    return GlassContainer.frostedGlass(
      height: 60,
      width: 250,
      color: kFrostBlendColor.withOpacity(0.10),
      //blur: 10,
      borderColor: kMainColor.withOpacity(0.60),
      borderRadius: BorderRadius.circular(20.0),
      borderWidth: 1.0,
      elevation: 5.0,
      shadowColor: kMainColor.withOpacity(0.20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 10),
          const Icon(
            Icons.check,
            color: kTextColor,
          ),
          const SizedBox(width: 10),
          Text('+$year',
              style: const TextStyle(
                  color: kWhiteTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(framework,
                style: TextStyle(
                  color: kWhiteTextColor.withOpacity(0.7),
                  fontSize: 14,
                )),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget downloadCV(){
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 150,
      decoration: BoxDecoration(
          color: kTextColor.withOpacity(0.8),
          borderRadius: const BorderRadius.all(
            Radius.circular(100.0),
          ),
          boxShadow: const [
            BoxShadow(
                color: Colors.white,
                blurRadius: 3,
                offset: Offset(0, 2),
                blurStyle:
                BlurStyle.outer // changes position of shadow
            ),
          ]),
      child: Center(
        child: GestureDetector(
          onTap: () {
            downloadPdfWeb('assets/pdf/tmn.pdf', 'Thant_Mon_Naing_CV.pdf');
          },
          child: const Text(
            'Download CV',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              letterSpacing: 0.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void downloadPdfWeb(String assetPath, String fileName) async {
    /*try {
      final byteData = await rootBundle.load(assetPath);
      final buffer = byteData.buffer.asUint8List();
      final blob = html.Blob([buffer]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      html.AnchorElement(href: url)
        ..setAttribute("download", fileName)
        ..click();
      html.Url.revokeObjectUrl(url);
    } catch (e) {
      print("Error downloading PDF: $e");
    }*/
  }
}
