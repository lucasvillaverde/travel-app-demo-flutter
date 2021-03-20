import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/models/header_content.dart';
import 'package:travel_app/pages/presentation_page/components/presentation_page_item.dart';

class PresentationPager extends StatefulWidget {
  @override
  _PresentationPagerState createState() => _PresentationPagerState();
}

class _PresentationPagerState extends State<PresentationPager> {
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
                itemBuilder: (context, index) =>
                    PresentationPageItem(content: headerItems[index]),
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

  @override
  void dispose() {
    t.cancel();
    super.dispose();
  }
}
