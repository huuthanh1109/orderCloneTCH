// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:order_app/config/palette.dart';
import 'package:order_app/models/models.dart';

class HomeListContainer extends StatelessWidget {
  final Home home;
  final Function onTap;
  const HomeListContainer({Key? key, required this.home, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: Palette.scaffold,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                '${home.imageUrl}',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${home.title}',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  CupertinoIcons.calendar,
                  size: 20,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 6),
                Text(
                  'Đến  ${DateFormat("dd/MM").format(DateFormat("yyyy-MM-dd").parse(home.date))}',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
