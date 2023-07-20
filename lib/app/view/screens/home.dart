import 'package:flutter/material.dart';
import 'package:newsapp/app/view/widgets/app_bar.dart';
import 'package:newsapp/app/viewmodel/news_view_model.dart';
import 'package:newsapp/global/widgets/vspace.dart';
import 'package:provider/provider.dart';

import '../../../global/theme/app_color.dart';
import '../../../global/widgets/divider.dart';
import '../widgets/headline.dart';
import '../widgets/news_Category.dart';
import '../widgets/popular_news_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewmodel = context.read<NewsViewModel>();
      viewmodel.fetchHeadLine("in", viewmodel.category[0].toLowerCase());
      viewmodel.fetchEveryThing(viewmodel.category[0].toLowerCase());
    });
  }

  @override
  Widget build(BuildContext context) {
    final newsRead = context.read<NewsViewModel>();
    final newsWatch = context.watch<NewsViewModel>();
    return Scaffold(
      backgroundColor: AppColor.yellow,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppDivider(),
            NewsCategory(newsWatch: newsWatch, newsRead: newsRead),
            const AppDivider(),
            const Vspace(
              height: 20,
            ),
            newsWatch.isLoading
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const HeadLine(),
            newsWatch.isLoading ? const SizedBox() : const PopularNews()
          ],
        ),
      ),
    );
  }
}

