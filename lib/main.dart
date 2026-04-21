import 'package:flutter/material.dart';
import 'package:aplikasi_pertama_gua/about/about.dart';
import 'package:aplikasi_pertama_gua/login/login.dart';
import 'package:aplikasi_pertama_gua/setting/settings.dart';
import 'package:aplikasi_pertama_gua/data/data.dart';

void main() {
  runApp(const MyAplikasi());
}

class MyAplikasi extends StatelessWidget {
  const MyAplikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Flutter List App', home: HomePage());
  }
}

// ─── HOME PAGE ───────────────────────────────────────────
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  bool _fabOpen = false;
  late AnimationController _animController;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _scaleAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _toggleFab() {
    setState(() => _fabOpen = !_fabOpen);
    _fabOpen ? _animController.forward() : _animController.reverse();
  }

  void _showAlert(BuildContext context, Map<String, String> contact) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(contact['name']!),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(contact['image']!),
            ),
            const SizedBox(height: 12),
            Text(contact['message']!),
            const SizedBox(height: 4),
            Text(
              contact['time']!,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Chat'),
          ),
        ],
      ),
    );
  }

  // ─── FAB MENU ITEM ───────────────────────────────────────
  Widget _buildFabItem({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ScaleTransition(
      scale: _scaleAnim,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Label
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
              ),
              child: Text(label, style: const TextStyle(fontSize: 13)),
            ),
            const SizedBox(width: 10),
            // Icon button
            FloatingActionButton.small(
              heroTag: label,
              backgroundColor: color,
              onPressed: onTap,
              child: Icon(icon, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter List App'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              delegate: ContactSearchDelegate(contacts),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsPage()),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(contact['image']!),
              onBackgroundImageError: (_, __) {},
            ),
            title: Text(contact['name']!),
            subtitle: Text(contact['message']!),
            trailing: Text(
              contact['time']!,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            onTap: () => _showAlert(context, contact),
          );
        },
      ),

      // ─── FAB SPEED DIAL ──────────────────────────────────
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Menu items (muncul pas FAB dibuka)
          _buildFabItem(
            icon: Icons.videocam,
            label: 'Video Call',
            color: Colors.blue,
            onTap: () {
              _toggleFab();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Video Call ditekan')),
              );
            },
          ),
          _buildFabItem(
            icon: Icons.call,
            label: 'Telepon',
            color: Colors.orange,
            onTap: () {
              _toggleFab();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Telepon ditekan')),
              );
            },
          ),
          _buildFabItem(
            icon: Icons.person_add,
            label: 'Kontak Baru',
            color: Colors.purple,
            onTap: () {
              _toggleFab();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tambah kontak ditekan')),
              );
            },
          ),

          // Tombol utama (ikon chat kayak WhatsApp)
          FloatingActionButton(
            heroTag: 'main_fab',
            backgroundColor: Colors.green,
            onPressed: _toggleFab,
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animController,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── SEARCH DELEGATE ─────────────────────────────────────
class ContactSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> contacts;
  ContactSearchDelegate(this.contacts);

  @override
  List<Widget> buildActions(BuildContext context) => [
    IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
  ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => close(context, null),
  );

  @override
  Widget buildResults(BuildContext context) => _buildList();

  @override
  Widget buildSuggestions(BuildContext context) => _buildList();

  Widget _buildList() {
    final results = contacts
        .where((c) => c['name']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final contact = results[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(contact['image']!),
          ),
          title: Text(contact['name']!),
          subtitle: Text(contact['message']!),
        );
      },
    );
  }
}