import 'package:flutter/material.dart';
import 'main.dart';
import 'cook.dart';
import 'user.dart';
import 'login.dart';
import 'menu.dart';
import 'cooksettings.dart';
import 'Images.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    final loggedin = false;
    final cook = true;

    if (!loggedin) {
      switch (settings.name) {
        case '/':
          return MaterialPageRoute(builder: (_) => Login());
          break;
        case '/signup':
          return MaterialPageRoute(builder: (_) => HomePage());
          break;
        case '/cook':
          // Validation of correct data type
          if (args is String) {
            return MaterialPageRoute(
              builder: (_) => Cook(
                data: args,
              ),
            );
          }
          break;
        case '/user':
          if (args is String) {
            return MaterialPageRoute(
              builder: (_) => User(
                data: args,
              ),
            );
          }
          // If args is not of the correct type, return an error page.
          // You can also throw an exception while in development.
          return _errorRoute();
        default:
          // If there is no such named route in the switch statement, e.g. /third
          return _errorRoute();
      }
    } else if (loggedin && cook) {
      switch (settings.name) {
        case '/':
          return MaterialPageRoute(builder: (_) => Menu());
        case '/settings':
          // Validation of correct data type
          if (args is String) {
            return MaterialPageRoute(
              builder: (_) => CookSettings(
                data: args,
              ),
            );
          }
          break;
        case '/images':
          if (args is String) {
            return MaterialPageRoute(
              builder: (_) => Images(
                data: args,
              ),
            );
          }
          return _errorRoute();
        default:
          return _errorRoute();
      }
    } else {
      /*switch (settings.name) {
        case '/':
          return MaterialPageRoute(builder: (_) => LocalMenu());
        case '/settings':
          // Validation of correct data type
          if (args is String) {
            return MaterialPageRoute(
              builder: (_) => UserSettings(
                data: args,
              ),
            );
          }
          break;
        case '/images':
          if (args is String) {
            return MaterialPageRoute(
              builder: (_) => Images(
                data: args,
              ),
            );
          }

          return _errorRoute();
        default:
          return _errorRoute();
      }*/
    }

    return null;
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
