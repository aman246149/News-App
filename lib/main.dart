import 'package:flutter/material.dart';
import 'package:newsapp/app/view/screens/home.dart';
import 'package:newsapp/app/viewmodel/news_view_model.dart';
import 'package:newsapp/global/theme/app_color.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsViewModel(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true, primaryColor: AppColor.yellow),
        home: const HomeScreen(),
      ),
    );
  }
}
