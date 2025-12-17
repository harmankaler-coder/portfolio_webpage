class Project {
  final String id;
  final String title;
  final String description;
  final String fullDescription;
  final List<String> tags;
  final String? link;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.fullDescription,
    required this.tags,
    this.link,
  });
}

final List<Project> portfolioProjects = [
  Project(
    id: "kairos",
    title: "Kairos Productivity App",
    description: "A cross-platform productivity suite featuring analytics, habit tracking, and visual progress dashboards.",
    fullDescription: "Kairos is a comprehensive productivity application based on 12 week year methodology designed to enhance user efficiency through structured planning and positive reinforcement.\n\nKey Technical Features:\n• Built a scalable, widget-based UI ensuring consistent performance across iOS and Android.\n• Implemented complex analytics dashboards to visualize weekly progress.\n• Engineered a notification system for timely reminders and motivational prompts.\n• focused on user retention strategies through visual progress tracking.",
    tags: ["Flutter", "Dart", "Bloc", "Analytics"],
    link: "https://github.com/harmankaler-coder/Kairos",
  ),
  Project(
    id: "nexa-ai",
    title: "Nexa AI Assistant",
    description: "Intelligent voice-activated assistant capable of generating text and images using GPT & NLP.",
    fullDescription: "Nexa bridges the gap between voice interaction and generative AI. It is a smart assistant capable of understanding natural language to generate both text responses and image assets.\n\nKey Technical Features:\n• Integrated GPT models for high-accuracy text and image generation.\n• Developed custom NLP pipelines to handle voice-to-text processing seamlessly.\n• Designed a chat interface with real-time streaming responses for a natural conversation flow.\n• Optimized API calls to ensure low-latency interaction.",
    tags: ["Flutter", "Dart", "NLP", "Voice API", "GPT-4"],
    link: "https://github.com/harmankaler-coder/Nexa",
  ),
  Project(
    id: "music-player",
    title: "Wish Music",
    description: "Offline-first music streaming app with Supabase backend and Riverpod state management.",
    fullDescription: "A robust music streaming solution emphasizing performance and offline capabilities. This project demonstrates complex state management and cloud synchronization.\n\nKey Technical Features:\n• implemented an 'Offline-First' architecture using Hive for local storage.\n• Utilized Supabase for backend management, including authentication and real-time playlist syncing.\n• Managed complex app state (playback, queues, downloads) using Riverpod.\n• Implemented smart caching mechanisms to reduce data usage and improve load times.",
    tags: ["Flutter", "Dart", "Riverpod", "Hive", "Supabase"],
    link: "https://github.com/harmankaler-coder/music_player",
  ),
];