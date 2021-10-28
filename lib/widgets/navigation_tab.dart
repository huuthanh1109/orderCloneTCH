// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NavigationTab extends StatelessWidget {
  final String title;
  final Widget child;
  const NavigationTab({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          foregroundColor: Colors.black87,
          backgroundColor: Colors.white,
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: child,
      ),
    );
  }
}
