import 'package:flutter/material.dart';
import 'package:order_app/data/data.dart';
import 'package:order_app/widgets/widgets.dart';

class AccumulatePoints extends StatelessWidget {
  const AccumulatePoints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SeeAll(
              title: 'Phiếu ưu đãi của bạn',
              onPressed: () => print('see all'),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 5.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: GestureDetector(
                    onTap: () => {
                      // showModalBottomSheet<void>(
                      //   isScrollControlled: true,
                      //   context: context,
                      //   backgroundColor: Colors.black,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.only(
                      //       topLeft: Radius.circular(20),
                      //       topRight: Radius.circular(20),
                      //     ),
                      //   ),
                      // builder: (BuildContext context) =>
                      // StoreDetail(),
                      // ),
                    },
                    child: VoucherListContainer(voucher: vouchers[index]),
                  ),
                ),
                childCount: 3,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SeeAll(
              title: 'Đổi ưu đãi',
              onPressed: () => print('see all'),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: GestureDetector(
                    onTap: () => {
                      // showModalBottomSheet<void>(
                      //   isScrollControlled: true,
                      //   context: context,
                      //   backgroundColor: Colors.black,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.only(
                      //       topLeft: Radius.circular(20),
                      //       topRight: Radius.circular(20),
                      //     ),
                      //   ),
                      // builder: (BuildContext context) =>
                      // StoreDetail(),
                      // ),
                    },
                    child: Text('api'),
                    // child: StoreContainer(store: products[index]),
                  ),
                ),
                childCount: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
