import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/controllers/baseController.dart';
import 'package:travel_app/pages/home_page/home_page.dart';
import 'package:travel_app/pages/presentation_page/components/presentation_pager.dart';

class PresentationPage extends StatelessWidget {
  final BaseController baseController = BaseController.getInstance();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            ValueListenableBuilder(
              valueListenable: baseController.isDarkTheme,
              builder: (context, isDarkTheme, _) {
                return Container(
                  width: size.width,
                  height: size.height,
                  color: isDarkTheme
                      ? DARK_COLORS[BACKGROUND_COLOR]
                      : LIGHT_COLORS[BACKGROUND_COLOR],
                  child: Stack(
                    children: [
                      Positioned(
                          top: 100,
                          right: -100,
                          child: _cloudImage(isDarkTheme)),
                      Positioned(
                          top: 280,
                          right: 0,
                          left: 80,
                          child: _cloudImage(isDarkTheme)),
                      Positioned(
                          top: 0,
                          bottom: 0,
                          left: -80,
                          child: _cloudImage(isDarkTheme)),
                      Positioned(
                          bottom: -150,
                          left: 0,
                          right: 0,
                          child: _buildingImage(size, isDarkTheme)),
                      Positioned(
                          bottom: -80,
                          left: 0,
                          right: 0,
                          child: _grassImage(size, isDarkTheme)),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: _girlImage(size, isDarkTheme),
                      ),
                    ],
                  ),
                );
              },
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
                          child: ValueListenableBuilder(
                            valueListenable: baseController.isDarkTheme,
                            builder: (context, isDarkTheme, _) => RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Start your Adventure",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(
                                          color: isDarkTheme
                                              ? DARK_COLORS[PRIMARY_TEXT_COLOR]
                                              : LIGHT_COLORS[
                                                  PRIMARY_TEXT_COLOR],
                                        ),
                                  ),
                                  WidgetSpan(
                                      child: Icon(
                                        Icons.chevron_right,
                                        color: isDarkTheme
                                            ? DARK_COLORS[PRIMARY_TEXT_COLOR]
                                            : LIGHT_COLORS[PRIMARY_TEXT_COLOR],
                                      ),
                                      alignment: PlaceholderAlignment.middle)
                                ],
                              ),
                            ),
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

  Widget _cloudImage(isDarkTheme) {
    final color =
        isDarkTheme ? DARK_COLORS[CLOUD_COLOR] : LIGHT_COLORS[CLOUD_COLOR];

    return Opacity(
        opacity: 0.2,
        child: SvgPicture.asset(
          "assets/images/CLOUD.svg",
          height: 100,
          color: color,
          clipBehavior: Clip.none,
        ));
  }

  Widget _girlImage(size, isDarkTheme) => SvgPicture.asset(
        isDarkTheme
            ? 'assets/images/GIRL_DARK.svg'
            : 'assets/images/GIRL_LIGHT.svg',
        height: size.width * 0.5,
        fit: BoxFit.fitWidth,
        clipBehavior: Clip.none,
        allowDrawingOutsideViewBox: true,
      );

  Widget _buildingImage(size, isDarkTheme) {
    final color = isDarkTheme
        ? DARK_COLORS[BUILDING_COLOR]
        : LIGHT_COLORS[BUILDING_COLOR];

    return SvgPicture.asset(
      "assets/images/BUILDING.svg",
      color: color,
    );
  }

  Widget _grassImage(size, isDarkTheme) =>
      SvgPicture.asset("assets/images/GRASS.svg",
          width: size.width * 0.7, fit: BoxFit.fitWidth);

  Widget _airplaneImage() => Opacity(
        opacity: 0.8,
        child: SvgPicture.asset(
          "assets/images/AIRPLANE.svg",
          color: Color(0xFFCACEEA),
        ),
      );
}
