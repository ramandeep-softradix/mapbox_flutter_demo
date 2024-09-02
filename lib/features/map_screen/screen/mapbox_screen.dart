import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_box_demo/features/map_screen/controller/mapbox_screen_controller.dart';
import 'package:map_box_demo/features/map_screen/extenstion/mapbox_extenstion.dart';

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
