import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:newsapp/app/viewmodel/news_view_model.dart';
import 'package:newsapp/global/utils/time_ago.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../global/theme/app_color.dart';
import '../../../global/theme/text_theme.dart';
import '../../../global/utils/shimmer_effect.dart';
import '../../../global/widgets/hspace.dart';
import '../../../global/widgets/vspace.dart';
import 'inappwebview.dart';

class HeadLine extends StatelessWidget {
  const HeadLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final newsWatch = context.watch<NewsViewModel>();
    return newsWatch.newsModel == null || newsWatch.newsModel!.isEmpty
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "HEADLINE",
                  style: AppStyle.blackBold16,
                ),
                const Vspace(
                  height: 15,
                ),
                Text(
                  newsWatch.newsModel?[0].title ?? "",
                  style: AppStyle.blackBold24,
                ),
                const Vspace(
                  height: 25,
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.saturation,
                        ),
                        child: Image.network(
                          newsWatch.newsModel?[0].urlToImage ?? "",
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: double.infinity - 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.black)),
                    ),

                    // ShimmerWidget(
                    //   child: Container(
                    //     height: 200,
                    //     width: double.infinity,
                    //     color: Colors.white,
                    //   ),
                    // )
                  ],
                ),
                const Vspace(
                  height: 18,
                ),
                RichText(
                  text: TextSpan(
                    style: AppStyle.blackMedium16.copyWith(
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: newsWatch.newsModel?[0].description ?? "",
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InAppWeb(
                                      url: newsWatch.newsModel?[0].url ?? ""),
                                ));
                          },
                          child: Text(
                            "  ....MORE",
                            style: AppStyle.blackBold16.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Vspace(
                  height: 18,
                ),
                Row(
                  children: [
                    Icon(Icons.favorite_border),
                    Hspace(
                      width: 20,
                    ),
                    Icon(Icons.volume_up),
                    Expanded(
                        child: SizedBox(
                            width: 0)), // This is similar to Hspace(width: 0)
                    Icon(Icons.access_time_outlined),
                    Hspace(
                      width: 5,
                    ),
                    Text(formatTimeAgo(DateTime.parse(
                        newsWatch.newsModel?[0].publishedAt ?? "")))
                  ],
                ),
                const Vspace(
                  height: 20,
                ),
              ],
            ),
          );
  }
}
