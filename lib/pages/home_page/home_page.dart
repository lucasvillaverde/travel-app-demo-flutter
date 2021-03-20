import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/controllers/baseController.dart';
import 'package:travel_app/pages/home_page/components/buddies_list_view.dart';
import 'package:travel_app/pages/home_page/components/city_grid_view.dart';
import 'package:travel_app/pages/home_page/components/search_bar.dart';
import 'package:travel_app/pages/home_page/components/settings_dialog.dart';

class HomePage extends StatelessWidget {
  final BaseController baseController = BaseController.getInstance();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: baseController.isDarkTheme,
              builder: (context, isDarkTheme, _) => Container(
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                  color: isDarkTheme
                      ? DARK_COLORS[CARD_COLOR]
                      : LIGHT_COLORS[CARD_COLOR],
                ),
                padding: EdgeInsets.only(bottom: 25.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Opacity(
                          opacity: isDarkTheme ? 0.3 : 1,
                          child: SvgPicture.asset(
                            "assets/images/hand.svg",
                            color: isDarkTheme
                                ? DARK_COLORS[HAND_IMAGE_COLOR]
                                : LIGHT_COLORS[HAND_IMAGE_COLOR],
                          ),
                        ),
                        SafeArea(
                          child: Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Menu(isDarkTheme: isDarkTheme),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                width: size.width,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Welcome,",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: isDarkTheme
                                                  ? DARK_COLORS[
                                                      PRIMARY_TEXT_COLOR]
                                                  : LIGHT_COLORS[
                                                      PRIMARY_TEXT_COLOR],
                                            ),
                                      ),
                                      Text(
                                        "Lucas",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            .copyWith(
                                              color: isDarkTheme
                                                  ? DARK_COLORS[
                                                      PRIMARY_HIGHLIGHT_TEXT_COLOR]
                                                  : LIGHT_COLORS[
                                                      PRIMARY_HIGHLIGHT_TEXT_COLOR],
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      width: size.width,
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SearchBar(
                          isDarkTheme: isDarkTheme,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Saved Places",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.3,
                    child: CityGridView(),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Travel Buddies",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Container(
                          height: 200,
                          width: size.width,
                          child: BuddiesListView(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  final isDarkTheme;

  Menu({this.isDarkTheme});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: SvgPicture.asset(isDarkTheme
                  ? "assets/icons/notification_light.svg"
                  : "assets/icons/notification_dark.svg"),
            ),
          ),
          InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();

              return showDialog(
                  context: context, builder: (context) => SettingsDialog());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: SvgPicture.asset(isDarkTheme
                  ? "assets/icons/menu_light.svg"
                  : "assets/icons/menu_dark.svg"),
            ),
          ),
        ],
      ),
    );
  }
}
