import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  const CustomAppBar({
    Key? key,
    this.title = '',
    this.actions,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size(double.maxFinite, kToolbarHeight + 30);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: preferredSize.height,
      title: Text(
        title!,
      ),
      actions: actions,
    );
  }
}
