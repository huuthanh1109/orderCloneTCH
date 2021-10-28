import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_app/config/palette.dart';
import 'package:order_app/widgets/widgets.dart';

class HeaderContainer extends StatelessWidget {
  // const Header({ Key? key }) : super(key: key);

  int hourNow = DateTime.now().hour;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      titleSpacing: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 15),
          Icon(
            hourNow >= 6 && hourNow <= 18
                ? CupertinoIcons.sun_max_fill
                : CupertinoIcons.moon_stars_fill,
            size: 30,
            color: hourNow >= 6 && hourNow <= 18
                ? Colors.yellow.shade700
                : Colors.blueGrey.shade600,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              hourNow >= 6 && hourNow <= 18
                  ? 'Chào buổi sáng'
                  : 'Chào buổi tối',
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.5,
              ),
            ),
          )
        ],
      ),
      actions: [
        CircleButton(
          icon: CupertinoIcons.ticket,
          iconSize: 20.0,
          // color: Palette.themeColor,
          onPressed: () => print('Search'),
        ),
        CircleButton(
          icon: CupertinoIcons.bell_solid,
          iconSize: 20.0,
          // color: Colors.yellow.shade500,
          onPressed: () => print('Search'),
          isStickers: true,
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
