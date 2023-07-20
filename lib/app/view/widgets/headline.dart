import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/app/viewmodel/news_view_model.dart';
import 'package:newsapp/global/utils/time_ago.dart';
import 'package:provider/provider.dart';

import '../../../global/theme/app_color.dart';
import '../../../global/theme/text_theme.dart';
import '../../../global/utils/shimmer_effect.dart';
import '../../../global/widgets/divider.dart';
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
        : Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).size.height / 4),
            width: double.infinity,
            child: PageView(
                pageSnapping: true,
                children: newsWatch.newsModel!.map((e) {
                  return Padding(
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
                          e.title ?? "",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyle.blackBold24.copyWith(fontSize: 20),
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
                                child: CachedNetworkImage(
                                  imageUrl: e.urlToImage ?? "",
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      const ShimmerWidget(),
                                  errorWidget: (context, url, error) =>
                                      const ShimmerWidget(),
                                ),
                              ),
                            ),
                            Container(
                              height: 200,
                              width: double.infinity - 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.black)),
                            ),
                          ],
                        ),
                        const Vspace(
                          height: 14,
                        ),
                        RichText(
                          text: TextSpan(
                            style: AppStyle.blackMedium16,
                            children: [
                              WidgetSpan(
                                child: Text(
                                  e.description ?? "",
                                  style: AppStyle.blackMedium16,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              WidgetSpan(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              InAppWeb(url: e.url ?? ""),
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
                            const Icon(Icons.favorite_border),
                            const Hspace(
                              width: 20,
                            ),
                            const Icon(Icons.volume_up),
                            const Expanded(
                                child: SizedBox(
                                    width:
                                        0)), // This is similar to Hspace(width: 0)
                            const Icon(Icons.access_time_outlined),
                            const Hspace(
                              width: 5,
                            ),
                            Text(formatTimeAgo(
                                DateTime.parse(e.publishedAt ?? "")))
                          ],
                        ),
                        const Vspace(
                          height: 10,
                        ),
                        const AppDivider(),
                      ],
                    ),
                  );
                }).toList()));
  }
}
