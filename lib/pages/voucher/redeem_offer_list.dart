// ignore_for_file: prefer_const_constructors

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:order_app/data/data.dart';
import 'package:order_app/models/models.dart';

class RedeemOfferList extends StatelessWidget {
  final List<Voucher> voucher;
  const RedeemOfferList({Key? key, required this.voucher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: _height * 2 / 5 + 5,
      // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      // margin: EdgeInsets.symmetric(horizontal:  10),
      width: _width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          final Voucher voucher = vouchers[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: _width / 2 - 30,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    voucher.imageUrl,
                      width: _width / 2 - 30,
                    fit: BoxFit.cover,
                  ),
                  // CachedNetworkImage(
                  //   imageUrl: voucher.imageUrl,
                  //   width: _width / 2 - 30,
                  //   fit: BoxFit.cover,
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        voucher.name,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Text(
                            '299',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Text('Points'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
