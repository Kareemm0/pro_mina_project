import 'package:go_router/go_router.dart';
import 'package:pro_mina_project/Features/Home/Presentaion/Views/home_screen.dart';
import 'package:pro_mina_project/Features/Login/Presentaion/Views/login_screen.dart';

abstract class AppRouter {
  static const inialPage = "/";
  static const homescreen = "/homescreen";

  static final router = GoRouter(routes: [
    GoRoute(
      path: inialPage,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: homescreen,
      builder: (context, state) => const HomeScreen(),
    )
  ]);
}
