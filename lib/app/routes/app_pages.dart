import 'package:get/get.dart';

import 'package:ayus/app/modules/account/bindings/account_binding.dart';
import 'package:ayus/app/modules/account/views/account_view.dart';
import 'package:ayus/app/modules/consult/bindings/consult_binding.dart';
import 'package:ayus/app/modules/consult/views/consult_view.dart';
import 'package:ayus/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:ayus/app/modules/dashboard/views/dashboard_view.dart';
import 'package:ayus/app/modules/history/bindings/history_binding.dart';
import 'package:ayus/app/modules/history/views/history_view.dart';
import 'package:ayus/app/modules/home/bindings/home_binding.dart';
import 'package:ayus/app/modules/home/views/home_view.dart';
import 'package:ayus/app/modules/splash/bindings/splash_binding.dart';
import 'package:ayus/app/modules/splash/views/splash_view.dart';
import 'package:ayus/app/modules/unknown_page/bindings/unknown_page_binding.dart';
import 'package:ayus/app/modules/unknown_page/views/unknown_page_view.dart';
import 'package:ayus/app/routes/route_model.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final GetPage unknownRoute = GetPage(
    name: _Paths.UNKNOWN_PAGE,
    page: () => const UnknownPageView(),
    binding: UnknownPageBinding(),
  );

  static final List<GetPage> routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
  ];

  static final List<RouteModel> nestedRoutes = [
    RouteModel(
      title: 'Home',
      icon: 'assets/images/Home.png',
      route: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    RouteModel(
      title: 'Consult',
      icon: 'assets/images/Consult.png',
      route: _Paths.CONSULT,
      page: () => const ConsultView(),
      binding: ConsultBinding(),
    ),
    RouteModel(
      title: 'History',
      icon: 'assets/images/History.png',
      route: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    RouteModel(
      title: 'My Account',
      icon: 'assets/images/Account.png',
      route: _Paths.ACCOUNT,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ),
  ];
}
