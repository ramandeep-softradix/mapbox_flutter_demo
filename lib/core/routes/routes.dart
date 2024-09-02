import 'package:get/get.dart';
import 'package:map_box_demo/features/map_screen/binding/mapbox_screen_binding.dart';
import 'package:map_box_demo/features/map_screen/screen/mapbox_screen.dart';
import '../../core/constants/common_strings.dart';

class Routes {
  Routes._();

  static const String root = "/";
}

List<GetPage> appPages() => [
      GetPage(
        name: Routes.root,
        page: () => const MapBoxScreen(),
        fullscreenDialog: true,
        binding: MapBoxScreenBinding(),
        transition: CommonStrings.transition,
        transitionDuration:
            const Duration(milliseconds: CommonStrings.transitionDuration),
      ),
    ];
