
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MyTabController extends GetxController with GetSingleTickerProviderStateMixin {

  final int count;

  TabController? controller;

  var tabpos = 0.obs;

  MyTabController(this.count, {String? tag});

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: count);

  }
  @override
  bool get wantKeepAlive => true;

  @override
  void onClose() {
    //controller.dispose();
    super.onClose();
  }
}