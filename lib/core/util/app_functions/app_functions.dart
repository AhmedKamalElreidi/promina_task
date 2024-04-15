import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: depend_on_referenced_packages

class AppFunctions {
  static navigateTo({required context, required navigatedScreen}) =>
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => navigatedScreen));
  static navigateAndFinishTo({required context, required navigatedScreen}) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => navigatedScreen),
        (route) => false,
      );

  static popNavigate({required context}) => Navigator.pop(context);

  static Future<String> showDatePickerComponent({required context}) async {
    final value = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050));

    if (value != null) {
      return "${value.year}-${value.month}-${value.day}";
    } else {
      return "";
    }
  }

  static Future uploadImageToAPI(File image) async {
    return MultipartFile.fromFile(image.path,
        filename: image.path.split('/').last);
  }

  static Future<String> showTimePickerComponent({required context}) async {
    final value = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (value != null) {
      return "${value.hour}:${value.minute}";
    } else {
      return "";
    }
  }

  static showToast({required String text}) => Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 18.sp);

  static showModelBottomSheetWithBlurBackground(
          {required context, required Widget widget}) =>
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        constraints: const BoxConstraints(maxWidth: double.infinity),
        builder: (context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: widget,
        ),
      );

  static showAlertDialogWithHeaderImage(
          {required context,
          required Widget dialogWidget,
          required String image}) =>
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        left: 20.r,
                        top: 20.r + 20.r,
                        right: 20.r,
                        bottom: 20.r),
                    margin: EdgeInsets.only(top: 20.r),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(0, 10),
                              blurRadius: 10),
                        ]),
                    child: dialogWidget,
                  ),
                  // bottom part
                  Positioned(
                    left: 20,
                    right: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 32.r,
                      child: Image.asset(image),
                    ),
                  )
                ],
              ),
            );
          });
}
