import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_app/models/models.dart';
import 'package:order_app/pages/store/store_detail.dart';
import 'package:order_app/services/store_service.dart';
import 'package:order_app/widgets/widgets.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  bool _isLoading = false;
  bool isViewMap = true;
  final storetService = StoreService();
  List<Store> stores = [];
  @override
  void initState() {
    super.initState();
    _getStores();
    _getViewMap();
  }

  void _getViewMap() {
    return setState(() => isViewMap = !isViewMap);
  }

  void _getStores() async {
    setState(() => _isLoading = true);
    stores = await storetService.getStores();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    print(isViewMap);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          titleSpacing: 15.0,
          title: Text(
            'Cửa hàng',
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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0.5,
              backgroundColor: Colors.white,
              titleSpacing: 15.0,
              floating: false,
              pinned: true,
              title: Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade200,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        CupertinoIcons.search,
                        color: Colors.black87,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Tìm kiếm cửa hàng',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: GestureDetector(
                    onTap: () => _getViewMap,
                    child: isViewMap
                        ? Row(
                            children: [
                              Icon(
                                CupertinoIcons.list_bullet,
                                size: 17,
                                color: Colors.grey.shade800,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Danh sách',
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Icons.map_outlined,
                                size: 17,
                                color: Colors.grey.shade800,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Bản đồ',
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
              sliver: 
              // isViewMap
              //     ? Container()
              //     : 
                  _isLoading
                      ? const SliverToBoxAdapter(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (context, index) => Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: GestureDetector(
                                      onTap: () => {
                                        showModalBottomSheet<void>(
                                          isScrollControlled: true,
                                          context: context,
                                          backgroundColor: Colors.black,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          builder: (BuildContext context) =>
                                              StoreDetail(store: stores[index]),
                                        ),
                                      },
                                      child:
                                          StoreContainer(store: stores[index]),
                                    ),
                                  ),
                              childCount: stores.length),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
