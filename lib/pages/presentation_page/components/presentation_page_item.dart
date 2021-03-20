import 'package:flutter/cupertino.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/controllers/baseController.dart';

class PresentationPageItem extends StatelessWidget {
  final BaseController baseController = BaseController.getInstance();

  final content;
  final highlightTextStyle = TextStyle(
      fontSize: 25.0, fontWeight: FontWeight.bold, letterSpacing: 0.6);
  final titleStyle = TextStyle(
      fontSize: 25.0, fontWeight: FontWeight.w400, letterSpacing: 0.7);
  final descriptionStyle = TextStyle(
    fontSize: 15.0,
  );

  PresentationPageItem({this.content});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: baseController.isDarkTheme,
      builder: (context, isDarkTheme, _) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            content.title,
            style: titleStyle.copyWith(
              color: isDarkTheme
                  ? DARK_COLORS[PRIMARY_TEXT_COLOR]
                  : LIGHT_COLORS[PRIMARY_TEXT_COLOR],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            content.subtitle,
            style: highlightTextStyle.copyWith(
              color: isDarkTheme
                  ? DARK_COLORS[PRIMARY_HIGHLIGHT_TEXT_COLOR]
                  : LIGHT_COLORS[PRIMARY_HIGHLIGHT_TEXT_COLOR],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            content.description,
            style: descriptionStyle.copyWith(
              color: isDarkTheme
                  ? DARK_COLORS[PRIMARY_TEXT_COLOR]
                  : LIGHT_COLORS[PRIMARY_TEXT_COLOR],
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
