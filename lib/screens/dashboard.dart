import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: ListView(
            children: showBody(),
          )),
    );
  }

  List<Widget> showBody() {
    List<Widget> widgets = List();

    widgets.add(showProfileBlock());

    widgets.add(SizedBox(
      height: 30.0,
    ));

    for (int i = 0; i < 10; i++) {
      widgets.add(showRankRow(i));
    }

    return widgets;
  }

  Widget showProfileBlock() {
    return Container(
      height: 300.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          colors: [
            Colors.white,
            Colors.deepPurple
          ]
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60.0),
          bottomRight: Radius.circular(60.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              height: 90.0,
              width: 90.0,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(45.0)
              ),
              child: Center(
                child: Text(
                  'S',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 60,
                  ),
                ),
              ),),
          Text(
            'Sourav Mandal',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Text(
            'souravmandalm@gmail.com',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            '22',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 60,
            ),
          ),
          Text(
            'points',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget showRankRow(int index) {
    Widget rankRow = Card(
      child: Row(
        children: <Widget>[
          Container(
            height: 70.0,
            width: 70.0,
            child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Center(
                  child: Text('#1'),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                    side: BorderSide(color: Colors.blue, width: 1.0))),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Player Name'),
                ]),
          ),
          Container(
            height: 70.0,
            width: 70.0,
            child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Center(
                  child: Text('23'),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                    side: BorderSide(color: Colors.blue, width: 1.0))),
          )
        ],
      ),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
    );

    return rankRow;
  }
}
