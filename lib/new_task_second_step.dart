import 'package:flutter/material.dart';
import 'package:horizontal_calendar_widget/date_helper.dart';
import 'package:horizontal_calendar_widget/date_widget.dart';
import 'package:horizontal_calendar_widget/horizontal_calendar.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';

class CreateNewTaskStepTwo extends StatefulWidget {
  @override
  _CreateNewTaskStateTwo createState() => _CreateNewTaskStateTwo();
}

class _CreateNewTaskStateTwo extends State<CreateNewTaskStepTwo> {
  var colorGrey = Color(0xffCFD8E7);
  static var colorPurple = Color(0xff4F387B);
  static var colorPink = Color(0xffFF97B5);
  var style = TextStyle(color: colorPurple, fontWeight: FontWeight.bold);
  static var colorText = Color(0xff4486AC);

  final mainList = [
    "assets/images/nilu.jpg",
    "assets/images/nilesh.jpg",
    "assets/images/dishu.jpg",
    "assets/images/nilu.jpg",
    "assets/images/nilesh.jpg",
    "assets/images/dishu.jpg",
    "assets/images/nilu.jpg",
    "assets/images/nilesh.jpg",
    "assets/images/dishu.jpg",
  ];

  var list = List<String>();
  var taskList = List<TaskData>();
  int count = 0;

  @override
  void initState() {
    super.initState();
    if (mainList.length > 5) {
      for (int i = 0; i < 4; i++) {
        list.add(mainList[i]);
      }
      count = mainList.length - 4;
    }

    taskList.add(TaskData('Design'));
    taskList.add(TaskData('Development'));
    taskList.add(TaskData('Research'));
    taskList.add(TaskData('Backend'));
    taskList.add(TaskData('Dashboard Design'));
    taskList.add(TaskData('Frontend'));
    taskList.add(TaskData('UI Design'));
    taskList.add(TaskData('App Design'));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/user.png',
          fit: BoxFit.cover,
          height: 200,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: 180,
          left: 0,
          right: 0,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.only(bottom: 0),
              padding: const EdgeInsets.only(left: 30, right: 30),
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
                    'Description',
                    style: TextStyle(color: colorGrey, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    style: style,
                    decoration: InputDecoration(
                        counterText: '',
                        hintText: 'Dummy Description',
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
                    height: 30,
                  ),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          )),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Members',
                                style: TextStyle(
                                    color: colorText, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Assigned 04',
                                style: TextStyle(
                                    color: colorPink, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 0),
                            child: mainList.length > 3
                                ? RowSuper(
                                    innerDistance: -1.0,
                                    children: <Widget>[
                                      RowSuper(
                                        innerDistance: -10.0,
                                        children: list
                                            .map(
                                              (data) => ClipRRect(
                                                borderRadius:
                                                    BorderRadius.all(Radius.circular(50.0)),
                                                child: Image.asset(
                                                  data,
                                                  height: 30,
                                                  width: 30,
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(0.0)),
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: colorText),
                                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '+',
                                              style: TextStyle(
                                                  color: colorText, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : RowSuper(
                                    children: mainList
                                        .map(
                                          (data) => ClipRRect(
                                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                            child: Image.asset(
                                              data,
                                              height: 30,
                                              width: 30,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    innerDistance: -10.0,
                                  ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Wrap(
                      children: taskList
                          .map((data) => GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                  margin:
                                      EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                                  decoration: BoxDecoration(
                                    color: data.isSelected ? colorPink : Color(0xffDFE8F6),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0) //
                                        ),
                                  ),
                                  child: Text(
                                    data.name,
                                    style: TextStyle(
                                      color: data.isSelected ? Colors.white : colorPurple,
                                      fontWeight:
                                          data.isSelected ? FontWeight.bold : FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    data.isSelected = !data.isSelected;
                                  });
                                },
                              ))
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Create New Task',
                      style:
                          TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    color: colorPurple,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
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
}

class TaskData {
  String name;
  bool isSelected = false;

  TaskData(this.name);
}
