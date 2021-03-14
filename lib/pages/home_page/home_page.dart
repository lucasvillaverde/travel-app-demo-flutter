import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
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
                            "Charlie",
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
                      children: [
                        Row(
                          children: [
                            Text(
                              "Saved Places",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 14.0,
                        ),
                        Container(
                          width: size.width,
                          height: size.height * 0.3,
                          child: CityGridView(),
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
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      scrollDirection: Axis.horizontal,
      children:
          citiesList.map((cityContent) => _buildCityCard(cityContent)).toList(),
    );
  }

  Widget _buildCityCard(CityContent cityContent) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          image: DecorationImage(
            image: AssetImage(cityContent.imagePath),
            fit: BoxFit.fitWidth
          ),
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            child: Text(
              cityContent.name,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFFFFF),
              ),
            )),
      );
}

class CityContent {
  String name;
  final imagePath;

  CityContent(String name, this.imagePath) {
    this.name = name.toUpperCase();
  }
}
