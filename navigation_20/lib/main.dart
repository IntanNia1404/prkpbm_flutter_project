import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Model data Item
class Item {
  final int id;
  final String name;
  final String description;

  Item({
    required this.id,
    required this.name,
    required this.description,
  });
}

// Aplikasi utama
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Item? _selectedItem;

  final List<Item> _items = [
    Item(id: 1, name: 'Item 1', description: 'Deskripsi untuk Item 1'),
    Item(id: 2, name: 'Item 2', description: 'Deskripsi untuk Item 2'),
    Item(id: 3, name: 'Item 3', description: 'Deskripsi untuk Item 3'),
  ];

  void _selectItem(Item item) {
    setState(() {
      _selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(items: _items, onItemTap: _selectItem),
        '/detail': (context) => DetailScreen(item: _selectedItem),
      },
    );
  }
}

// Layar Home
class HomeScreen extends StatelessWidget {
  final List<Item> items;
  final Function(Item) onItemTap;

  const HomeScreen({
    super.key,
    required this.items,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            onTap: () {
              onItemTap(item);
              Navigator.pushNamed(context, '/detail');
            },
          );
        },
      ),
    );
  }
}

// Layar Detail
class DetailScreen extends StatelessWidget {
  final Item? item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detail')),
        body: const Center(child: Text('Item tidak ditemukan')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Detail - ${item!.name}')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Vertikal tengah
          crossAxisAlignment: CrossAxisAlignment.center, // Horizontal tengah
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ID: ${item!.id}',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Nama: ${item!.name}',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Deskripsi: ${item!.description}',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke HomeScreen
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
