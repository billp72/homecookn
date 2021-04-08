import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  // This is a String for the sake of an example.
  // You can use any type you want.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('On The Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Order',
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
