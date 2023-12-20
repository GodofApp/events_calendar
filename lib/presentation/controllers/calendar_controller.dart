import 'package:events_calendar/model/calendar_model.dart';
import 'package:events_calendar/model/type_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../model/type_count.dart';

enum Types{
  all,
  hrd,
  tech1,
  followUp
}

enum Priority{
  low,
  medium,
  high,
}

class CalendarController extends GetxController{

  late Rx<DateRangePickerSelectionMode> selectionMode;

  static CalendarController instance = Get.find<CalendarController>();

  String selectedDate = '';

  String selectedRange = '';

  List<CalendarModel> calendarList = List<CalendarModel>.empty(growable: true).obs;
  List<CalendarModel> filteredList = List<CalendarModel>.empty(growable: true).obs;
  List<CalendarModel> filteredListRange = List<CalendarModel>.empty(growable: true).obs;
  List<Datum> userDetails = List<Datum>.empty(growable: true).obs;

  List<TypeModel> typeModel = [];

  RxInt hrdCount = 0.obs;
  RxInt tech1Count = 0.obs;
  RxInt followUpCount = 0.obs;

  List<int> hrdArr = [];
  List<int> tech1Arr = [];
  List<int> followUpArr = [];

  int totalCount = 0;

  List<TypeCount> typeCounts = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData();
    selectionMode = DateRangePickerSelectionMode.single.obs;
  }


  Future<void> initData() async {
    calendarList.clear();
    await addUserData();
    calendarList.add(CalendarModel(date: "01",data: userDetails));
    calendarList.add(CalendarModel(date: "02",data: userDetails));
    calendarList.add(CalendarModel(date: "02",data: userDetails));
    calendarList.add(CalendarModel(date: "04",data: userDetails));
    calendarList.add(CalendarModel(date: "05",data: userDetails));
    calendarList.add(CalendarModel(date: "06",data: userDetails));
    calendarList.add(CalendarModel(date: "07",data: userDetails));
    calendarList.add(CalendarModel(date: "08",data: userDetails));
    calendarList.add(CalendarModel(date: "09",data: userDetails));
    calendarList.add(CalendarModel(date: "10",data: userDetails));
    calendarList.add(CalendarModel(date: "11",data: userDetails));
    calendarList.add(CalendarModel(date: "12",data: userDetails));
    calendarList.add(CalendarModel(date: "13",data: userDetails));
    calendarList.add(CalendarModel(date: "14",data: userDetails));
    calendarList.add(CalendarModel(date: "15",data: userDetails));
    calendarList.add(CalendarModel(date: "16",data: userDetails));
    calendarList.add(CalendarModel(date: "17",data: userDetails));
    calendarList.add(CalendarModel(date: "18",data: userDetails));
    calendarList.add(CalendarModel(date: "19",data: userDetails));
    calendarList.add(CalendarModel(date: "20",data: userDetails));
    calendarList.add(CalendarModel(date: "21",data: userDetails));
    calendarList.add(CalendarModel(date: "22",data: userDetails));
    calendarList.add(CalendarModel(date: "23",data: userDetails));
    calendarList.add(CalendarModel(date: "24",data: userDetails));
    calendarList.add(CalendarModel(date: "25",data: userDetails));
    calendarList.add(CalendarModel(date: "26",data: userDetails));
    calendarList.add(CalendarModel(date: "27",data: userDetails));
    calendarList.add(CalendarModel(date: "28",data: userDetails));
    calendarList.add(CalendarModel(date: "29",data: userDetails));
  }

  Future addUserData() async {
    userDetails.clear();
    userDetails.add(Datum(id: "LOREM123456",name: "Balram Naidu",type: 1,contactNo: "9321874057",prority: 1,dueDate: "5 Jan 24",level: 10,daysLeft: 20));
    userDetails.add(Datum(id: "LOREM123457",name: "Rakesh Nair",type: 2,contactNo: "9321874056",prority: 2,dueDate: "5 Feb 24",level: 20,daysLeft: 30));
    userDetails.add(Datum(id: "LOREM123458",name: "Kapil Pandey",type: 3,contactNo: "9321874055",prority: 3,dueDate: "5 May 24",level: 5,daysLeft: 60));
    userDetails.add(Datum(id: "LOREM123459",name: "Mihir Sanchla",type: 1,contactNo: "9321874054",prority: 1,dueDate: "5 jun 24",level: 1,daysLeft: 50));
    userDetails.add(Datum(id: "LOREM1234510",name: "Akhil Murali",type: 2,contactNo: "9321874053",prority: 2,dueDate: "5 Jul 24",level: 25,daysLeft: 40));
    userDetails.add(Datum(id: "LOREM1234511",name: "Sarth kiran",type: 3,contactNo: "9321874052",prority: 3,dueDate: "5 Aug 24",level: 30,daysLeft: 30));
    userDetails.add(Datum(id: "LOREM1234512",name: "Meenakshi jethva",type: 1,contactNo: "9321874051",prority: 1,dueDate: "5 Sep 24",level: 40,daysLeft: 60));
    userDetails.add(Datum(id: "LOREM1234513",name: "Kathiresan",type: 2,contactNo: "9321874050",prority: 2,dueDate: "5 Oct 24",level: 50,daysLeft: 70));
    userDetails.add(Datum(id: "LOREM123414",name: "Dinesh Kumar",type: 3,contactNo: "9321874017",prority: 3,dueDate: "5 Nov 24",level: 30,daysLeft: 80));
    userDetails.add(Datum(id: "LOREM123415",name: "Satish kumar",type: 1,contactNo: "9321874027",prority: 1,dueDate: "5 Dec 24",level: 30,daysLeft: 90));
    userDetails.add(Datum(id: "LOREM123416",name: "Gopi Naidu",type: 2,contactNo: "9321874037",prority: 2,dueDate: "5 Jan 24",level: 10,daysLeft: 10));
    userDetails.add(Datum(id: "LOREM123417",name: "David Benjamin",type: 3,contactNo: "9321874047",prority: 3,dueDate: "5 FEB 24",level: 50,daysLeft: 5));
    userDetails.add(Datum(id: "LOREM123418",name: "Deepika Rooprai",type: 1,contactNo: "9321874057",prority: 1,dueDate: "5 Mar 24",level: 10,daysLeft: 5));
    userDetails.add(Datum(id: "LOREM123419",name: "Chunky Pandey",type: 2,contactNo: "9321874067",prority: 2,dueDate: "5 Apr 24",level: 30,daysLeft: 15));
    userDetails.add(Datum(id: "LOREM123420",name: "Abhijeet Gawde",type: 3,contactNo: "9321874077",prority: 3,dueDate: "5 May 24",level: 20,daysLeft: 10));
    userDetails.add(Datum(id: "LOREM123421",name: "Kaustubh Gharat",type: 1,contactNo: "9321874097",prority: 1,dueDate: "5 June 24",level: 10,daysLeft: 10));
    userDetails.add(Datum(id: "LOREM123422",name: "Raja Naidu",type: 2,contactNo: "9321874097",prority: 2,dueDate: "5 July 24",level: 30,daysLeft: 20));
    userDetails.add(Datum(id: "LOREM123423",name: "Simran Sheety",type: 3,contactNo: "9321874017",prority: 3,dueDate: "5 Aug 24",level: 40,daysLeft: 20));
    userDetails.add(Datum(id: "LOREM123424",name: "Prakash Kularni",type: 1,contactNo: "9321874027",prority: 1,dueDate: "5 Sept 24",level: 10,daysLeft: 20));
  }

  Future<void> onSelectionChanged(DateRangePickerSelectionChangedArgs args) async {
    if (args.value is PickerDateRange) {
      selectedRange = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
      // ignore: lines_longer_than_80_chars
          ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';

      if(args.value.endDate != null) {
        String startDate = args.value.startDate.toString();
        String endDate = args.value.endDate.toString();

        DateTime start = DateTime.parse(startDate);
        DateTime end = DateTime.parse(endDate);

        // Format the DateTime to get only the day
        String startDateStr = DateFormat('dd').format(start);
        String endDateStr = DateFormat('dd').format(end);

        filteredListRange = sortDataRangeByPriority(
            calendarList, int.parse(startDateStr), int.parse(endDateStr),
            Types.all.index);

        addTypeCountRange(filteredListRange);

        Map<int, int> tabTypeCounts = getTabTypeCounts(filteredListRange);

        hrdCount.value = tabTypeCounts[1] ?? 0;
        tech1Count.value = tabTypeCounts[2] ?? 0;
        followUpCount.value = tabTypeCounts[3] ?? 0;

        getTotalCount(hrdCount.value, tech1Count.value, followUpCount.value);
      }

      if (kDebugMode) {
        print("david$selectedRange");
      }
    } else if (args.value is DateTime) {
      selectedDate = args.value.toString();
      // Parse the string to DateTime
      DateTime dateTime = DateTime.parse(selectedDate);

      // Format the DateTime to get only the day
      String day = DateFormat('dd').format(dateTime);
      filteredList = sortDataByPriorityAndType(calendarList,day,Types.all.index);

      Map<int, int> tabTypeCounts = getTabTypeCounts(filteredList);

      hrdCount.value = tabTypeCounts[1] ?? 0;
      tech1Count.value = tabTypeCounts[2] ?? 0;
      followUpCount.value = tabTypeCounts[3] ?? 0;

      getTotalCount(hrdCount.value, tech1Count.value, followUpCount.value);

      if (kDebugMode) {
        print("david$selectedDate");
      }
    }
  }

  void addTypeCountRange(List<CalendarModel> list){
    Map<int, int> typeCountMap = {};
    int overallCount = 0;
    for(CalendarModel calendarModel in list) {
      for (Datum user in calendarModel.data!) {
        int userType = user.type!;
        typeCountMap[userType] = (typeCountMap[userType] ?? 0) + 1;
        overallCount++;
      }
    }

    // Convert the result to a list of TypeCount objects
     typeCounts = typeCountMap.entries
        .map((entry) => TypeCount(type: entry.key, count: entry.value))
        .toList();


    // Add the total count
    typeCounts.add(TypeCount(type: 4, count: overallCount));

    // Sort the list based on type
    typeCounts.sort((a, b) => a.type.compareTo(b.type));
  }

  List<CalendarModel> sortDataByPriorityAndType(List<CalendarModel> data, String selectedDate,int tabType) {
    // Sort by priority (high to low) and then by type (1 to 3)
    List<CalendarModel> filteredData = data.where((calendar) => calendar.date! == selectedDate).toList();

    filteredData.forEach((calendar) {
      calendar.data!.sort((a, b) {
        // Sort by priority
        int priorityComparison = b.prority!.compareTo(a.prority!);
        if (priorityComparison != 0) {
          return priorityComparison;
        }

        // If priorities are equal, sort by type
        return a.type!.compareTo(tabType);
      });
    });

    // Sort the calendar list based on the date
    // filteredData.sort((a, b) => a.date!.compareTo(b.date!));

    return filteredData;
  }

  List<CalendarModel> sortDataRangeByPriority(List<CalendarModel> data,int startDate,int endDate,int tabType){
    List<CalendarModel> filteredList = data
        .where((item) {
      int date = int.parse(item.date!);
      return date >= startDate && date <= endDate;
    }).toList();

    filteredList.forEach((calendar) {
      calendar.data!.sort((a, b) {
        // Sort by priority
        int priorityComparison = b.prority!.compareTo(a.prority!);
        if (priorityComparison != 0) {
          return priorityComparison;
        }

        // If priorities are equal, sort by type
        return a.type!.compareTo(tabType);
      });
    });

    // Sort the calendar list based on the date
    // filteredData.sort((a, b) => a.date!.compareTo(b.date!));

    return filteredList;
  }

  Map<int, int> getTabTypeCounts(List<CalendarModel> filteredList) {
    // Initialize counts for each tab type
    Map<int, int> tabTypeCounts = {1: 0, 2: 0, 3: 0};

    // Count the occurrences of each tab type within Datum objects
    for (var calendarModel in filteredList) {
      for (var datum in calendarModel.data!) {
        tabTypeCounts[datum.type!] = tabTypeCounts[datum.type!]! + 1;
      }
    }

    return tabTypeCounts;
  }


  void getTotalCount(int hrdCount,int tech1Count,int followUpCount){
    totalCount = hrdCount + tech1Count + followUpCount;
  }

}