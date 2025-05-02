import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class Menu extends StatefulWidget {
  @override
   final Function onCallback;
  const Menu({
    Key? key,
    required this.onCallback
  }) : super(key: key);
  _MenuState createState() => _MenuState();
  
}

class _MenuState extends State<Menu> {
 
  int selectedIndex = 0;
  int hoverIndex = 0;
  List<String> menuItems = [
    "Home",
    "About",
    "Skills",
    "Projects",
    "Certificates",
    "Contact"
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
        constraints: const BoxConstraints(maxWidth: 600),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            menuItems.length,
            (index) => InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
              widget.onCallback(index);
            });
          },
          onHover: (value) {
          setState(() {
            value ? hoverIndex = index : hoverIndex = selectedIndex;
          });
        },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                menuItems[index],
                style: (selectedIndex == index || hoverIndex == index) ? const TextStyle(fontSize: 14, color:  kTextColor ,fontWeight: FontWeight.bold): const TextStyle(fontSize: 12, color: kUnSelectedColor),
              ),
            ],
          ),
        )
          ),
        ),
      ),
    );
  }
}