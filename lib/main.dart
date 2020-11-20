import 'package:flutter/material.dart';
import 'ExpansionList.dart';
import 'package:memorize72verses/Curriculum.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;

  final tabs = [
    Center(child: Text('home')),

    Center(child:
      ExpansionList(),
    ),

    Center(child:
        Curriculum(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Bottom Navi'),
        // ),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,

            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.mail),
                title: Text('암송'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('커리큘럼'),
              )
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
        ));
  }
}