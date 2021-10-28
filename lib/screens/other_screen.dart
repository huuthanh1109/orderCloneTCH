// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_app/config/palette.dart';
import 'package:order_app/widgets/widgets.dart';
// import 'package:order_app/pages/other/list_title.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          titleSpacing: 15.0,
          title: Text(
            'Khác',
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            CircleButton(
              icon: CupertinoIcons.tickets,
              iconSize: 24.0,
              // color: Palette.themeColor,
              onPressed: () => print('Search'),
            ),
            CircleButton(
              icon: CupertinoIcons.bell,
              iconSize: 24.0,
              // color: Colors.yellow.shade500,
              onPressed: () => print('Search'),
              isStickers: true,
            ),
            const SizedBox(width: 15),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Tiện ích',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                CupertinoIcons.square_list,
                                size: 25,
                                color: Palette.primaryColor,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Lịch sử đơn hàng',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                CupertinoIcons.book_fill,
                                size: 25,
                                color: Colors.purple.shade300,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Điều khoản',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          CupertinoIcons.music_note,
                          size: 25,
                          color: Colors.green.shade400,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Nhạc đang phát',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                // ItemList(heading: 'Hỗ trợ', )
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hỗ trợ',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                    // ListTitle()
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          ItemList(
                            title: 'Đánh giá đơn hàng',
                            icon: Icons.star_border_rounded,
                            child: Scaffold(),
                          ),
                          ItemList(
                            title: 'Liên hệ và góp ý',
                            icon: CupertinoIcons.text_bubble,
                            child: Scaffold(),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    Text(
                      'Tài khoản',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          ItemList(
                            title: 'Thông tin cá nhân',
                            icon: CupertinoIcons.person,
                            child: Scaffold(),
                          ),
                          ItemList(
                            title: 'Địa chỉ đã lưu',
                            icon: CupertinoIcons.bookmark,
                            child: Scaffold(),
                          ),
                          ItemList(
                            title: 'Cài Đặt',
                            icon: Icons.settings_outlined,
                            child: Scaffold(),
                          ),
                          ItemList(
                            title: 'Đăng xuất',
                            icon: Icons.logout_outlined,
                            child: Scaffold(),
                            isNavigation: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
