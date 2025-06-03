import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Entry Point Aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Navigasi Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      // Gunakan onGenerateRoute untuk mengelola arguments
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const HomeScreen());
          case '/detail':
            final args = settings.arguments as String? ?? 'Hello from Home!';
            return MaterialPageRoute(builder: (_) => DetailScreen(data: args));
          case '/settings':
            final args = settings.arguments as String? ?? 'Guest';
            return MaterialPageRoute(builder: (_) => SettingsScreen(username: args));
          case '/about':
            return MaterialPageRoute(builder: (_) => const AboutScreen());
          default:
            return null;
        }
      },
    );
  }
}

// HomeScreen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailScreen(data: 'Data from Home (Push)'),
                  ),
                );
              },
              child: const Text('Go to Detail (Push)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/detail', arguments: 'Data from Home (Named)');
              },
              child: const Text('Go to Detail (Named Route)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings', arguments: 'Siti Intan Nia');
              },
              child: const Text('Go to Settings'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: const Text('Go to About'),
            ),
          ],
        ),
      ),
    );
  }
}

// DetailScreen
class DetailScreen extends StatelessWidget {
  final String data;

  const DetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Received Data: $data', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

// SettingsScreen
class SettingsScreen extends StatelessWidget {
  final String username;

  const SettingsScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as String? ?? username;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username: $args', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

// AboutScreen
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Screen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Ini adalah halaman About.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
