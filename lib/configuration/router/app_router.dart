import 'package:conoce_beta/presentation/home/main_home.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainHome(),
    ),
  ],
);
