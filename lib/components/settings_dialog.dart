import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/baseController.dart';
import 'package:travel_app/constants.dart';

class SettingsDialog extends StatelessWidget {
  final BaseController baseController = BaseController.getInstance();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey[50],
          ),
          height: 150,
          child: Center(
            child: ValueListenableBuilder(
              valueListenable: baseController.isDarkTheme,
              builder: (context, isDarkTheme, _) => Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Switch theme to ",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Icon(
                          isDarkTheme ? Icons.wb_sunny : Icons.nights_stay,
                          color: isDarkTheme ? Colors.amber : Colors.indigo,
                        )
                      ],
                    ),
                    Switch(
                      onChanged: (_) => baseController.switchAppTheme(),
                      activeColor: DARK_COLORS[BACKGROUND_COLOR],
                      value: isDarkTheme,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
