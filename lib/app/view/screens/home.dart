import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/app/view/widgets/app_bar.dart';
import 'package:newsapp/app/viewmodel/news_view_model.dart';
import 'package:newsapp/global/theme/text_theme.dart';
import 'package:newsapp/global/widgets/hspace.dart';
import 'package:newsapp/global/widgets/vspace.dart';
import 'package:provider/provider.dart';

import '../../../global/theme/app_color.dart';
import '../../../global/utils/shimmer_effect.dart';
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
            newsWatch.isLoading ? SizedBox() : PopularNews()
          ],
        ),
      ),
    );
  }
}

class PopularNews extends StatelessWidget {
  const PopularNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final newsWatch = context.watch<NewsViewModel>();
    return ListView.separated(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      itemCount: newsWatch.popularNews?.length ?? 0,
      shrinkWrap: true,
      separatorBuilder: (context, index) => Vspace(
        height: 15,
      ),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.saturation,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: newsWatch.popularNews?[index].urlToImage ?? "",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const ShimmerWidget(),
                      errorWidget: (context, url, error) =>
                          const ShimmerWidget(),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration:
                      BoxDecoration(border: Border.all(color: AppColor.black)),
                ),
              ],
            ),
            Hspace(
              width: 12,
            ),
            Expanded(
              // Wrap the Column with Expanded to allow it to take available space
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsWatch.popularNews?[index].author ?? "",
                    style: AppStyle.blackMedium16,
                    // Optionally, set maxLines and overflow to handle long titles
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    newsWatch.popularNews?[index].title ?? "",
                    style: AppStyle.blackBold16,
                    // Optionally, set maxLines and overflow to handle long subtitles
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
