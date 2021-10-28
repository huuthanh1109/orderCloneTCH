// ignore_for_file: prefer_const_constructors, prefer_final_fields

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_app/config/palette.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:order_app/models/models.dart';

class StoreDetail extends StatefulWidget {
  final Store store;
  const StoreDetail({Key? key, required this.store}) : super(key: key);

  @override
  _StoreDetailState createState() => _StoreDetailState();
}

class _StoreDetailState extends State<StoreDetail> {
  Set<Marker> _markers = {};

  void _onMapCreate(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(double.parse('${widget.store.lat}'),
              double.parse('${widget.store.long}')),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
          infoWindow: InfoWindow(title: '${widget.store.name}'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      width: _width,
      height: _height - 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: _width,
                  height: _height * 2 / 5,
                  color: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.network(
                      '${widget.store.imageUrl}',
                      width: _width,
                      height: _height * 2 / 5,
                      fit: BoxFit.cover,
                    ),
                    // CachedNetworkImage(
                    //   imageUrl:
                    //       'https://minio.thecoffeehouse.com/image/admin/24-lon-cpsd_225680_400x400.jpg',
                    //   width: _width,
                    //   height: _height * 2 / 5,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
                Container(
                  width: _width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              "AHA COFFEE",
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              "${widget.store.name}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade900,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Giờ mở cửa: ${widget.store.openTime} - ${widget.store.closeTime}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                        const Divider()
                      ],
                    ),
                  ),
                ),
                ItemList(
                  icon: CupertinoIcons.location_fill,
                  title: '3 Trung Hòa, Cầu Giấy, Hà Nội, Việt Nam',
                ),
                ItemList(
                  icon: CupertinoIcons.suit_heart,
                  title: 'Thêm vào danh sách yêu thích',
                ),
                ItemList(
                  icon: Icons.phone,
                  title: 'Liên hệ',
                ),
                ItemList(
                  icon: Icons.share_outlined,
                  title: 'Chia sẻ với bạn bè',
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Palette.scaffold,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  height: 200,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    markers: _markers,
                    onMapCreated: _onMapCreate,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(double.parse('${widget.store.lat}'),
                          double.parse('${widget.store.long}')),
                      zoom: 15,
                    ),
                    rotateGesturesEnabled: false,
                    scrollGesturesEnabled: false,
                    tiltGesturesEnabled: false,
                    zoomControlsEnabled: true,
                    zoomGesturesEnabled: true,
                  ),
                ),
                SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              width: _width,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 20,
                  ),
                  child: GestureDetector(
                    onTap: () => print('buy'),
                    child: Container(
                      width: _width,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Palette.primaryColor,
                      ),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'Đặt sản phẩm',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Tự đến lấy tại cửa hàng này',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: InkWell(
              child: Icon(
                CupertinoIcons.clear_circled_solid,
                size: 35,
                color: Colors.grey.shade700,
              ),
              onTap: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}

Widget ItemList({
  title,
  icon,
}) {
  return InkWell(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      child: Icon(
                        icon,
                        size: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                indent: 60,
                height: 1,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
