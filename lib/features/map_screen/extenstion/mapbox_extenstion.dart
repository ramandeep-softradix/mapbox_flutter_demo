import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:map_box_demo/features/map_screen/screen/mapbox_screen.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../../../core/common_loader/common_loader.dart';

extension MapboxScreenExtenstion on MapBoxScreen {
  Widget floatingActionBtn() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
              heroTag: null,
              onPressed: () {
                controller.onClickMapViewStyleChange();
              },
              child: const Icon(Icons.swap_horiz)),
          SizedBox(
            height: 10.w,
          ),

          FloatingActionButton(
              heroTag: null,
              onPressed: () {
                controller.determinePosition();
              },
              child: const Icon(Icons.gps_fixed)),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget mapBoxWidget() {
    return SafeArea(
      child: Stack(
        children: [
          Obx(() {
            var isLight = controller.isLight.value;
            return MapWidget(
              key: const ValueKey("mapWidget"),
              cameraOptions: CameraOptions(zoom: 3.0),
              styleUri: MapboxStyles.STANDARD,
              textureView: true,
              onMapCreated: controller.onMapCreated,
              onLongTapListener: (coordinate) {},
            );
          }),
          Positioned(
            top: 10.h,
            left: 10.w,
            right: 10.w,
            child: TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: 'Search address',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                // White background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2.0), // Change border color on focus
                ),
              ),
              onSubmitted: (value) {
                controller.onSearchAddress();
              },
            ),
          ),
          commonLoader()
        ],
      ),
    );
  }
  Widget commonLoader(){
    return Obx(()=>controller.loading.value?CommonLoader():const SizedBox());
  }
}
