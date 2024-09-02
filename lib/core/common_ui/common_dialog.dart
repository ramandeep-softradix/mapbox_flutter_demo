import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../common_button/custom_icon_button.dart';
import '../constants/app_strings.dart';
import '../text/app_text_widget.dart';
import '../theme/app_color_palette.dart';

showCommonAlertWithTwoActionsDialog(
    {required String title,
    required String subHeader,
    String? leftButtonTitle,
    String? rightButtonTitle,
    bool? barrierDismissible,
    bool showOnlySingleButton = false,
    final VoidCallback? noPressed,
    required Function() yesPressed}) async {
  if (Get.isDialogOpen == null || Get.isDialogOpen == false) {
    var titleToShow = title.isEmpty ? AppStrings.appName.tr : title;

    Get.dialog(
        barrierColor: lightColorPalette.black.withOpacity(0.3),
        barrierDismissible: barrierDismissible ?? false,
        Dialog(
          insetPadding: EdgeInsets.zero,
          alignment: Alignment.center,
          backgroundColor: lightColorPalette.transparentColor,
          shadowColor: lightColorPalette.transparentColor,
          surfaceTintColor: lightColorPalette.transparentColor,
          elevation: 0,
          child: PopScope(
              canPop: barrierDismissible ?? false,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.symmetric(horizontal: 50.w),
                      backgroundColor: lightColorPalette.whiteColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: lightColorPalette.whiteColor,
                        ),
                        padding: EdgeInsets.only(
                            top: (titleToShow.isNotEmpty) == true ? 20.h : 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            titleToShow.isNotEmpty
                                ? AppTextWidget(
                                    textAlign: TextAlign.center,
                                    style: CustomTextTheme.bigTitleStyle(
                                        height: 1,
                                        textSize: 15.sp,
                                        fontWeight: FontWeight.w600),
                                    text: titleToShow,
                                  ).paddingOnly(
                                    bottom: 10.h, left: 16.w, right: 16.w)
                                : SizedBox(
                                    height: 20.h,
                                  ),
                            AppTextWidget(
                              textAlign: TextAlign.center,
                              style: CustomTextTheme.normalTextStyle(),
                              text: subHeader,
                            ).paddingOnly(
                                bottom: 15.h, left: 16.w, right: 16.w),
                            Container(
                              width: double.infinity,
                              height: 0.6.w,
                              color: lightColorPalette.grey,
                            ),
                            IntrinsicHeight(
                                child: Row(
                              children: [
                                showOnlySingleButton
                                    ? const SizedBox()
                                    : Expanded(
                                        child: CommonInkwell(
                                            onTap:
                                                noPressed ?? () => Get.back(),
                                            child: AppTextWidget(
                                              textAlign: TextAlign.center,
                                              style: CustomTextTheme
                                                  .normalTextStyle(),
                                              text: leftButtonTitle ??
                                                  AppStrings.cancel.tr,
                                            ).paddingSymmetric(
                                                horizontal: 16.w,
                                                vertical: 14.w))),
                                Container(
                                  width: 0.6.w,
                                  height: double.infinity,
                                  color: lightColorPalette.grey,
                                ),
                                Expanded(
                                    child: CommonInkwell(
                                        onTap: yesPressed,
                                        child: AppTextWidget(
                                          textAlign: TextAlign.center,
                                          style:
                                              CustomTextTheme.normalTextStyle(),
                                          text: leftButtonTitle ??
                                              AppStrings.ok.tr,
                                        ).paddingSymmetric(
                                            horizontal: 16.w, vertical: 14.w)))
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
