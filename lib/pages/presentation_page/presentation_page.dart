import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/pages/home_page/home_page.dart';
import 'package:travel_app/pages/presentation_page/components/presentation_pager.dart';

class PresentationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              child: Stack(
                children: [
                  Positioned(
                      bottom: -150,
                      left: 0,
                      right: 0,
                      child: _buildingImage(size)),
                  Positioned(top: 100, right: -100, child: _cloudImage()),
                  Positioned(
                      top: 270, right: 0, left: 80, child: _cloudImage()),
                  Positioned(
                      top: 0, bottom: 0, left: -80, child: _cloudImage()),
                  Positioned(
                      bottom: -80, left: 0, right: 0, child: _grassImage(size)),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: _girlImage(size),
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: _airplaneImage(),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: GestureDetector(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Start your Adventure",
                                  style: Theme.of(context).textTheme.subtitle1),
                              WidgetSpan(
                                  child: Icon(Icons.chevron_right),
                                  alignment: PlaceholderAlignment.middle)
                            ]),
                          ),
                          onTap: (() => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              )),
                        )),
                  ),
                  Container(
                    height: size.height * 0.22,
                    width: size.width,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.2),
                      child: PresentationPager(),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }

  Widget _cloudImage() => Opacity(
      opacity: 0.2,
      child: SvgPicture.asset(
        "assets/images/CLOUD.svg",
        height: 100,
        clipBehavior: Clip.none,
      ));

  Widget _girlImage(size) => SvgPicture.asset(
        'assets/images/GIRL.svg',
        height: size.width * 0.5,
        fit: BoxFit.fitWidth,
        clipBehavior: Clip.none,
        allowDrawingOutsideViewBox: true,
      );

  Widget _buildingImage(size) => SvgPicture.asset(
        "assets/images/BUILDING.svg",
        color: Color(0xFFCACEEA),
      );

  Widget _grassImage(size) => SvgPicture.asset("assets/images/GRASS.svg",
      width: size.width * 0.7, fit: BoxFit.fitWidth);

  Widget _airplaneImage() => SvgPicture.asset(
        "assets/images/AIRPLANE.svg",
        color: Color(0xFFCACEEA),
      );
}
