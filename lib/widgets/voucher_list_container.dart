// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:order_app/config/palette.dart';
import 'package:order_app/data/data.dart';
import 'package:order_app/models/models.dart';
import 'package:dotted_line/dotted_line.dart';

class VoucherListContainer extends StatelessWidget {
  final Voucher voucher;
  const VoucherListContainer({Key? key, required this.voucher})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: ClipRRect(
              // borderRadius: BorderRadius.circular(6),
              child: Image.network(
                voucher.imageUrl,
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              ),
            ),
          ),
          DottedLine(
            direction: Axis.vertical,
            lineLength: double.infinity,
            lineThickness: 5.0,
            dashLength: 5.0,
            dashColor: Palette.scaffold,
            dashRadius: 20.0,
            dashGapLength: 5.0,
            dashGapColor: Colors.transparent,
            dashGapRadius: 0.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Expanded(
                    child: Text(
                      voucher.name,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade800,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    ' Sử dung trước ${voucher.dateTime}',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Palette.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
