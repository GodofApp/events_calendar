import 'dart:ffi';

import 'package:events_calendar/presentation/controllers/calendar_controller.dart';
import 'package:events_calendar/utils/colors_constants.dart';
import 'package:events_calendar/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/calendar_model.dart';

class IndividualList extends StatelessWidget {

  final int tabType;
  final Datum userData;

  const IndividualList({super.key, required this.tabType, required this.userData});

  _makingPhoneCall(String number) async {
    var url = Uri.parse("tel:$number");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30,right: 30,top: 15,bottom: 15),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: getCardShadow(),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userData.name.toString(),
                      style: GoogleFonts.ubuntu(
                          fontSize: 13,
                          color: AppColors.blackMagnet,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("ID:${userData.id}".toUpperCase(),
                      style: GoogleFonts.ubuntu(
                          fontSize: 11,
                          color: AppColors.blackSteel,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),

                InkWell(
                  onTap: (){
                    _makingPhoneCall(userData.contactNo.toString());
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: getCardShadow(),
                      color: Colors.white
                    ),
                    child: Icon(
                      Icons.call,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Offered: ",
                      style: GoogleFonts.ubuntu(
                          fontSize: 11,
                          color: AppColors.blackSteel,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("₹XX,XX,XXX",
                      style: GoogleFonts.ubuntu(
                          fontSize: 11,
                          color: AppColors.blackMagnet,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Text("Current: ",
                      style: GoogleFonts.ubuntu(
                          fontSize: 11,
                          color: AppColors.blackSteel,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("₹XX,XX,XXX",
                      style: GoogleFonts.ubuntu(
                          fontSize: 11,
                          color: AppColors.blackMagnet,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
              ],
            ),

            SizedBox(height: 10,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 5,
                  height: 5,
                  margin: EdgeInsets.only(right: 5),
                  decoration: const ShapeDecoration(
                    color: Colors.red,
                    shape: OvalBorder(),
                  ),
                ),
                Text(userData.prority == Priority.low.index ? "Low Priority" :
                userData.prority == Priority.medium.index ? "Medium Priority" : "High Priority",
                  style: GoogleFonts.ubuntu(
                      fontSize: 11,
                      color: AppColors.blackSteel,
                      fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),

            const Divider(
              color: AppColors.blackSteel,
              height: 30,
              thickness: .5,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Due Date",
                      style: GoogleFonts.ubuntu(
                          fontSize: 11,
                          color: AppColors.blackSteel,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    Text(userData.dueDate.toString(),
                      style: GoogleFonts.ubuntu(
                          fontSize: 12,
                          color: AppColors.blackMagnet,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Level",
                      style: GoogleFonts.ubuntu(
                          fontSize: 11,
                          color: AppColors.blackSteel,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    Text(userData.level.toString(),
                      style: GoogleFonts.ubuntu(
                          fontSize: 12,
                          color: AppColors.blackMagnet,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                  ],
                ),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Days Left",
                      style: GoogleFonts.ubuntu(
                          fontSize: 11,
                          color: AppColors.blackSteel,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    Text(userData.daysLeft.toString(),
                      style: GoogleFonts.ubuntu(
                          fontSize: 12,
                          color: AppColors.blackMagnet,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                  ],
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
