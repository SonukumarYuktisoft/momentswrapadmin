import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:toastification/toastification.dart';

class ToastHelper {
  static success(String message) {
    toastification.show(
      context: Get.context!,
      type: ToastificationType.success,
      showIcon: true,
      title: Text(message),
      autoCloseDuration: const Duration(seconds: 2),
    );
  }

   static error(String message) {
    toastification.show(
      context: Get.context!,
      type: ToastificationType.error,
       style: ToastificationStyle.minimal,
      foregroundColor: Colors.black,
      title: Text(message),
       showIcon: true,
      autoCloseDuration: const Duration(seconds: 4),
      backgroundColor: Colors.redAccent.withOpacity(.5),
      icon: Icon(Icons.error_outline_rounded,color: Colors.black,)

    );
  }

  static info(String message) {
    toastification.show(
      context: Get.context!,
      type: ToastificationType.info,
      title: Text(message),
      autoCloseDuration: const Duration(seconds: 4),
      showIcon: true,
      icon: Icon(Icons.info_outline_rounded,color: Colors.blueGrey.shade900,),
      backgroundColor: Colors.blueGrey.shade800.withOpacity(.6),
    );
  }

   static warning(String message) {
    toastification.show(
      context: Get.context!,
      type: ToastificationType.warning,
      backgroundColor: Colors.amber,
      style: ToastificationStyle.minimal,
      title: Text(message),
      showIcon: true,
      foregroundColor: Colors.black,
      icon: Icon(Icons.warning_rounded,color: Colors.black ,),
      autoCloseDuration: const Duration(seconds: 4),
    );
  }
   
       
  
}