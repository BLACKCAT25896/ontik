import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: () {},
          icon: Icon(Icons.menu,color: Get.theme.colorScheme.onSurface,size: 30,)),
      actions: [
        IconButton(onPressed: () {},
            icon: Icon(Icons.notifications_none_rounded,color: Get.theme.colorScheme.onSurface,size: 30,)),
        IconButton(onPressed: () {},
            icon: Icon(Icons.search,color: Get.theme.colorScheme.onSurface,size: 30,)),
      ],
      backgroundColor: Colors.transparent,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
