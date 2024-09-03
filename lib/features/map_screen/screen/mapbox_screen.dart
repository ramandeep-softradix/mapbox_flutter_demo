import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:max_box_demo/features/map_screen/extenstion/mapbox_extenstion.dart';

import '../controller/mapbox_screen_controller.dart';

class MapBoxScreen extends GetView<MapBoxScreenController> {
  const MapBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mapBoxWidget(),
      floatingActionButton: floatingActionBtn(),
    );
  }
}
