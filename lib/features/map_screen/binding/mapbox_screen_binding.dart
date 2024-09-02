import 'package:get/get.dart';

import '../controller/mapbox_screen_controller.dart';

class MapBoxScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MapBoxScreenController());
  }

}