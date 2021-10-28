// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:order_app/models/models.dart';

class ProductContainer extends StatelessWidget {
  final Product product;
  const ProductContainer({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.zero,
        //     topLeft: Radius.circular(10),
        //     bottomRight: Radius.zero,
        //     topRight: Radius.circular(10),
        //   ),
        // ),
      ),
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${product.name}',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 6),
                Expanded(
                  child: Text(
                    '${product.derc}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                ),
                Text(
                  NumberFormat.currency(locale: 'vi', symbol: 'đ')
                      .format(product.price),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: product.imageUrl== null
                ? Image(
                    image: AssetImage('images/image-none.png'),
                    width: 90,
                    height: 90,
                  )
                : Image.network(
                    '${product.imageUrl}',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
          ),
        ],
      ),
    );
  }
}
