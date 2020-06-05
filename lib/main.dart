import 'package:flutter/material.dart';
import 'package:task_management_app/task_widget.dart';

import 'new_task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static var colorBlue = Color(0xffA39AFF);
  static var colorPurple = Color(0xff4F387B);
  static var colorTabBarTitle = Color(0xffFF97B5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        child: Image.asset(
                          'assets/images/nilu.jpg',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Nilesh Rathod',
                            style: TextStyle(color: colorPurple, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            '30 May 2020',
                            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'My Task',
                        style: TextStyle(
                            color: colorPurple, fontWeight: FontWeight.bold, fontSize: 25.0),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.add,
                            color: colorPurple,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => CreateNewTask()));
                          })
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: DefaultTabController(
                    length: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TabBar(
                          indicator: DotTabIndicator(color: colorTabBarTitle, radius: 10.0),
                          labelColor: colorTabBarTitle,
                          indicatorColor: colorTabBarTitle,
                          unselectedLabelColor: colorPurple,
                          isScrollable: true,
                          tabs: <Widget>[
                            Tab(
                              child: Text('Recent'),
                            ),
                            Tab(
                              child: Text('Today'),
                            ),
                            Tab(
                              child: Text('Upcoming'),
                            ),
                            Tab(
                              child: Text('Later'),
                            ),
                          ],
                        ),
                        Expanded(
                            child: TabBarView(
                          children: <Widget>[
                            TaskPage(),
                            TaskPage(),
                            TaskPage(),
                            TaskPage(),
                          ],
                        ))
                      ],
                    ),
                  ))
                ],
              ))),
    );
  }
}

class DotTabIndicator extends Decoration {
  final BoxPainter _painter;

  DotTabIndicator({@required Color color, @required double radius})
      : _painter = DrawTriangle(color);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class DrawTriangle extends BoxPainter {
  Paint _paint;

  DrawTriangle(Color color) {
    _paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset triangleOffset = offset + Offset(cfg.size.width / 2, cfg.size.height - 10);
    var path = Path();

    path.moveTo(triangleOffset.dx, triangleOffset.dy);
    path.lineTo(triangleOffset.dx + 10, triangleOffset.dy + 10);
    path.lineTo(triangleOffset.dx - 10, triangleOffset.dy + 10);

    path.close();
    canvas.drawCircle(triangleOffset, 5.0, _paint);
  }
}
