// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:order_app/models/models.dart';

class StoreContainer extends StatelessWidget {
  final Store store;
  const StoreContainer({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: store.imageUrl == null
                ? Image(
                    image: AssetImage('images/image-none.png'),
                    width: 90,
                    height: 90,
                  )
                : Image.network(
                    '${store.imageUrl}',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
            
          ),
          const SizedBox(width: 15.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "AHA COFFEE",
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: Text(
                    '${store.name}',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade800,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Cách đây 1km',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
