import 'package:flutter/material.dart';
import 'package:newsapp/app/view/screens/search.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/search':
        return scaleTransitionPageBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SearchScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("404 No Page Found"),
            ),
          ),
        );
    }
  }
}

PageRouteBuilder scaleTransitionPageBuilder({
  required Widget Function(BuildContext, Animation<double>, Animation<double>)
      pageBuilder,
}) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: pageBuilder,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = 0.8;
      var end = 1.0;
      var curve = Curves.easeInOut;

      // var scaleAnimation =
      //     Tween(begin: begin, end: end).animate(CurvedAnimation(
      //   parent: animation,
      //   curve: Interval(0.0, 0.5, curve: curve),
      // ));

      // var reverseScaleAnimation =
      //     Tween(begin: end, end: begin).animate(CurvedAnimation(
      //   parent: animation,
      //   curve: Interval(0.5, 1.0, curve: curve),
      // ));

      return ScaleTransition(
        scale: animation.drive(CurveTween(curve: curve)),
        child: ScaleTransition(
          scale: animation.drive(Tween(begin: begin, end: end)
              .chain(CurveTween(curve: curve.flipped))),
          child: child,
        ),
      );
    },
  );
}
