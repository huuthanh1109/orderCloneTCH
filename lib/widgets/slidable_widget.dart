// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:order_app/config/palette.dart';

enum SlidableAction { like }

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;
  final bool isLiked;
  final Function(SlidableAction) onDismissed;
  final Function onTap;

  const SlidableWidget({
    required this.child,
    required this.onDismissed,
    required this.onTap,
    this.isLiked = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: child,
        secondaryActions: <Widget>[
          GestureDetector(
            onTap: () => {onTap(), onDismissed(SlidableAction.like)},
            child: Container(
              margin: EdgeInsets.only(left: 15),
              width: 80,
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !isLiked
                      ? Icon(
                          CupertinoIcons.heart,
                          color: Colors.white,
                          size: 30,
                        )
                      : Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.white,
                          size: 30,
                        ),
                  const SizedBox(height: 4),
                  Text(
                    'Thích',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Palette.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      );
}
