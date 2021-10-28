// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:order_app/config/palette.dart';
import 'package:order_app/screens/product_screen.dart';

class ShippingMethodContainer extends StatelessWidget {
  const ShippingMethodContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductScreen()));
              },
              child: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Palette.primaryColor.withOpacity(0.2),
                      ),
                      child: Image(
                        width: 50,
                        height: 50,
                        image: AssetImage('images/icon_shipper.png'),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Giao hàng',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const VerticalDivider(
            width: 2,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          Expanded(
            child: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Palette.primaryColor.withOpacity(0.3),
                      border: Border.all(
                          width: 3,
                          color: Palette.primaryColor.withOpacity(0.2)),
                    ),
                    child: Image(
                      width: 50,
                      height: 50,
                      image: AssetImage('images/Pickup2.png'),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Đến lấy',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
