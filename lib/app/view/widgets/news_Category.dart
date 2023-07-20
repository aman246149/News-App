// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../global/theme/app_color.dart';
import '../../../global/theme/text_theme.dart';
import '../../../global/widgets/hspace.dart';
import '../../viewmodel/news_view_model.dart';

class NewsCategory extends StatelessWidget {
  const NewsCategory({
    super.key,
    required this.newsWatch,
    required this.newsRead,
  });

  final NewsViewModel newsWatch;
  final NewsViewModel newsRead;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: newsWatch.category.length,
        separatorBuilder: (context, index) => const Hspace(
          width: 15,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              newsRead.setSelectedNewsCategoryIndex(index);
              newsRead.fetchHeadLine(
                  "in", newsRead.category[index].toLowerCase());
              newsRead.fetchEveryThing(newsRead.category[index].toLowerCase());
            },
            child: Center(
              child: Text(
                newsWatch.category[index],
                style: AppStyle.blackMedium16.copyWith(
                    color: newsWatch.selectedNewsCategoryIndex == index
                        ? AppColor.black
                        : AppColor.grey,
                    fontWeight: newsWatch.selectedNewsCategoryIndex == index
                        ? FontWeight.w600
                        : FontWeight.w500),
              ),
            ),
          );
        },
      ),
    );
  }
}
