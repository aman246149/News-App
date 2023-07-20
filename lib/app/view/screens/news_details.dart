import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/app/model/news_model.dart';
import 'package:newsapp/global/theme/app_color.dart';
import 'package:newsapp/global/widgets/hspace.dart';

import '../../../global/theme/text_theme.dart';
import '../../../global/utils/shimmer_effect.dart';
import '../../../global/utils/time_ago.dart';
import '../../../global/widgets/vspace.dart';

class NewsDetails extends StatefulWidget {
  final NewsModel newsModel;
  const NewsDetails({super.key, required this.newsModel});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cyan,
      appBar: AppBar(
        backgroundColor: AppColor.cyan,
        actions: const [
          Icon(Icons.text_fields),
          Hspace(
            width: 20,
          ),
          Icon(Icons.volume_up),
          Hspace(
            width: 20,
          ),
          Icon(Icons.share),
          Hspace(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.newsModel.sourceModel?.category ?? "",
              style: AppStyle.blackBold16,
            ),
            const Vspace(
              height: 15,
            ),
            Text(
              widget.newsModel.title ?? "",
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
                      imageUrl: widget.newsModel.urlToImage ?? "",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const ShimmerWidget(),
                      errorWidget: (context, url, error) =>
                          const ShimmerWidget(),
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity - 100,
                  decoration:
                      BoxDecoration(border: Border.all(color: AppColor.black)),
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
                      widget.newsModel.description ?? "",
                      style: AppStyle.blackMedium16,
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
                        width: 0)), // This is similar to Hspace(width: 0)
                const Icon(Icons.access_time_outlined),
                const Hspace(
                  width: 5,
                ),
                Text(formatTimeAgo(
                    DateTime.parse(widget.newsModel.publishedAt ?? "")))
              ],
            ),
            const Vspace(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
