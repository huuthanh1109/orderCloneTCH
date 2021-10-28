// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_this

// import 'package:flushbar/flushbar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/config/palette.dart';
import 'package:order_app/models/models.dart';
import 'package:order_app/module/favorite/favorite_bloc.dart';
import 'package:order_app/pages/product/product_detail.dart';
import 'package:order_app/pages/product/product_header.dart';
import 'package:order_app/services/product_service.dart';
import 'package:order_app/widgets/widgets.dart';
// import 'package:provider/src/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  // bool isLiked = false;
  bool _isLoading = false;
  final productService = ProductService();
  List<Product> products = [];
  @override
  void initState() {
    super.initState();
    _getProducts();
    // this.setState(() {
    //   !isLiked;
    // });
  }

  void _getProducts() async {
    setState(() => _isLoading = true);
    products = await productService.getProduct();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final FavoriteBloc favoriteBloc = context.read<FavoriteBloc>();

    return BlocBuilder<FavoriteBloc, bool>(builder: (context, isLike) {
      print('..................$isLike');
      return SafeArea(
        child: Scaffold(
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, boxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0.2,
                  backgroundColor: Colors.white,
                  forceElevated: boxIsScrolled,
                  floating: true,
                  pinned: true,
                  flexibleSpace: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor:
                                Palette.primaryColor.withOpacity(0.3),
                            child: Image(
                              image: AssetImage('images/icon_shipper.png'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () => {
                                  showModalBottomSheet<void>(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) => Text(''),
                                  ),
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    this.setState(() {
                                      isLike;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        'Giao đến',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(width: 4.0),
                                      Icon(
                                        isLike
                                            ? Icons.keyboard_arrow_down_rounded
                                            : Icons.keyboard_arrow_up,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '505 Trần Khát Chân, Thanh Nhàn, Hai Bà Trưng, Hà Nội',
                                style: TextStyle(
                                  color: Colors.black54,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size(_width, _height * 0.07),
                    child: ProductHeader(),
                  ),
                ),
              ];
            },
            body: _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) => Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
                      child: GestureDetector(
                        onTap: () => {
                          showModalBottomSheet<void>(
                            isScrollControlled: true,
                            context: context,
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            builder: (BuildContext context) => ProductDetail(
                              product: products[index],
                            ),
                          ),
                        },
                        child: SlidableWidget(
                          child: ProductContainer(product: products[index]),
                          onTap: () => {
                            favoriteBloc.add(Favorite()),
                          },
                          onDismissed: (action) =>
                              dismissSlidableItem(context, isLike),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      );
    });
  }
}

class Utils {
  static void showSnackBar(BuildContext context, bool check) =>
      Scaffold.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            // margin: EdgeInsets.all(5),
            content: Row(
              children: [
                Icon(
                  CupertinoIcons.checkmark_alt,
                  size: 22,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Text(
                  check
                      ? 'Đã xóa khỏi danh sách yêu thích'
                      : 'Đã thêm vào danh sách yêu thích',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
}

void dismissSlidableItem(BuildContext context, bool check) {
  Utils.showSnackBar(context, check);
}
