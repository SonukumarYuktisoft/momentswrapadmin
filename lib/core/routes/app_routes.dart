class AppRoutes {
  AppRoutes._();
  static const String splashScreen = '/splash_screen';
  static const String dashboardScreen = '/';
  static const String loginScreen = '/login';

  static const String notFoundPage = '/unknown_route';

  static List routes = [
    splashScreen,
    dashboardScreen,
    loginScreen,
    notFoundPage
  ];
}