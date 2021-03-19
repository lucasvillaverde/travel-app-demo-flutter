import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/models/buddy_content.dart';
import 'package:travel_app/models/city_content.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF5F4EF),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SvgPicture.asset("assets/images/hand.svg"),
            SafeArea(
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Menu(),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome,",
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF545454)),
                          ),
                          Text(
                            "Lucas",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(color: Color(0xFF545454)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SearchBar(),
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
          ],
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: SvgPicture.asset("assets/icons/notification.svg"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: SvgPicture.asset("assets/icons/menu.svg"),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 15.0, height: 1),
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        prefixIcon: Icon(Icons.search),
        hintText: "Search your next destination!",
        hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
      ),
    );
  }
}

class CityGridView extends StatelessWidget {
  final citiesList = <CityContent>[
    CityContent("japan", "assets/images/cities/city_japan.png"),
    CityContent("greece", "assets/images/cities/city_greece.png"),
    CityContent("barcelona", "assets/images/cities/city_barcelona.png"),
    CityContent("rome", "assets/images/cities/city_rome.png"),
    CityContent("japan", "assets/images/cities/city_japan.png"),
    CityContent("greece", "assets/images/cities/city_greece.png"),
    CityContent("barcelona", "assets/images/cities/city_barcelona.png"),
    CityContent("rome", "assets/images/cities/city_rome.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      scrollDirection: Axis.horizontal,
      childAspectRatio: 0.6,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      clipBehavior: Clip.none,
      children:
          citiesList.map((cityContent) => _buildCityCard(cityContent)).toList(),
    );
  }

  Widget _buildCityCard(CityContent cityContent) => Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              image: DecorationImage(
                  image: AssetImage(cityContent.imagePath),
                  fit: BoxFit.fitWidth),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            child: Text(
              cityContent.name,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () {},
            ),
          )
        ],
      );
}

class BuddiesListView extends StatelessWidget {
  final List<BuddyContent> _buddies = <BuddyContent>[
    BuddyContent("Carolina", "25", "Cousin", ""),
    BuddyContent("Hugo", "23", "Friend", "assets/images/buddy_avatar.svg"),
    BuddyContent("Jorge", "35", "Friend", "assets/images/buddy_avatar.svg"),
    BuddyContent("Kelly", "21", "Friend", "")
  ];

  final _buddyListItemColor = <Color>[
    Color(0xFF00664F),
    Color(0xFF9BA1FF),
    Color(0xFF1C323E),
  ];

  final _random = new Random();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 8.0),
      scrollDirection: Axis.horizontal,
      itemCount: _buddies.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(children: [
            SizedBox(height: 25),
            AddBuddyButton(),
          ]);
        }

        return Center(child: _buildBuddyListItem(_buddies[index - 1]));
      },
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(width: 20),
    );
  }

  _buildBuddyListItem(BuddyContent buddyContent) {
    return Container(
      width: 190,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Container(
                    width: 140,
                    height: 175,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(15, 50),
                              blurRadius: 5.0,
                              spreadRadius: 5.0)
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                        )),
                    child: CustomPaint(
                      painter: CurvePainter(
                        color: _buddyListItemColor[
                            _random.nextInt(_buddyListItemColor.length)],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0, top: 12.0),
                    alignment: Alignment.centerLeft,
                    width: 130,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Name",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          buddyContent.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "Age",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          buddyContent.age,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "Status",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          buddyContent.status,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 0,
            child: _buildBuddyListItemAvatar(buddyContent),
          ),
        ],
      ),
    );
  }

  _buildBuddyListItemAvatar(BuddyContent buddyContent) {
    if (buddyContent.avatar.isEmpty)
      return SvgPicture.asset(
        "assets/images/buddy_avatar.svg",
        color: Colors.grey.shade300,
        height: 200,
      );

    return SvgPicture.asset(
      buddyContent.avatar,
      height: 200,
    );
  }
}

class AddBuddyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF828282), width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(13.0))),
          alignment: Alignment.center,
          child: Icon(
            Icons.add,
            size: 35,
            color: Color(0xFF828282),
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final Color color;

  CurvePainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = this.color;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height * 0.1, size.width / 2, 0);
    path.lineTo(0, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
