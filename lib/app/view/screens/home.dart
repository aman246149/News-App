import 'package:flutter/material.dart';
import 'package:newsapp/app/view/widgets/app_bar.dart';
import 'package:newsapp/app/viewmodel/news_view_model.dart';
import 'package:newsapp/global/network/api_client.dart';
import 'package:newsapp/global/network/api_key.dart';
import 'package:newsapp/global/utils/custom_snackbar.dart';
import 'package:newsapp/global/utils/shimmer_effect.dart';
import 'package:newsapp/global/widgets/vspace.dart';
import 'package:provider/provider.dart';

import '../../../global/theme/app_color.dart';
import '../../../global/widgets/divider.dart';
import '../widgets/headline.dart';
import '../widgets/news_Category.dart';

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
    });
  }

  @override
  Widget build(BuildContext context) {
    final newsRead = context.read<NewsViewModel>();
    final newsWatch = context.watch<NewsViewModel>();
    return Scaffold(
      backgroundColor: AppColor.purple,
      appBar: const CustomAppBar(),
      body: newsWatch.isLoading
          ? ShimmerWidget(
              child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
            ))
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppDivider(),
                  NewsCategory(newsWatch: newsWatch, newsRead: newsRead),
                  const AppDivider(),
                  const Vspace(
                    height: 20,
                  ),
                  const HeadLine(),
                  const AppDivider(),
                ],
              ),
            ),
    );
  }
}
