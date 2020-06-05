import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[TaskListView(), Expanded(child: TaskProgressListView())],
      ),
    );
  }
}

class TaskProgressListView extends StatefulWidget {
  @override
  _TaskProgressListViewState createState() => _TaskProgressListViewState();
}

class _TaskProgressListViewState extends State<TaskProgressListView> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 0),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 2, right: 2),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ], color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'In Progress',
                        style: TextStyle(color: colorText, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '5h',
                        style: TextStyle(color: colorText, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'UI Design',
                          style: TextStyle(color: Color(0xffC6D2E1), fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      mainList.length > 3
                          ? RowSuper(
                              innerDistance: -1.0,
                              children: <Widget>[
                                RowSuper(
                                  innerDistance: -10.0,
                                  children: list
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
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    child: Center(
                                      child: Text(
                                        '$count+',
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
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      colorText,
                    ),
                    value: 0.8,
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class TaskListView extends StatefulWidget {
  @override
  _TaskListViewState createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  static var colorOne = Color(0xff81D1FF);
  static var colorTwo = Color(0xffFFAEC5);
  static var colorThree = Color(0xffA39AFF);

  var taskList = List<TaskData>();

  @override
  void initState() {
    taskList.add(TaskData(
        taskColor: colorOne, taskDate: 'May 2020', taskName: 'UI Design', taskNumber: '10 Tasks'));
    taskList.add(TaskData(
        taskColor: colorTwo,
        taskDate: 'May 2020',
        taskName: 'DashBoard Design',
        taskNumber: '4 Tasks'));
    taskList.add(TaskData(
        taskColor: colorThree,
        taskDate: 'May 2020',
        taskName: 'Profile Design',
        taskNumber: '5 Tasks'));

    taskList.add(TaskData(
        taskColor: colorOne,
        taskDate: 'May 2020',
        taskName: 'Profile Design',
        taskNumber: '2 Tasks'));
    taskList.add(TaskData(
        taskColor: colorTwo, taskDate: 'May 2020', taskName: 'UI Design', taskNumber: '6 Tasks'));
    taskList.add(TaskData(
        taskColor: colorThree,
        taskDate: 'May 2020',
        taskName: 'DashBoard Design',
        taskNumber: '5 Tasks'));

    taskList.add(TaskData(
        taskColor: colorOne,
        taskDate: 'May 2020',
        taskName: 'DashBoard Design',
        taskNumber: '7 Tasks'));
    taskList.add(TaskData(
        taskColor: colorTwo,
        taskDate: 'May 2020',
        taskName: 'Profile Design',
        taskNumber: '8 Tasks'));
    taskList.add(TaskData(
        taskColor: colorThree,
        taskDate: 'May 2020',
        taskName: 'DashBoard Design',
        taskNumber: '8 Tasks'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: taskList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 150,
              margin: EdgeInsets.only(right: 15),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: taskList[index].taskColor,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      taskList[index].taskNumber,
                      style: TextStyle(color: Color(0xff3C8ABA), fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    taskList[index].taskName,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      taskList[index].taskDate,
                      style: TextStyle(color: Color(0xff3C8ABA), fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class TaskData {
  String taskNumber;
  String taskName;
  String taskDate;
  Color taskColor;

  TaskData({this.taskNumber, this.taskName, this.taskDate, this.taskColor});
}
