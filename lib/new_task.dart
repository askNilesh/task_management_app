import 'package:flutter/material.dart';
import 'package:horizontal_calendar_widget/date_helper.dart';
import 'package:horizontal_calendar_widget/date_widget.dart';
import 'package:horizontal_calendar_widget/horizontal_calendar.dart';

import 'new_task_second_step.dart';

class CreateNewTask extends StatefulWidget {
  @override
  _CreateNewTaskState createState() => _CreateNewTaskState();
}

const labelMonth = 'Month';
const labelDate = 'Date';
const labelWeekDay = 'Week Day';

class _CreateNewTaskState extends State<CreateNewTask> {
  var colorGrey = Color(0xffCFD8E7);
  static var colorPurple = Color(0xff4F387B);
  var style = TextStyle(color: colorPurple, fontWeight: FontWeight.bold);

  DateTime firstDate = toDateMonthYear(DateTime.now());
  DateTime lastDate = toDateMonthYear(DateTime.now().add(Duration(days: 360)));

  String dateFormat = 'dd';
  String monthFormat = 'MMMM';
  String weekDayFormat = 'EEE';
  List<String> order = [labelMonth, labelDate, labelWeekDay];
  bool forceRender = false;

  Color defaultDecorationColor = Colors.transparent;
  BoxShape defaultDecorationShape = BoxShape.rectangle;
  bool isCircularRadiusDefault = true;

  Color selectedDecorationColor = Color(0xffFF97B5);
  BoxShape selectedDecorationShape = BoxShape.rectangle;
  bool isCircularRadiusSelected = true;

  Color disabledDecorationColor = Colors.grey;
  BoxShape disabledDecorationShape = BoxShape.rectangle;
  bool isCircularRadiusDisabled = true;

  int maxSelectedDateCount = 1;
  var listDates = List<DateTime>();

  @override
  void initState() {
    listDates.add(firstDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/user.png',
          fit: BoxFit.cover,
          height: 250,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: 230,
          left: 0,
          right: 0,
          child: Material(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height:  MediaQuery.of(context).size.height,
                margin: const EdgeInsets.only(bottom: 0),
                padding: const EdgeInsets.only(left: 30,right: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: ListView(
//                  shrinkWrap: true,
                  children: <Widget>[
                    Text(
                      'Title',
                      style: TextStyle(color: colorGrey, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      style: style,
                      decoration: InputDecoration(
                          counterText: '',
                          hintText: 'Dashboard Design',
                          hintStyle: style,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorGrey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorGrey),
                          ),
                          border: UnderlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Creation Date',
                      style: TextStyle(color: colorGrey, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      style: style,
                      decoration: InputDecoration(
                          counterText: '',
                          hintText: '1 June 2020',
                          hintStyle: style,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorGrey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorGrey),
                          ),
                          border: UnderlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Start Date',
                      style: TextStyle(color: colorGrey, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    HorizontalCalendar(
                      key: forceRender ? UniqueKey() : Key('Calendar'),
                      height: 90,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      firstDate: firstDate,
                      lastDate: lastDate,
                      dateFormat: dateFormat,
                      weekDayFormat: weekDayFormat,
                      monthFormat: monthFormat,
                      initialSelectedDates: listDates,
                      monthTextStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: colorPurple),
                      weekDayTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: selectedDecorationColor),
                      selectedDateTextStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                      selectedMonthTextStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                      selectedWeekDayTextStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                      defaultDecoration: BoxDecoration(
                        color: defaultDecorationColor,
                        shape: defaultDecorationShape,
                        borderRadius:
                        defaultDecorationShape == BoxShape.rectangle && isCircularRadiusDefault
                            ? BorderRadius.circular(20)
                            : null,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: selectedDecorationColor,
                        shape: selectedDecorationShape,
                        borderRadius: selectedDecorationShape == BoxShape.rectangle &&
                            isCircularRadiusSelected
                            ? BorderRadius.circular(20)
                            : null,
                      ),
                      disabledDecoration: BoxDecoration(
                        color: disabledDecorationColor,
                        shape: disabledDecorationShape,
                        borderRadius: disabledDecorationShape == BoxShape.rectangle &&
                            isCircularRadiusDisabled
                            ? BorderRadius.circular(20)
                            : null,
                      ),
//                      isDateDisabled: (date) => date.weekday == 7,
                      labelOrder: order.map(toLabelType).toList(),
                      maxSelectedDateCount: maxSelectedDateCount,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateNewTaskStepTwo()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),

                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      color: colorPurple,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),),
        ),
        Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: Material(
            color: Colors.transparent,
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Create New Task',
                    style:
                        TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  LabelType toLabelType(String label) {
    LabelType type;
    switch (label) {
      case labelMonth:
        type = LabelType.month;
        break;
      case labelDate:
        type = LabelType.date;
        break;
      case labelWeekDay:
        type = LabelType.weekday;
        break;
    }
    return type;
  }
}
