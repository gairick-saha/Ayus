import 'package:flutter/material.dart';

// class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const HomeAppBar({Key? key}) : super(key: key);

//   @override
//   Size get preferredSize => const Size(
//         double.maxFinite,
//         kToolbarHeight + 20,
//       );

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       automaticallyImplyLeading: false,
//       toolbarHeight: preferredSize.height,
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       centerTitle: true,
//       title: SizedBox.square(
//         dimension: 90,
//         child: Image.asset(
//           'assets/images/Ayus-Logo.png',
//           scale: 1,
//           filterQuality: FilterQuality.high,
//         ),
//       ),
//       // actions: actions,
//     );
//   }
// }

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: kToolbarHeight + 20,
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: SizedBox.square(
        dimension: 90,
        child: Image.asset(
          'assets/images/Ayus-Logo.png',
          scale: 1,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
