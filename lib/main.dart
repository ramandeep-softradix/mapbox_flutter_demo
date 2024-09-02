import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as screenUtil;
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapBox;
import 'core/constants/common_strings.dart';
import 'core/routes/routes.dart';
import 'core/theme/app_color_palette.dart';
import 'core/translator/local_translation.dart';

/*
For Android
Please add your secure key to the android.properties file and set the ACCESS_TOKEN variable in the CommonConstants file with your public key to run the Android application.

For IOS
to download the iOS SDK add the token configuration to ~/.netrc :
  machine api.mapbox.com
  login mapbox
  password YOUR_SECRET_MAPBOX_ACCESS_TOKEN
*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  mapBox.MapboxOptions.setAccessToken(CommonConstants.ACCESS_TOKEN);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return screenUtil.ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'MapBox Demo',
            translations: LocalString(),
            locale: const Locale('en', 'US'),
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.dark,
            getPages: appPages(),
            initialRoute: Routes.root,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child!,
              );
            },
            theme: ThemeData(
              scaffoldBackgroundColor: lightColorPalette.backgroundColor,
              colorScheme: ColorScheme.fromSeed(
                  seedColor: lightColorPalette.backgroundColor),
              useMaterial3: true,
              fontFamily: CommonStrings.raleway,
            ),
          );
        });
  }
}
