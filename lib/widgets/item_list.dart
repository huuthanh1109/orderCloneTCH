// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_app/config/palette.dart';
import 'package:order_app/widgets/widgets.dart';

class ItemList extends StatefulWidget {
  final String title;
  final IconData icon;
  final Widget child;
  final bool isNavigation;
  const ItemList(
      {Key? key,
      required this.title,
      required this.icon,
      required this.child,
      this.isNavigation = true})
      : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    bool _isShown = true;

    return InkWell(
      onTap: () {
        widget.isNavigation
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NavigationTab(
                    title: widget.title,
                    child: widget.child,
                  ),
                ),
              )
            : showCupertinoDialog(
                context: context,
                builder: (BuildContext ctx) {
                  return CupertinoAlertDialog(
                    title: Text('Xác nhận'),
                    content: Text(
                        'Bạn chắc chắn muốn đăng xuất tài khoản này không'),
                    actions: [
                      // The "Yes" button
                      CupertinoDialogAction(
                        onPressed: () {
                          setState(
                            () {
                              _isShown = false;
                              Navigator.of(context).pop();
                            },
                          );
                        },
                        child: Text('Đăng xuất'),
                        isDefaultAction: true,
                        isDestructiveAction: true,
                      ),
                      // The "No" button
                      CupertinoDialogAction(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Hủy bỏ'),
                        isDefaultAction: false,
                        isDestructiveAction: false,
                      )
                    ],
                  );
                },
              );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Icon(
                        widget.icon,
                        size: 20,
                        color: Colors.grey.shade800,
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 8,
                        color: Colors.grey.shade800,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  indent: 15,
                  height: 0,
                  color: Palette.scaffold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
