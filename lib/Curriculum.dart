import 'package:flutter/material.dart';

class Curriculum  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('커리큘럼'),
        ),
        body: Center(
          child:
              SizedBox(
                child: Image.asset('images/curriculum.png')
              ),
        ),
      ),
    );
  }
}