import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart' as geoLocator;
import '../../../core/common_ui/common_dialog.dart';
import '../../../core/constants/app_strings.dart';

class MapBoxScreenController extends GetxController {
  /// The instance of the Mapbox map.
  MapboxMap? mapboxMap;

  /// Observable variable to track the current map style (light or dark).
  var isLight = true.obs;
  var loading = false.obs;
  var searchController = TextEditingController();

  @override
  void onReady() {
    var status = Permission.locationWhenInUse.request();
    super.onReady();
  }

  /// Callback function that is triggered when the Mapbox map is created.
  void onMapCreated(MapboxMap mapboxMap) {
    this.mapboxMap = mapboxMap;
    // Disable the clickable attribution feature on the map.
    mapboxMap.attribution.updateSettings(AttributionSettings(clickable: false));
    // Disable the compass feature on the map.
    mapboxMap.compass.updateSettings(CompassSettings(enabled: false));
    // Disable the scale bar on the map.
    mapboxMap.scaleBar.updateSettings(ScaleBarSettings(enabled: false));
    mapboxMap.location.updateSettings(LocationComponentSettings(
      enabled: true,
      pulsingEnabled: true,
      puckBearingEnabled: true,
    ));
    navigateToDummyLatLong(zoomLvl: 15.5);
  }

  /// Toggles the map style between light (STANDARD) and dark (SATELLITE_STREETS).
  void onClickMapViewStyleChange() {
    isLight.value = !isLight.value;
    if (isLight.value) {
      // Switch to dark (satellite streets) style if currently in light style.
      mapboxMap?.loadStyleURI(MapboxStyles.STANDARD);
    } else {
      // Switch to light (standard) style if currently in dark style.
      mapboxMap?.loadStyleURI(MapboxStyles.SATELLITE_STREETS);
    }
    // Toggle the isLight value to reflect the new style state.
  }

  onSearchAddress() {
    String address = searchController.text.trim();
    if (address.isNotEmpty) {
      locationFromAddress(address).then((locations) {
        if (locations.isNotEmpty) {
          double lat = locations.first.latitude;
          double long = locations.first.longitude;
          animateTo(latitude: lat, longitude: long);
        } else {
          showCommonAlertWithTwoActionsDialog(
            title: AppStrings.locationNotFound,
            subHeader: AppStrings.locationNotFoundMsg.tr,
            yesPressed: () {
              animateTo(
                latitude: 40.712742,
                longitude: -74.013382,
              );
            },
          );
        }
      });
    }
  }

  animateTo(
      {required double latitude,
      required double longitude,
      double zoom = 17.5,
      double pitch = 45}) {
    mapboxMap?.flyTo(
        CameraOptions(
            center: Point(
                coordinates: Position(
              longitude,
              latitude,
            )),
            zoom: zoom,
            bearing: -17.6,
            pitch: 50),
        MapAnimationOptions(duration: 2000, startDelay: 0));
  }

  navigateToDummyLatLong({double? zoomLvl}) {
    animateTo(
        latitude: 40.712742, longitude: -74.013382, zoom: zoomLvl ?? 17.5);
  }

  Future<void> determinePosition() async {
    bool serviceEnabled;
    geoLocator.LocationPermission permission;
    // Check if location services are enabled
    serviceEnabled = await geoLocator.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Prompt user to enable location services
      showCommonAlertWithTwoActionsDialog(
          title: AppStrings.locationServiceDenied.tr,
          subHeader: AppStrings.locationServiceDeniedMsg.tr,
          yesPressed: () async {
            Get.back();
            await Future.delayed(const Duration(milliseconds: 200));
            await geoLocator.Geolocator.openLocationSettings();
            if (await geoLocator.Geolocator.isLocationServiceEnabled()) {
              determinePosition();
            }
          });
    }
    // Check location permission
    permission = await geoLocator.Geolocator.checkPermission();
    if (permission == geoLocator.LocationPermission.denied) {
      permission = await geoLocator.Geolocator.requestPermission();
      if (permission == geoLocator.LocationPermission.denied) {
        showCommonAlertWithTwoActionsDialog(
            title: AppStrings.locationPremDenied.tr,
            subHeader: AppStrings.locationPremDeniedMsg.tr,
            yesPressed: () {
              Get.back();
              openAppSettings();
            });
      }
    }
    if (permission == geoLocator.LocationPermission.deniedForever) {
      // Show a message and navigate to settings if permission is permanently denied
      showCommonAlertWithTwoActionsDialog(
          title: AppStrings.locationPremDeniedForever.tr,
          subHeader: AppStrings.locationPremDeniedForeverMsg.tr,
          yesPressed: () {
            Get.back();
            openAppSettings();
          });
    }
    if (permission == geoLocator.LocationPermission.always ||
        permission == geoLocator.LocationPermission.whileInUse &&
            serviceEnabled) {
      loading.value = true;
      var position = await geoLocator.Geolocator.getCurrentPosition();
      loading.value = false;
      animateTo(
          latitude: position.latitude, longitude: position.longitude, pitch: 0);
    }
  }
}
