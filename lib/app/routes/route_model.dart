import 'package:get/get.dart';

class RouteModel {
  static final Map<String, RouteModel> routes = {};
  final String title;
  final String icon;
  final String route;
  final GetPageBuilder page;
  final Bindings binding;
  final List<GetMiddleware>? middlewares;

  RouteModel({
    required this.title,
    required this.icon,
    required this.route,
    required this.page,
    required this.binding,
    this.middlewares,
  }) {
    routes[route] = this;
  }
}
