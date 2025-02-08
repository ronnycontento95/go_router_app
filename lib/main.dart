
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_app/screens/chat.dart';
import 'package:go_router_app/screens/discover.dart';
import 'package:go_router_app/screens/filters.dart';
import 'package:go_router_app/screens/likes.dart';
import 'package:go_router_app/screens/login.dart';
import 'package:go_router_app/screens/matches.dart';
import 'package:go_router_app/screens/profile.dart';
import 'package:go_router_app/screens/settings.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/', // default route will be the login.
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) => const ChatScreen(),
    ),
    GoRoute(
      path: '/discover',
      builder: (context, state) => const DiscoverScreen(),
    ),
    GoRoute(
      path: '/filters',
      builder: (context, state) => const FiltersScreen(),
    ),
    GoRoute(
      path: '/likes',
      builder: (context, state) => const LikesScreen(),
    ),
    GoRoute(
      path: '/matches',
      builder: (context, state) => const MatchesScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: "Pull",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
