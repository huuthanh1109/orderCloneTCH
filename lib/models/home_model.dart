// ignore_for_file: unnecessary_this, unused_import, unnecessary_new

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:order_app/config/ApiConfig.dart';

class Homes {
  List<Home> items = [];

  Homes();

  Homes.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final pelicula = new Home.fromJson(item);
      items.add(pelicula);
    }
  }
}

class Home {
  String? id;
  String? title;
  String? imageUrl;
  dynamic date;

  Home({
    this.id,
    required this.title,
    required this.imageUrl,
    required this.date,
  });

  Home.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    date = json['date'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    return data;
  }
}
