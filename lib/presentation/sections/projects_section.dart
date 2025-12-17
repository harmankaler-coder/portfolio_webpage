import 'package:flutter/material.dart';
import '../../core/utils/responsive.dart';
import '../../data/project_data.dart';
import '../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Responsive Grid Logic
    int crossAxisCount = 1;
    double childAspectRatio = 1.3;

    if (width >= 1100) {
      // Desktop: 3 Columns
      crossAxisCount = 3;
      childAspectRatio = 1.0; // Square cards provide more height room
    } else if (width >= 700) {
      // Tablet: 2 Columns
      crossAxisCount = 2;
      childAspectRatio = 1.1; // Slightly rectangular
    } else {
      // Mobile: 1 Column
      crossAxisCount = 1;
      childAspectRatio = 1.4; // Wide cards
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "PROJECTS",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 40),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: portfolioProjects.length,
          itemBuilder: (context, index) {
            return ProjectCard(project: portfolioProjects[index]);
          },
        ),
      ],
    );
  }
}