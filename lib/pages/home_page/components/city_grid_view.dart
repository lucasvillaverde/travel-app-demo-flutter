import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/models/city_content.dart';

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
