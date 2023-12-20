

import 'package:events_calendar/model/type_count.dart';
import 'package:events_calendar/model/type_model.dart';
import 'package:events_calendar/presentation/controllers/calendar_controller.dart';
import 'package:events_calendar/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/calendar_model.dart';

class TotalList extends StatelessWidget {

  final int tabType;
  final CalendarModel calendarModel;

  const TotalList({super.key, required this.tabType, required this.calendarModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
            boxShadow: getCardShadow()
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 50,
                width: 2,
                clipBehavior: Clip.none,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                ),
              ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(calendarModel.date.toString(),
                            style: GoogleFonts.ubuntu(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                
                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: CalendarController.instance.typeCounts.length,
                      itemBuilder: (context, index) {
                        TypeCount data = CalendarController.instance.typeCounts.elementAt(index);
                        return Padding(
                          padding: const EdgeInsets.only(left: 15,right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey, // Set the border color
                                    width: .5, // Set the border width
                                  ),
                                ),
                                child: Text(
                                  data.count.toString(),
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),

                              SizedBox(height: 5,),

                              Text(data.type == 1? "HRD":data.type == 2 ? "Tech 1": data.type == 3 ? "Follow up":"Total",
                                style: GoogleFonts.ubuntu(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54,
                                    height: 0
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                
                    /*Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey, // Set the border color
                              width: .5, // Set the border width
                            ),
                          ),
                          child: Text(
                            "02",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                
                        Text("Tech 1".toUpperCase(),
                          style: GoogleFonts.robotoMono(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                              height: 0
                          ),
                        )
                      ],
                    ),
                
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey, // Set the border color
                              width: .5, // Set the border width
                            ),
                          ),
                          child: Text(
                            "05",
                            style: GoogleFonts.montserrat(
                                fontSize: 10,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                
                        Text("Follow up".toUpperCase(),
                          style: GoogleFonts.robotoMono(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                              height: 0
                          ),
                        )
                      ],
                    ),
                
                
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey, // Set the border color
                              width: .5, // Set the border width
                            ),
                          ),
                          child: Text(
                            "10",
                            style: GoogleFonts.montserrat(
                                fontSize: 10,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                
                        Text("Total".toUpperCase(),
                          style: GoogleFonts.robotoMono(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                              height: 0
                          ),
                        )
                      ],
                    ),*/
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}
