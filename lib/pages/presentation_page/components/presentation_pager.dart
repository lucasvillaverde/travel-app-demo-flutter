import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/pages/home_page/home_page.dart';

class HeaderPages extends StatefulWidget {
  @override
  _HeaderPagesState createState() => _HeaderPagesState();
}

class _HeaderPagesState extends State<HeaderPages> {
  final PageController pageController = PageController(initialPage: 0);
  Timer t;

  @override
  void initState() {
    t = Timer(
        Duration(milliseconds: 4000),
        () => pageController.nextPage(
            duration: Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn));
    super.initState();
  }

  final subtitleStyle = TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.6,
      color: Color(0xFF545454));
  final titleStyle = TextStyle(
      fontSize: 25.0,
      color: Color(0xFF545454),
      fontWeight: FontWeight.w400,
      letterSpacing: 0.7);
  final descriptionStyle = TextStyle(
    color: Color(0xFF828282),
    fontSize: 15.0,
  );

  var headerItems = <HeaderContent>[
    HeaderContent(
        title: "Get Ready for",
        subtitle: "New Adventures",
        description: "Pack your things and make more memories Outdoor"),
    HeaderContent(
        title: "Ready?",
        subtitle: "New knowledge",
        description: "Pack your things and make more memories Outdoor"),
    HeaderContent(
        title: "Almost Ready?",
        subtitle: "Testing subtitle",
        description: "Pack your things and make more memories Outdoor")
  ];
  var headerPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: PageView.builder(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemCount: headerItems.length,
                itemBuilder: (context, index) => _buildPage(headerItems[index]),
                onPageChanged: (index) => {
                      _nextPage(t, pageController, index, 4000),
                      setState(() => this.headerPageIndex = index),
                    }),
          ),
        ),
        DotsIndicator(
          dotsCount: headerItems.length,
          position: this.headerPageIndex.toDouble(),
          decorator: DotsDecorator(
              activeColor: Color(0xFFFEC242), color: Color(0xFFD3D3D3)),
        ),
      ],
    );
  }

  _nextPage(timer, controller, index, delayInMillis) {
    if (t != null) t.cancel();

    t = Timer(
        Duration(milliseconds: delayInMillis),
        () => {
              if (index == headerItems.length - 1)
                {
                  controller.animateToPage(0,
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.fastLinearToSlowEaseIn)
                }
              else
                {
                  controller.nextPage(
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.fastLinearToSlowEaseIn),
                }
            });
  }

  Widget _buildPage(HeaderContent content) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(content.title, style: titleStyle),
          SizedBox(
            height: 5.0,
          ),
          Text(content.subtitle, style: subtitleStyle),
          SizedBox(
            height: 10.0,
          ),
          Text(
            content.description,
            style: descriptionStyle,
            textAlign: TextAlign.center,
          )
        ],
      );
}
