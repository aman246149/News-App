// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/global/theme/text_theme.dart';
import 'package:newsapp/global/widgets/vspace.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/news_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHomeScreen();
  }

  Future<void> navigateToHomeScreen() async {
    // Wait for 2 seconds using Future.delayed
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final viewmodel = context.read<NewsViewModel>();
      await viewmodel.fetchHeadLine(
          "in", viewmodel.category[0].toLowerCase(), context);
      await viewmodel.fetchEveryThing(
          viewmodel.category[0].toLowerCase(), context);
      Navigator.pushReplacementNamed(context, '/home');
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/loading.json',
                width: MediaQuery.of(context).size.width / 2),
            const Vspace(
              height: 15,
            ),
            Text(
              "Loading",
              style: AppStyle.blackBold24,
            ),
          ],
        ),
      ),
    );
  }
}
