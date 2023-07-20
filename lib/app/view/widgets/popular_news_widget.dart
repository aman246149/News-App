import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/theme/app_color.dart';
import '../../../global/theme/text_theme.dart';
import '../../../global/utils/shimmer_effect.dart';
import '../../../global/widgets/hspace.dart';
import '../../../global/widgets/vspace.dart';
import '../../viewmodel/news_view_model.dart';

class PopularNews extends StatelessWidget {
  const PopularNews({super.key, this.isPhysicsRequired = false});
  final bool isPhysicsRequired;

  @override
  Widget build(BuildContext context) {
    final newsWatch = context.watch<NewsViewModel>();
    return ListView.separated(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      itemCount: newsWatch.popularNews?.length ?? 0,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const Vspace(
        height: 15,
      ),
      physics: isPhysicsRequired
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/newsDetails',
                arguments: newsWatch.popularNews![index]);
          },
          child: Row(
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
                        imageUrl:
                            newsWatch.popularNews?[index].urlToImage ?? "",
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
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.black)),
                  ),
                ],
              ),
              const Hspace(
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
          ),
        );
      },
    );
  }
}
