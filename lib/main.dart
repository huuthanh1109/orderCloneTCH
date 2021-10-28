// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/module/cart/cart_bloc.dart';
import 'package:order_app/module/counter/counter_bloc.dart';
import 'package:order_app/module/favorite/favorite_bloc.dart';
import 'package:order_app/screens/screens.dart';

import 'config/palette.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) {
              return CounterBloc();
            },
          ),
          BlocProvider(
            create: (BuildContext context) {
              return FavoriteBloc();
            },
          ),
        ],
        child: MaterialApp(
          home: MyApp(),
          title: 'Order App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Palette.scaffold,
          ),
          // ignore: prefer_const_literals_to_create_immutables
          routes: <String, WidgetBuilder>{},
        ),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future showStatusBar() =>
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

  Future hideStatusBar() => SystemChrome.setEnabledSystemUIOverlays([]);
  navigatePage() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => NavScreen()));
  }

  splashMove() {
    return Timer(Duration(seconds: 1), navigatePage);
  }

  @override
  void initState() {
    super.initState();
    hideStatusBar();
    splashMove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.themeColor,
      body: Container(
        child: Center(
          child: Image(
            image: AssetImage('images/logo_aha.png'),
            height: 150,
            width: 150,
          ),
        ),
      ),
    );
  }
}
