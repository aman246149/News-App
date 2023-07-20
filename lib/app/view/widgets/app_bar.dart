import 'package:flutter/material.dart';

import '../../../global/theme/app_color.dart';
import '../../../global/theme/text_theme.dart';
import '../../../global/widgets/hspace.dart';

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
      actions: const [
        Icon(Icons.menu),
        Hspace(
          width: 20,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
