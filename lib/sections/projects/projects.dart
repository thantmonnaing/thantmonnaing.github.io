import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tmn_portfolio/components/shimmer.dart';
import 'package:tmn_portfolio/sections/projects/widget/each_project_widget.dart';
import 'package:tmn_portfolio/sections/projects/widget/store_widget.dart';

import '../../components/glass_content..dart';
import '../../components/section_title.dart';
import '../../constants.dart';
import '../../global.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;

  List<Widget> projects = [];
  int activeIndex = 1;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 1, initialPage: 1);
    projects = [
      // projectContent('Java', const Color(0xFFf89820)),
      // flutterContent('クレドル - 1日1分で学ぶセルフコーチングアプリ', Colors.blue),
      // projectContent('Ionic', Colors.blue)
      // Image.asset('assets/images/project_mockup.png'),
      // Image.asset('assets/images/mobile_mockup.png'),
      // Image.asset('assets/images/mobile_bg_mockup.png'),
      // projectContent('Java', const Color(0xFFf89820),'project_mockup_2'),
      // projectContent('Java', const Color(0xFFf89820),'project_mockup'),
      // projectContent('Java', const Color(0xFFf89820),'project_mockup_2'),
      // Image.asset('assets/images/mobile_mockup.png'),
      // Image.asset('assets/images/project_mockup.png'),
      // Image.asset('assets/images/mobile_bg_mockup.png'),

      const EachProjectWidget(
          title: 'ユニティ音読アプリ(白)',
          description:
              "This app is used by students attending Unity, a prep school in Yokohama.It records reading lessons, allows image uploads, and shares data via the LINE app.",
          bgImg: 'project_mockup',
          img: 'unity_logo',
        appStoreId: "unity.edu.jp",
        playStoreId: "unity.edu.jp",
      ),
      const EachProjectWidget(
          title: 'ユニティ音読アプリ(白)',
          description:
              "This app is used by students attending Unity, a prep school in Yokohama.It records reading lessons, allows image uploads, and shares data via the LINE app.",
          bgImg: 'project_mockup',
          img: 'unity_logo',
        appStoreId: "unity.edu.jp",
        playStoreId: "unity.edu.jp",),
      const EachProjectWidget(
          title: 'ユニティ音読アプリ(白)',
          description:
              "This app is used by students attending Unity, a prep school in Yokohama.It records reading lessons, allows image uploads, and shares data via the LINE app.",
          bgImg: 'project_mockup',
          img: 'unity_logo',
        appStoreId: "unity.edu.jp",
        playStoreId: "unity.edu.jp",)
    ];

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _pageController = PageController(
        viewportFraction: size.width < (1110 / 2)
            ? 1
            : ((size.width < 1100) && size.width > (1110 / 2))
                ? 0.6
                : 0.5,
        initialPage: 1);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: kDefaultPadding * 2.5),
          const SectionTitle(
            title: "Projects",
            subTitle: "",
            color: kTextLightColor,
          ),
          const SizedBox(height: 20),
          Container(
            constraints: BoxConstraints(maxWidth: 1110, maxHeight: size.height),
            //margin: const EdgeInsets.only(top: kDefaultPadding),
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: size.width / 1.7,
                    height: size.height / 1.5,
                    child: _buildPageView(),
                  ),
                  const SizedBox(height: 20),
                  _buildPageViewDots()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget flutterContent(String skillName, Color color) {
    return Container(
      color: color.withOpacity(0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/cradle_logo.png',
                    width: 150,
                  ),
                  Text(
                    skillName,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'There are many programs that can improve your skills and to meet a new you. You can learn the work techniques of top businessmen in the industry and the knowledge, experience, and thinking of professional coaches.',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  goToBtn(0),
                  const SizedBox(
                    height: 20,
                  ),
                  goToBtn(1)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget projectContent(String skillName, Color color, String img) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/mobile_bg_mockup.png'),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            child: Image.asset('assets/images/$img.png')),
      ],
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      controller: _pageController,
      itemCount: projects.length,
      onPageChanged: (index) => setState(() => activeIndex = index),
      itemBuilder: (context, index) {
        return AnimatedScale(
          scale: index == activeIndex ? 1.0 : 0.8,
          duration: const Duration(milliseconds: 300),
          child: GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: projects[index],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPageViewDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        projects.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: CircleAvatar(
            radius: 4.0,
            backgroundColor:
                index == activeIndex ? Colors.white : Colors.white54,
          ),
        ),
      ),
    );
  }

  Widget goToBtn(int status) {
    return Container();
    //return StoreWidget(status: status);
  }
}
