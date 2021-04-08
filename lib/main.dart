import 'package:flutter/material.dart';
import 'route_generator.dart';
import 'package:responsive_grid/responsive_grid.dart';

const green = Colors.green;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Initially display FirstPage
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Cookn'),
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.15), BlendMode.dstATop),
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
                child: ResponsiveGridRow(children: [
              ResponsiveGridCol(
                xs: 12,
                child: Container(
                  height: 200,
                  alignment: Alignment(0, 0),
                  //color: Colors.blue,
                  child: Text(""),
                ),
              ),
              ResponsiveGridCol(
                lg: 12,
                child: Container(
                  height: 80,
                  alignment: Alignment(0, 0),
                  child: Text(
                      'Welcome to Home Cookn\', a place to order home-cooked meals and have them delivered directly from their home to users. Peruse home cooks in your area to see what\'s on the menu for today.',
                      maxLines: 10,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.3,
                          color: Colors.grey[600],
                          fontStyle: FontStyle.italic)),
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                  height: 100,
                  alignment: Alignment(0, 0),
                  //color: Colors.green,
                  child: RaisedButton(
                    child: new Text('BECOME A HOME COOK',
                        style: new TextStyle(fontSize: 15.0)),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/cook',
                        arguments: 'Hello new cook!',
                      );
                    },
                  ),
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                  height: 100,
                  alignment: Alignment(0, 0),
                  //color: Colors.orange,
                  child: RaisedButton(
                    child: new Text('WHAT\'S ON THE MENU',
                        style: new TextStyle(fontSize: 15.0)),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/order',
                        arguments: 'Find home cookn!',
                      );
                    },
                  ),
                ),
              ),
              /**/
            ]))));
  }
}
