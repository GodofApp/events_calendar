import 'package:events_calendar/model/calendar_model.dart';
import 'package:events_calendar/presentation/controllers/calendar_controller.dart';
import 'package:events_calendar/presentation/screens/individual_list.dart';
import 'package:events_calendar/presentation/screens/total_list.dart';
import 'package:events_calendar/utils/constants.dart';
import 'package:events_calendar/utils/styles.dart';
import 'package:events_calendar/presentation/controllers/tabbar_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsBottom extends StatelessWidget {
  final int modelType;

  final List<Tab> _tabs = <Tab>[];

  late MyTabController _tabx;

  DetailsBottom({super.key, required this.modelType}) {
    getTabs();
    _tabx = Get.put(MyTabController(_tabs.length));

    _tabx.controller!.addListener(() {
      // viewStandController.viewStanding.refresh();
      if (_tabx.tabpos.value != _tabx.controller!.index) {
        _tabx.tabpos.value = _tabx.controller!.index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            modelType == 1
                ? Text(
                    'Selected date count: ${CalendarController.instance.selectedDate}',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  )
                : Text(
                    'Selected range: ${CalendarController.instance.selectedRange}'),
            createTabBar(),

            Expanded(
              child: TabBarView(
                controller: _tabx.controller,
                children: _tabs
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: modelType == Constants.singleDateList
                                ? CalendarController.instance.filteredList
                                    .elementAt(0)
                                    .data!
                                    .length
                                : CalendarController.instance.filteredListRange.length,
                            itemBuilder: (context, index) {
                              List<Datum> userData = [];
                              List<CalendarModel> calendarModelList = [];
                              if (modelType == Constants.singleDateList) {
                                userData = CalendarController
                                    .instance.filteredList
                                    .elementAt(0)
                                    .data!;
                              }else{
                                calendarModelList = CalendarController
                                    .instance.filteredListRange;
                              }
                              return modelType == Constants.singleDateList
                                  ? IndividualList(
                                      tabType: _tabx.tabpos.value,
                                      userData: userData.elementAt(index),
                                    )
                                  : TotalList(
                                      tabType: _tabx.tabpos.value,calendarModel: calendarModelList.elementAt(index),
                                    );
                            },
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createTabBar() {
    return Container(
      height: 60,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 6,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: TabBar(
        controller: _tabx.controller,
        indicatorColor: Colors.blue,
        labelColor: Colors.black,
        labelStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal),
        indicatorWeight: 2,
        labelPadding: const EdgeInsets.all(0),
        tabs: _tabs,
      ),
    );
  }

  Tab createTab(String text, int index) {
    return Tab(
        child: Obx(() => Center(
              child: Text(text,
                  style: (_tabx.tabpos.value == index)
                      ? getnotificatontabselected()
                      : getnotificationtabunselected()),
            )));
  }

  void getTabs() {
    _tabs.clear();
    _tabs.add(createTab('All(${CalendarController.instance.totalCount})', 0));
    _tabs.add(
        createTab('HRD(${CalendarController.instance.hrdCount.value})', 1));
    _tabs.add(
        createTab('Tech(${CalendarController.instance.tech1Count.value})', 2));
    _tabs.add(createTab(
        'Follow up(${CalendarController.instance.followUpCount.value})', 3));
  }
}
