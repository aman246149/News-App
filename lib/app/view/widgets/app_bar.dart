import 'package:flutter/material.dart';

import '../../../global/theme/app_color.dart';
import '../../../global/theme/text_theme.dart';
import '../screens/search.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "NEWS",
        style: AppStyle.blackBold24,
      ),
      backgroundColor: AppColor.yellow,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ));
            },
            icon: const Icon(Icons.search)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
