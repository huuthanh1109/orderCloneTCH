

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_app/data/data.dart';
import 'package:order_app/models/models.dart';
import 'package:order_app/services/home_service.dart';
import 'package:order_app/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController buttonCarouselController = CarouselController();
  final homeService = HomeService();
  int hourNow = DateTime.now().hour;
  List<Home> homes = [];
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _getEvent();
  }

  void _getEvent() async {
    setState(() => _isLoading = true);
    homes = await homeService.getEvent();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              titleSpacing: 0.0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(width: 15),
                  Icon(
                    hourNow >= 6 && hourNow <= 18
                        ? CupertinoIcons.sun_max_fill
                        : CupertinoIcons.moon_stars_fill,
                    size: 30,
                    color: hourNow >= 6 && hourNow <= 18
                        ? Colors.yellow.shade700
                        : Colors.blueGrey.shade600,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      hourNow >= 6 && hourNow <= 12
                          ? 'Chào buổi sáng'
                          : hourNow > 12 && hourNow < 18
                              ? 'Chào buổi chiều'
                              : hourNow >= 18
                                  ? 'Chào buổi tối'
                                  : '',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.5,
                      ),
                    ),
                  )
                ],
              ),
              floating: false,
              pinned: true,
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
            const SliverPadding(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              sliver: SliverToBoxAdapter(
                child: ShippingMethodContainer(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 10.0),
              sliver: SliverToBoxAdapter(
                child: CarouselSliderData(carousels),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.flame_fill,
                      size: 22,
                      color: Colors.orange.shade600,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Khám phá',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
              sliver: _isLoading
                  ? const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return HomeListContainer(
                              home: homes[index], onTap: () => print(''));
                        },
                        childCount: homes.length,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 15,
                        childAspectRatio: 2 / 3,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
