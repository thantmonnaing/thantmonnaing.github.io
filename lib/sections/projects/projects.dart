import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tmn_portfolio/components/shimmer.dart';

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
  late final PageController _pageController;
  late final AnimationController _animationController;

  List<Widget> projects = [];
  int activeIndex = 1;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationController
      ..forward()
      ..repeat();

    _pageController = PageController(viewportFraction: 0.6, initialPage: 1);
    projects = [
      projectContent('Java', const Color(0xFFf89820)),
      flutterContent('クレドル - 1日1分で学ぶセルフコーチングアプリ', Colors.blue),
      projectContent('Ionic', Colors.blue)
    ];



    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            constraints:
                BoxConstraints(maxWidth: 1110, maxHeight: size.height / 1.8),
            //margin: const EdgeInsets.only(top: kDefaultPadding),
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: size.width / 1.5,
                    height: size.height / 2.5,
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
                  const SizedBox(height: 20,),
                  const Text(
                    'There are many programs that can improve your skills and to meet a new you. You can learn the work techniques of top businessmen in the industry and the knowledge, experience, and thinking of professional coaches.',
                    style: TextStyle(fontSize: 14, color: Colors.grey,fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 20,),
                  goToBtn(0),
                  const SizedBox(height: 20,),
                  goToBtn(1)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget projectContent(String skillName, Color color) {
    return Container(
      color: color.withOpacity(0.4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            skillName,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                skillName,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
              Text(
                skillName,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
              Text(
                skillName,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
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

  Widget goToBtn(int status){
    /// status 0 is play store , 1 is app store
    String text = "Google Play";
    String title = "GET IT ON";
    String imageUrl = "assets/images/playstore_logo.png";
    if(status == 1){
       text = "App Store";
       title = "Download on the";
       imageUrl = "assets/images/apple_logo.png";
    }
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 10,bottom: 5,left: 10,right: 10),
        height: 50,
        width: 150,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.white,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                  blurStyle:
                  BlurStyle.outer // changes position of shadow
              ),
            ]),
        child: Row(
          children: [
            Image.asset(imageUrl),
            const SizedBox(width: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.grey),),
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
