import 'package:flutter/material.dart';
import 'package:tmn_portfolio/constants.dart';
import 'package:tmn_portfolio/sections/about/about.dart';
import 'package:tmn_portfolio/sections/projects/projects.dart';
import 'package:tmn_portfolio/sections/skills/skills.dart';
import 'package:tmn_portfolio/test_page.dart';

import 'sections/contact/contact.dart';
import 'sections/profile/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController scrollController;

  int selectedIndex = 0;
  int hoverIndex = 0;
  List<Widget> menuItems =  const [
    Tab(child : Text("Home")),
    Tab(child : Text("About")),
    Tab(child : Text("Skills")),
    Tab(child : Text("Projects")),
    Tab(child : Text("Contact")),
  ];

  final List<GlobalKey> globalList = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  BuildContext? tabContext;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(animateToTab);
    super.initState();
  }

  void animateToTab() {
    late RenderBox box;

    for (var i = 0; i < globalList.length; i++) {
      box = globalList[i].currentContext!.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);

      if (scrollController.offset >= position.dy) {
        DefaultTabController.of(tabContext!).animateTo(
          i,
          duration: const Duration(milliseconds: 100),
        );
      }
    }
  }

  void scrollToIndex(int index) async {
    scrollController.removeListener(animateToTab);
    final categories = globalList[index].currentContext!;
    await Scrollable.ensureVisible(
      categories,
      duration: const Duration(milliseconds: 600),
    );
    scrollController.addListener(animateToTab);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Builder(
        builder: (BuildContext context) {
          tabContext = context;
          return Scaffold(
            backgroundColor: kMainColor,
            appBar: _buildAppBar(),
            body: Center(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    ProfileSection(key: globalList[0]),
                    AboutSection(key: globalList[1]),
                    SkillsSection(key: globalList[2]),
                    ProjectsSection(key: globalList[3]),
                    ContactSection(key: globalList[4]),
                    //ImageTransitionPage(key: globalList[4])
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: kMainColor,
      title: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 2),
          constraints: const BoxConstraints(maxWidth: 750),
          child: TabBar(
            indicatorColor: kTextColor,
            dividerColor: kMainColor,
            unselectedLabelColor: Colors.white,
            labelColor: kTextColor,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 0), // No underline
            ),
            tabs: menuItems,
            onTap: (int index) => scrollToIndex(index),
          ),
        ),
      ),
    );
  }
}
