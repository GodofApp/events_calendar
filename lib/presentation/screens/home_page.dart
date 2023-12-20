

import 'package:events_calendar/presentation/controllers/calendar_controller.dart';
import 'package:events_calendar/utils/constants.dart';
import 'package:events_calendar/widgets/custom_app_bar.dart';
import 'package:events_calendar/presentation/screens/detail_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MyHomePage extends StatelessWidget {

  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(),
        body: Container(
          color: Colors.white,
          child: Obx(() => SfDateRangePicker(
            onSelectionChanged:(args) async {
              await CalendarController.instance.onSelectionChanged(args);
              if (args.value is PickerDateRange) {
                if(args.value.endDate != null) {
                  showSheet(context, Constants.multipleDateList);
                }
              } else if (args.value is DateTime) {
                showSheet(context,Constants.singleDateList);
              }
            },
            showNavigationArrow: true,
            enablePastDates: true,
            selectionMode: CalendarController.instance.selectionMode.value,
            initialSelectedRange: PickerDateRange(
                DateTime.now().subtract(const Duration(days: 4)),
                DateTime.now().add(const Duration(days: 3))),
          )),
        ),
      ),
    );

  }

  Future showSheet(BuildContext context,int type){
    return showModalBottomSheet(
      context: context,
      clipBehavior: Clip.hardEdge,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
          ),
        ),
      builder: (context) =>
          DetailsBottom(modelType: type,),
    );
  }
}
