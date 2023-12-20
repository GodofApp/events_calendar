

import 'package:events_calendar/presentation/controllers/calendar_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  const CustomAppBar({super.key});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Colors.blueAccent,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 15,
            right: 15
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  child: Icon(Icons.arrow_back),
                  onTap: (){
                    SystemNavigator.pop();
                  },
                ),

                SizedBox(width: 10,),
                Text("Calendar",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),

            ToggleSwitch(
              minHeight: 30,
              minWidth: 60,
              initialLabelIndex: 0,
              totalSwitches: 2,
              borderColor: [Colors.blue],
              activeBgColor: [Colors.blue],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.white,
              inactiveFgColor: Colors.blue,
              borderWidth: 2,
              labels: ['Day','Week'],
              onToggle: (index){
                if(index == 1){
                  CalendarController.instance.selectionMode.value = DateRangePickerSelectionMode.range;
                }else{
                  CalendarController.instance.selectionMode.value = DateRangePickerSelectionMode.single;
                }
              },
            )
          ],
        ),
      ),
    );
  }
}