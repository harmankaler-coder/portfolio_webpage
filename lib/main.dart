import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'core/theme/app_theme.dart';
import 'data/project_data.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/project_details_screen.dart';

void main() {
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Harman Kaler',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,

      // CONFIGURING THE ROUTER
      routerConfig: GoRouter(
        routes: [
          // 1. Home Route
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),

          // 2. Project Details Route (Dynamic ID)
          GoRoute(
            path: '/project/:id',
            builder: (context, state) {
              final id = state.pathParameters['id'];
              // Find the project that matches the ID
              final project = portfolioProjects.firstWhere(
                    (p) => p.id == id,
                orElse: () => portfolioProjects[0], // Fallback if not found
              );
              return ProjectDetailsScreen(project: project);
            },
          ),
        ],
      ),
    );
  }
}