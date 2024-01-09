import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/presentation/screens/screens.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/buttons',
    builder: (context, state) => const ButtonScreen(),
  ),
  GoRoute(
    path: '/cards',
    builder: (context, state) => const CardsScreen(),
  ),
]);
