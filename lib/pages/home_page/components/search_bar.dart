import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';

class SearchBar extends StatelessWidget {
  final isDarkTheme;

  SearchBar({this.isDarkTheme});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 15.0, height: 1),
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isDarkTheme
                    ? DARK_COLORS[SECONDARY_TEXT_COLOR]
                    : LIGHT_COLORS[PRIMARY_TEXT_COLOR],
                width: 0.0)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: isDarkTheme
              ? DARK_COLORS[SECONDARY_TEXT_COLOR]
              : LIGHT_COLORS[PRIMARY_TEXT_COLOR],
        ),
        hintText: "Search your next destination!",
        hintStyle: TextStyle(
            color: isDarkTheme
                ? DARK_COLORS[SECONDARY_TEXT_COLOR]
                : LIGHT_COLORS[PRIMARY_TEXT_COLOR],
            fontSize: 15.0),
      ),
    );
  }
}
